package four.mint.web.admin;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itextpdf.text.DocumentException;

import four.mint.web.admin.banner.market.AdminBannerMarketService;
import four.mint.web.admin.banner.store.AdminBannerStoreService;
import four.mint.web.admin.login.AdminService;
import four.mint.web.admin.login.AdminVO;
import four.mint.web.admin.page.store.AdminPageStoreService;
import four.mint.web.admin.page.store.AdminPageStoreVO;
import four.mint.web.admin.table.member.AdminTableService;
import four.mint.web.admin.table.member.AdminTableVO;
import four.mint.web.user.UserService;
import four.mint.web.user.UserVO;
import four.mint.web.admin.report.AdminReportService;
import four.mint.web.admin.report.AdminReportVO;
import four.mint.web.user.store.StoreCategoryBigVO;

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
	
	@RequestMapping(value = "/home.mdo", method = RequestMethod.GET)
	public String home(HttpServletRequest request, AdminVO vo, HttpSession session) {
		List<AdminReportVO> adminreportlist = adminReportService.getAdminReportList();
		
		int userCount = userService.getUserCount();
		request.setAttribute("userCount", userCount);
		
		int storeCount = adminPageStoreService.getStoreCount();
		request.setAttribute("storeCount", storeCount);
		
		session.setAttribute("lists", adminreportlist);
		
		AdminVO admin = adminService.getAdmin(vo);
		
		if(admin != null) {
			session.setAttribute("admin_id", admin.getId());
			System.out.println("로그인 성공: " + admin.getId());
									
			return "/index";
			
		} else {
			System.out.println("로그인 실패");
			
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
	
	@RequestMapping(value = "/utilities-boardmanage.mdo", method = RequestMethod.GET)
	public String Uilities_ani(Locale locale, Model model) {
		
		return "/utilities-boardmanage";
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
		
		int seoul = 0;
		int gyunggi = 0;
		int kangwon = 0;
		int incheon = 0;
		int chungnam = 0;
		int chungbuk = 0;
		int daejeon = 0;
		int gyeongbuk = 0;
		int daegu = 0;
		int gyeongnam = 0;
		int ulsan = 0;
		int busan = 0;
		int jeonbuk = 0;
		int jeonnam = 0;
		int kwangju = 0;
		int jeju = 0;
		int sejong = 0;
		
		int manSeoul = 0;
		int manGyunggi = 0;
		int manKangwon = 0;
		int manIncheon = 0;
		int manChungnam = 0;
		int manChungbuk = 0;
		int manDaejeon = 0;
		int manGyeongbuk = 0;
		int manDaegu = 0;
		int manGyeongnam = 0;
		int manUlsan = 0;
		int manBusan = 0;
		int manJeonbuk = 0;
		int manJeonnam = 0;
		int manKwangju = 0;
		int manJeju = 0;
		int manSejong = 0;
		
		int womanSeoul = 0;
		int womanGyunggi = 0;
		int womanKangwon = 0;
		int womanIncheon = 0;
		int womanChungnam = 0;
		int womanChungbuk = 0;
		int womanDaejeon = 0;
		int womanGyeongbuk = 0;
		int womanDaegu = 0;
		int womanGyeongnam = 0;
		int womanUlsan = 0;
		int womanBusan = 0;
		int womanJeonbuk = 0;
		int womanJeonnam = 0;
		int womanKwangju = 0;
		int womanJeju = 0;
		int womanSejong = 0;

		for (int i = 0; i < arr.size(); i++) {
			// 주소 공백 제거
			String[] address = String.valueOf(arr.get(i)).split(" ");
			// 주소 앞
			String add = address[0];
			// 비교
			switch (add) {
			case "서울":
				seoul++;
				break;
			case "경기":
				gyunggi++;
				break;
			case "강원":
				kangwon++;
				break;
			case "인천":
				incheon++;
				break;
			case "충남":
				chungnam++;
				break;
			case "충북":
				chungbuk++;
				break;
			case "대전":
				daejeon++;
				break;
			case "경북":
				gyeongbuk++;
				break;
			case "대구":
				daegu++;
				break;
			case "경남":
				gyeongnam++;
				break;
			case "울산":
				ulsan++;
				break;
			case "부산":
				busan++;
				break;
			case "전북":
				jeonbuk++;
				break;
			case "전남":
				jeonnam++;
				break;
			case "광주":
				kwangju++;
				break;
			case "제주":
				jeju++;
				break;
			case "세종":
				sejong++;
				break;
			default:
				break;
			}
		}

		for (int i = 0; i < man.size(); i++) {
			// 주소 공백 제거
			String[] manAddress = String.valueOf(man.get(i)).split(" ");
			// 주소 앞
			String strMan = manAddress[0];
			// 비교
			
			switch (strMan) {
			case "서울":
				manSeoul++;
				break;
			case "경기":
				manGyunggi++;
				break;
			case "강원":
				manKangwon++;
				break;
			case "인천":
				manIncheon++;
				break;
			case "충남":
				manChungnam++;
				break;
			case "충북":
				manChungbuk++;
				break;
			case "대전":
				manDaejeon++;
				break;
			case "경북":
				manGyeongbuk++;
				break;
			case "대구":
				manDaegu++;
				break;
			case "경남":
				manGyeongnam++;
				break;
			case "울산":
				manUlsan++;
				break;
			case "부산":
				manBusan++;
				break;
			case "전북":
				manJeonbuk++;
				break;
			case "전남":
				manJeonnam++;
				break;
			case "광주":
				manKwangju++;
				break;
			case "제주":
				manJeju++;
				break;
			case "세종":
				manSejong++;
				break;
			default:
				break;
			}
		}
		
		for (int i = 0; i < woman.size(); i++) {
			// 주소 공백 제거
			String[] womanAddress = String.valueOf(woman.get(i)).split(" ");
			// 주소 앞
			String strWoman = womanAddress[0];
			// 비교
			switch (strWoman) {
			case "서울":
				womanSeoul++;
				break;
			case "경기":
				womanGyunggi++;
				break;
			case "강원":
				womanKangwon++;
				break;
			case "인천":
				womanIncheon++;
				break;
			case "충남":
				womanChungnam++;
				break;
			case "충북":
				womanChungbuk++;
				break;
			case "대전":
				womanDaejeon++;
				break;
			case "경북":
				womanGyeongbuk++;
				break;
			case "대구":
				womanDaegu++;
				break;
			case "경남":
				womanGyeongnam++;
				break;
			case "울산":
				womanUlsan++;
				break;
			case "부산":
				womanBusan++;
				break;
			case "전북":
				womanJeonbuk++;
				break;
			case "전남":
				womanJeonnam++;
				break;
			case "광주":
				womanKwangju++;
				break;
			case "제주":
				womanJeju++;
				break;
			case "세종":
				womanSejong++;
				break;
			default:
				break;
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

		request.setAttribute("ageList", ageList);
		
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
	@RequestMapping(value ="/customercenter.mdo" , method = RequestMethod.GET)
	public String customercenter(Locale locale, Model model) {
		
		return "/customercenter";
	}
	@RequestMapping(value ="/usedstatus.mdo" , method = RequestMethod.GET)
	public String usedstatus(Locale locale, Model model) {
		
		return "/usedstatus";
	}
	@RequestMapping(value ="/useddistribution.mdo" , method = RequestMethod.GET)
	public String useddistribution(Locale locale, Model model) {
		
		return "/useddistribution";
	}
	@RequestMapping(value ="/storestatus.mdo" , method = RequestMethod.GET)
	public String storestatus(Locale locale, Model model) {
		
		return "/storestatus";
	}
	@RequestMapping(value ="/store" + "distribution.mdo" , method = RequestMethod.GET)
	public String storedistribution(Locale locale, Model model) {
		
		return "/storedistribution";
	}
	
	@RequestMapping(value ="/etc.mdo" , method = RequestMethod.GET)
	public String etc(Locale locale, Model model) {
		
		return "/etc";
	}
	
	@RequestMapping(value ="/exchange.mdo" , method = RequestMethod.GET)
	public String exchange(Locale locale, Model model) {
		
		return "/exchange";
	}
	
	@RequestMapping(value ="/cancel.mdo" , method = RequestMethod.GET)
	public String cancel(Locale locale, Model model) {
		
		return "/cancel";
	}
	
	@RequestMapping(value ="/delivery.mdo" , method = RequestMethod.GET)
	public String delivery(Locale locale, Model model) {
		
		return "/delivery";
	}
	
	
}

