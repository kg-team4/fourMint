package four.mint.web.admin;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itextpdf.text.DocumentException;

import four.mint.web.admin.banner.market.AdminBannerMarketService;
import four.mint.web.admin.banner.store.AdminBannerStoreService;
import four.mint.web.admin.login.AdminService;
import four.mint.web.admin.login.AdminVO;
import four.mint.web.admin.page.store.AdminPageStoreService;
import four.mint.web.admin.page.store.AdminPageStoreVO;
import four.mint.web.admin.qna.AdminQnaService;
import four.mint.web.admin.report.AdminReportService;
import four.mint.web.admin.report.AdminReportVO;
import four.mint.web.admin.table.member.AdminTableService;
import four.mint.web.admin.table.member.AdminTableVO;
import four.mint.web.admin.table.used.AdminUsedService;
import four.mint.web.admin.table.used.AdminUsedVO;
import four.mint.web.admin.transactionhistory.AdminTransactionHistoryService;
import four.mint.web.admin.transactionhistory.AdminTransactionHistoryVO;
import four.mint.web.user.UserService;
import four.mint.web.user.UserVO;
import four.mint.web.user.store.StoreCategoryBigVO;
import four.mint.web.user.store.StoreService;
import four.mint.web.user.store.StoreVO;
import net.sf.json.JSONArray;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;

	@Autowired
	private AdminBannerMarketService adminBannerMarketService;
	
	@Autowired
	private AdminBannerStoreService adminBannerStoreService;
	
	@Autowired
	private AdminPageStoreService adminPageStoreService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private AdminTableService adminTableService;
	
	@Autowired
	private AdminReportService adminReportService;

	@Autowired
	private StoreService storeService;
	
	@Autowired
	private AdminUsedService adminUsedService;
	
	@Autowired
	private AdminTransactionHistoryService adminTransactionHistoryService;
	
	@Autowired
	private AdminQnaService adminQnaService;
	
	@Autowired
	private AdminTransactionHistoryService adminThistoryService;
	
	//Thistory == TransactionHistory
	
	@RequestMapping(value = "/home.mdo", method = RequestMethod.GET)
	public String home(HttpServletRequest request, AdminVO vo, HttpSession session) {
		List<AdminReportVO> adminreportlist = adminReportService.getAdminReportList();
		
		int userCount = userService.getUserCount();
		request.setAttribute("userCount", userCount);
		
		int storeCount = adminPageStoreService.getStoreCount();
		request.setAttribute("storeCount", storeCount);
		
		int qnaCount = adminQnaService.getQNA();
		request.setAttribute("qnaCount", qnaCount);
		
		int totalPrice = adminTransactionHistoryService.getTotalPrice();
		request.setAttribute("totalPrice", totalPrice);
		
		session.setAttribute("lists", adminreportlist);
		
		vo.setId(String.valueOf(session.getAttribute("admin_id")));
		vo.setPassword(String.valueOf(session.getAttribute("admin_password")));
		AdminVO admin = adminService.getAdmin(vo);
		
		if(admin != null) {
			session.setAttribute("admin_id", admin.getId());
									
			return "/index";
		} else {
			return "/login";
		}
	}
	
	@RequestMapping(value = "/buttons.mdo", method = RequestMethod.GET)
	public String buttons(Locale locale, Model model) {
		
		String market_image1 = adminBannerMarketService.getBanner(1);
		String market_image2 = adminBannerMarketService.getBanner(2);
		String market_image3 = adminBannerMarketService.getBanner(3);
		String market_image4 = adminBannerMarketService.getBanner(4);
		
		model.addAttribute("market_banner1", market_image1);
		model.addAttribute("market_banner2", market_image2);
		model.addAttribute("market_banner3", market_image3);
		model.addAttribute("market_banner4", market_image4);
		
		String store_image1 = adminBannerStoreService.getBanner(1);
		String store_image2 = adminBannerStoreService.getBanner(2);
		String store_image3 = adminBannerStoreService.getBanner(3);
		String store_image4 = adminBannerStoreService.getBanner(4);
		
		model.addAttribute("store_banner1", store_image1);
		model.addAttribute("store_banner2", store_image2);
		model.addAttribute("store_banner3", store_image3);
		model.addAttribute("store_banner4", store_image4);
		
		return "/buttons";
	}
	
	@RequestMapping(value = "/cards.mdo", method = RequestMethod.GET)
	public String cards(Locale locale, Model model) {
		
		return "/cards";
	}

	

	@RequestMapping(value = "/register.mdo", method = RequestMethod.GET)
	public String register(Locale locale, Model model) {
		
		return "/register";
	}
	
	@RequestMapping(value = "/register.mdo", method = RequestMethod.POST)
	public String sideregister(Locale locale, Model model, AdminVO vo) {
		adminService.insertAdmin(vo);
		
		return "/login";
	}
	
	@RequestMapping(value = "/forgot-password.mdo", method = RequestMethod.GET)
	public String forgot_password(Locale locale, Model model) {
		
		return "/forgot-password";
	}
	
	@RequestMapping(value = "/chartEx.mdo", method = RequestMethod.GET)
	public String chartsEx(Model model) {
		
		 SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
		 Calendar week = Calendar.getInstance();
		 week.add(Calendar.DATE , -7);
		 ChartVO c = new ChartVO();
		 String startDate= (date.format(week.getTime()));
		 
		 c.setEnd_date(date.format(new Date()));
		 c.setStart_date(startDate);
		 
//		 c.setEnd_date(Timestamp.valueOf((date.format(new Date()))));
//		 c.setStart_date(Timestamp.valueOf(startDate));
		 
		 String[] aa = startDate.split(" ");
		 String StartDate = aa[0];
		 c.setStartDate(StartDate);
		 String bb = date.format(new Date());
		 String [] cc = bb.split(" ");
		 String EndDate = cc[0];
		 c.setEndDate(EndDate);
		 
		 
		 System.out.println(c.getStartDate());
		 System.out.println(c.getEndDate());
		 getChart(c,model);
			
	
		
		return "/chartex";
	}
	
	
	@ResponseBody
	@PostMapping("getNewChart.mdo")
	public JSONArray getNewChart(@RequestBody ChartVO chart,HttpSession session){
		
		return JSONArray.fromObject(adminTableService.getResponsiveChart(chart));
	}
	
	private void getChart(ChartVO chart, Model model) {
		model.addAttribute("chartList",JSONArray.fromObject(adminTableService.getinitialChart(chart)));
	    model.addAttribute("start_date",chart.getStart_date());
	    model.addAttribute("end_date",chart.getEnd_date());
		
	}
	
	

	@RequestMapping(value ="/charts.mdo" , method = RequestMethod.GET)
	public String charts(Locale locale, Model model, HttpServletRequest request) {
		
		double AdminTableWoman = adminTableService.getAdminTableWoman();
		double AdminTableMan = adminTableService.getAdminTableMan();

		double Total = AdminTableWoman + AdminTableMan;

		int adminTableWomanPer = (int) ((AdminTableWoman / Total) * 100);
		int adminTableManPer = (int) ((AdminTableMan / Total) * 100);

		request.setAttribute("wpercent", adminTableWomanPer);
		request.setAttribute("mpercent", adminTableManPer);

		request.setAttribute("woman", AdminTableWoman);
		request.setAttribute("man", AdminTableMan);
		
		ArrayList<UserVO> arr = adminTableService.getAddress2();
		ArrayList<AdminTableVO> man = adminTableService.getAddressMan();
		ArrayList<AdminTableVO> woman = adminTableService.getAddressWoman();
		
		int seoul = 0, gyunggi = 0, kangwon = 0, incheon = 0, chungnam = 0, chungbuk = 0, daejeon = 0, gyeongbuk = 0,
				daegu = 0, gyeongnam = 0, ulsan = 0, busan = 0, jeonbuk = 0, jeonnam = 0, kwangju = 0, jeju = 0, sejong = 0;
		
		int manSeoul = 0, manGyunggi = 0, manKangwon = 0, manIncheon = 0, manChungnam = 0, manChungbuk = 0,
				manDaejeon = 0, manGyeongbuk = 0, manDaegu = 0, manGyeongnam = 0, manUlsan = 0, manBusan = 0,
				manJeonbuk = 0, manJeonnam = 0, manKwangju = 0, manJeju = 0, manSejong = 0;
		
		int womanSeoul = 0, womanGyunggi = 0, womanKangwon = 0, womanIncheon = 0, womanChungnam = 0, womanChungbuk = 0,
				womanDaejeon = 0, womanGyeongbuk = 0, womanDaegu = 0, womanGyeongnam = 0, womanUlsan = 0,
				womanBusan = 0, womanJeonbuk = 0, womanJeonnam = 0, womanKwangju = 0, womanJeju = 0, womanSejong = 0;

		for (int i = 0; i < arr.size(); i++) {
			// 주소 공백 제거
			String[] address = String.valueOf(arr.get(i)).split(" ");
			// 주소 앞
			String add = address[0];
			// 비교
			switch (add) {
				case "서울":	seoul++; 		break;
				case "경기":	gyunggi++;		break;
				case "강원":	kangwon++;		break;
				case "인천":	incheon++;		break;
				case "충남":	chungnam++;		break;
				case "충북":	chungbuk++;		break;
				case "대전":	daejeon++;		break;
				case "경북":	gyeongbuk++;	break;
				case "대구":	daegu++;		break;
				case "경남":	gyeongnam++;	break;
				case "울산":	ulsan++;		break;
				case "부산":	busan++;		break;
				case "전북":	jeonbuk++;		break;
				case "전남":	jeonnam++;		break;
				case "광주":	kwangju++;		break;
				case "제주":	jeju++;			break;
				case "세종":	sejong++;		break;
				default:					break;
			}
		}

		for (int i = 0; i < man.size(); i++) {
			// 주소 공백 제거
			String[] manAddress = String.valueOf(man.get(i)).split(" ");
			// 주소 앞
			String strMan = manAddress[0];
			// 비교
			
			switch (strMan) {
				case "서울":	manSeoul++;		break;
				case "경기":	manGyunggi++;	break;
				case "강원":	manKangwon++;	break;
				case "인천":	manIncheon++;	break;
				case "충남":	manChungnam++;	break;
				case "충북":	manChungbuk++;	break;
				case "대전":	manDaejeon++;	break;
				case "경북":	manGyeongbuk++;	break;
				case "대구":	manDaegu++;		break;
				case "경남":	manGyeongnam++;	break;
				case "울산":	manUlsan++;		break;
				case "부산":	manBusan++;		break;
				case "전북":	manJeonbuk++;	break;
				case "전남":	manJeonnam++;	break;
				case "광주":	manKwangju++;	break;
				case "제주":	manJeju++;		break;
				case "세종":	manSejong++;	break;
				default:					break;
			}
		}
		
		for (int i = 0; i < woman.size(); i++) {
			// 주소 공백 제거
			String[] womanAddress = String.valueOf(woman.get(i)).split(" ");
			// 주소 앞
			String strWoman = womanAddress[0];
			// 비교
			switch (strWoman) {
				case "서울":	womanSeoul++;		break;
				case "경기":	womanGyunggi++;		break;
				case "강원":	womanKangwon++;		break;
				case "인천":	womanIncheon++;		break;
				case "충남":	womanChungnam++;	break;
				case "충북":	womanChungbuk++;	break;
				case "대전":	womanDaejeon++;		break;
				case "경북":	womanGyeongbuk++;	break;
				case "대구":	womanDaegu++;		break;
				case "경남":	womanGyeongnam++;	break;
				case "울산":	womanUlsan++;		break;
				case "부산":	womanBusan++;		break;
				case "전북":	womanJeonbuk++;		break;
				case "전남":	womanJeonnam++;		break;
				case "광주":	womanKwangju++;		break;
				case "제주":	womanJeju++;		break;
				case "세종":	womanSejong++;		break;
				default:						break;
			}
		}
		// 주소 전체
		ArrayList<Integer> arrayList = new ArrayList<>();

		arrayList.add(seoul);
		arrayList.add(gyunggi);
		arrayList.add(kangwon);
		arrayList.add(incheon);
		arrayList.add(chungnam);
		arrayList.add(chungbuk);
		arrayList.add(daejeon);
		arrayList.add(gyeongbuk);
		arrayList.add(daegu);
		arrayList.add(gyeongnam);
		arrayList.add(ulsan);
		arrayList.add(busan);
		arrayList.add(jeonbuk);
		arrayList.add(jeonnam);
		arrayList.add(kwangju);
		arrayList.add(jeju);
		arrayList.add(sejong);
		
		// 남성
		ArrayList<Integer> manList = new ArrayList<>();
		
		manList.add(manSeoul);
		manList.add(manGyunggi);
		manList.add(manKangwon);
		manList.add(manIncheon);
		manList.add(manChungnam);
		manList.add(manChungbuk);
		manList.add(manDaejeon);
		manList.add(manGyeongbuk);
		manList.add(manDaegu);
		manList.add(manGyeongnam);
		manList.add(manUlsan);
		manList.add(manBusan);
		manList.add(manJeonbuk);
		manList.add(manJeonnam);
		manList.add(manKwangju);
		manList.add(manJeju);
		manList.add(manSejong);
		
		// 여성
		ArrayList<Integer> womanList = new ArrayList<>();
		
		womanList.add(womanSeoul);
		womanList.add(womanGyunggi);
		womanList.add(womanKangwon);
		womanList.add(womanIncheon);
		womanList.add(womanChungnam);
		womanList.add(womanChungbuk);
		womanList.add(womanDaejeon);
		womanList.add(womanGyeongbuk);
		womanList.add(womanDaegu);
		womanList.add(womanGyeongnam);
		womanList.add(womanUlsan);
		womanList.add(womanBusan);
		womanList.add(womanJeonbuk);
		womanList.add(womanJeonnam);
		womanList.add(womanKwangju);
		womanList.add(womanJeju);
		womanList.add(womanSejong);

		request.setAttribute("AddressList", arrayList);
		request.setAttribute("manList", manList);
		request.setAttribute("womanList", womanList);
		
		List<String> ageChart = adminTableService.getBirth();

		int teenager = 0;
		int twenties = 0;
		int thirties = 0;
		int forties = 0;
		int overfifties = 0;

		Calendar current = Calendar.getInstance();
		int currentYear = current.get(Calendar.YEAR);

		int birth;

		for (int i = 0; i < ageChart.size(); i++) {
			birth = Integer.valueOf((ageChart.get(i).substring(0, 2)));
			if (birth >= 22) {
				birth = 1900 + birth;
			} else if (birth < 22) {
				birth = 2000 + birth;
			}

			int age = currentYear - birth + 1;

			if (age < 20) {
				teenager++;
			} else if (age < 30) {
				twenties++;
			} else if (age < 40) {
				thirties++;
			} else if (age < 50) {
				forties++;
			} else {
				overfifties++;
			}
		}
		
		ArrayList<Integer> ageList = new ArrayList<>();

		ageList.add(teenager);
		ageList.add(twenties);
		ageList.add(thirties);
		ageList.add(forties);
		ageList.add(overfifties);
		
		//매출 차
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
		 Calendar week = Calendar.getInstance();
		 week.add(Calendar.DATE , -7);
		 ChartVO c = new ChartVO();
		 String startDate= (date.format(week.getTime()));
		 
		 c.setEnd_date(date.format(new Date()));
		 c.setStart_date(startDate);
		 
//		 c.setEnd_date(Timestamp.valueOf((date.format(new Date()))));
//		 c.setStart_date(Timestamp.valueOf(startDate));
		 
		 String[] aa = startDate.split(" ");
		 String StartDate = aa[0];
		 c.setStartDate(StartDate);
		 String bb = date.format(new Date());
		 String [] cc = bb.split(" ");
		 String EndDate = cc[0];
		 c.setEndDate(EndDate);
		 
		 
		 System.out.println(c.getStartDate());
		 System.out.println(c.getEndDate());
		 getChart(c,model);

		request.setAttribute("ageList", ageList);
		
		List<Integer> categoryBigList = storeService.getCategoryBig();
		
		request.setAttribute("categoryBigList", categoryBigList);
		
		return "/charts";
	}

	@RequestMapping(value ="/profile.mdo" , method = RequestMethod.GET)
	public String profile(Locale locale, Model model) {
		
		return "/profile";
	}
		
	
	@RequestMapping(value ="/merchandise.mdo" , method = RequestMethod.GET)
	public String tables_used(HttpServletRequest request, Model model) {
		List<StoreCategoryBigVO> storeCategoryBig = adminPageStoreService.getStoreCategoryBig();
		request.setAttribute("storeCategoryBig", storeCategoryBig);
		
		List<AdminPageStoreVO> storeList = adminPageStoreService.getStoreList();
		model.addAttribute("storeList", storeList);
		
		return "/merchandise";
	}
	@RequestMapping(value ="/ConvertToPdf.mdo" , method = RequestMethod.GET)
	public String convert(Locale locale, Model model, HttpServletRequest request) throws DocumentException, IOException {
		ConvertToPdf.createPdf("Admin2", "<h1>안녕하세요</h1>", request);
		
		return "/index";
	}	
	
	@RequestMapping(value ="/usedstatus.mdo" , method = RequestMethod.GET)
	public String usedstatus(Locale locale, Model model) {
		List<AdminUsedVO> list = adminUsedService.getAdminUsedSellList(0);
		
		model.addAttribute("list", list);
		
		return "/usedstatus";
	}
	
	@RequestMapping(value ="/storestatus.mdo" , method = RequestMethod.GET)
	public String storestatus(HttpServletRequest request) {
		
		String str = request.getParameter("status");
		ArrayList<AdminTransactionHistoryVO> status = null;
		ArrayList<String> strList = adminTransactionHistoryService.getStatus();
		
		if (str == null) {
			str = "전체 목록";
			status = adminTransactionHistoryService.getTransitionAllList();
		}
		
		switch (str) {
		case "전체 목록":
			status = adminTransactionHistoryService.getTransitionAllList();
			break;
		case "상품 준비 중":
			status = adminTransactionHistoryService.getTransitionStatusList(str);
			break;
		case "상품 배송 중":
			status = adminTransactionHistoryService.getTransitionStatusList(str);
			break;
		case "상품 배송 완료":
			status = adminTransactionHistoryService.getTransitionStatusList(str);
			break;
		default:
			break;
		}
		
		request.setAttribute("status", status);
		request.setAttribute("strList", strList);
		
		return "/storestatus";
	}
	
	@RequestMapping(value ="/storecancelrefundcomplete.mdo" , method = RequestMethod.GET)
	public String storecancelrefundcomplete(HttpServletRequest request) {
		String str = request.getParameter("pay_cancel");
		ArrayList<AdminTransactionHistoryVO> status = null;
		if (str == null) {
			str = "전체 목록";
			status = adminTransactionHistoryService.getCancelRefundComplete();
		}
		
		switch (str) {
		case "전체 목록":
			status = adminTransactionHistoryService.getCancelRefundComplete();
			break;
		case "취소 완료":
			status = adminTransactionHistoryService.getCancelComplete();
			break;
		case "반품 완료":
			status = adminTransactionHistoryService.getRefundComplete();
			break;
		default:
			break;
		}
		
		request.setAttribute("status", status);
		
		return "/storecancelrefundcomplete";
	}
	
	@RequestMapping(value ="/storecancelstatus.mdo" , method = RequestMethod.GET)
	public String storecancelstatus(HttpServletRequest request) {
		String str = request.getParameter("pay_cancel");
		ArrayList<AdminTransactionHistoryVO> status = null;
		
		if (str == null) {
			str = "전체 목록";
			status = adminTransactionHistoryService.getTransitionAllCancelList();
		}
		
		switch (str) {
		case "전체 목록":
			status = adminTransactionHistoryService.getTransitionAllCancelList();
			break;
		case "교환 처리 중":
			status = adminTransactionHistoryService.getTransitionCancelList(str);
			break;
		case "취소 처리 중":
			status = adminTransactionHistoryService.getTransitionCancelList(str);
			break;
		case "반품 처리 중":
			status = adminTransactionHistoryService.getTransitionCancelList(str);
			break;
		default:
			break;
		}
		
		request.setAttribute("status", status);
		
		return "/storecancelstatus";
	}

	@RequestMapping(value ="/updateStatus.mdo" , method = RequestMethod.POST)
	public String updateStatus(HttpServletRequest request) {
		
		int seq = Integer.parseInt(request.getParameter("transaction_seq"));
		AdminTransactionHistoryVO vo = adminTransactionHistoryService.getSelectOne(seq);
		vo.setStatus(request.getParameter("status"));
		adminTransactionHistoryService.updateStatus(vo);
		
		return "redirect:/storestatus.mdo";
	}
	
	@RequestMapping(value ="/updateProcess.mdo" , method = RequestMethod.POST)
	public String updatePayCancel(HttpServletRequest request, StoreVO vo) {
		int seq = Integer.parseInt(request.getParameter("transaction_seq"));
		vo.setProduct_name(request.getParameter("product_name"));
		vo.setTransaction_count(Integer.parseInt(request.getParameter("transaction_count")));
		StoreVO thVO = storeService.getTransactionHistoryOne(vo);
		String str = request.getParameter("pay_cancel");
		
		switch (str) {
		case "교환 처리 중":
			adminTransactionHistoryService.updateExchangeCount(seq);
			break;
		case "취소 처리 중":
			adminTransactionHistoryService.updatePayCancel(seq);
			storeService.plusStock(thVO);
			break;
		case "반품 처리 중":
			adminTransactionHistoryService.updateRefund(seq);
			break;
		default:
			break;
		}
		
		return "redirect:/storecancelstatus.mdo";
	}
	 @GetMapping("excel_transactionhistory.mdo")
	    public void excelDownload(HttpServletResponse response) throws IOException {
	      
	          // Workbook wb = new HSSFWorkbook();
	           Workbook wb = new XSSFWorkbook();
	           Sheet sheet = wb.createSheet("첫번째 시트");
	           Row row = null;
	           Cell cell = null;
	           int rowNum = 0;

	           // Header
	           String[] header = {"사용자이메일", "상품이름", "금액", "판매개수", "날짜", "uid", "금액", "요청사항", "주소", "상태", "취소날짜", "취소이유", "취소상세이유", "취소상태"};
	           row = sheet.createRow(rowNum++);
	           for(int i=0; i<header.length; i++) {
	              cell = row.createCell(i);
	              cell.setCellValue(header[i]);
	           }
	         
	           List<AdminTransactionHistoryVO> paymentList = adminThistoryService.orderList();
	           // Body
	           for (int i=0; i<paymentList.size(); i++) {           
	            SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
	                
	               row = sheet.createRow(rowNum++);
	               cell = row.createCell(0);
	               cell.setCellValue(paymentList.get(i).getEmail_id());
	               cell = row.createCell(1);
	               cell.setCellValue(paymentList.get(i).getProduct_name());
	               cell = row.createCell(2);
	               cell.setCellValue(paymentList.get(i).getTransaction_price());
	               cell = row.createCell(3);
	               cell.setCellValue(paymentList.get(i).getTransaction_count());
	               cell = row.createCell(4);
	               cell.setCellValue(date.format(paymentList.get(i).getDate()));
	               cell = row.createCell(5);
	               cell.setCellValue(paymentList.get(i).getMerchant_uid());
	               cell = row.createCell(6);
	               cell.setCellValue(paymentList.get(i).getProduct_price());
	               cell = row.createCell(7);
	               cell.setCellValue(paymentList.get(i).getRequest());
	               cell = row.createCell(8);
	               cell.setCellValue(paymentList.get(i).getAddress2());
	               cell = row.createCell(9);
	               cell.setCellValue(paymentList.get(i).getStatus());
	               cell = row.createCell(10);
	               cell.setCellValue(paymentList.get(i).getCancel_date());
	               cell = row.createCell(11);
	               cell.setCellValue(paymentList.get(i).getCancel_status());
	               cell = row.createCell(12);
	               cell.setCellValue(paymentList.get(i).getCancel_reason());
	               cell = row.createCell(13);
	               cell.setCellValue(paymentList.get(i).getPay_cancel());
	           }

	           // 컨텐츠 타입과 파일명 지정
	           response.setContentType("ms-vnd/excel");
	          // response.setHeader("Content-Disposition", "attachment;filename=example.xls");
	           response.setHeader("Content-Disposition", "attachment;filename=상품거래.xlsx");

	           // Excel File Output
	           wb.write(response.getOutputStream());
	           wb.close();
	       }
	   
	
}
