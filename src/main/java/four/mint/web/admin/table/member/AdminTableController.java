package four.mint.web.admin.table.member;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import four.mint.web.admin.page.AdminPageService;
import four.mint.web.admin.page.AdminPageVO;
import four.mint.web.user.UserVO;


@Controller
public class AdminTableController {

	@Autowired
	private AdminTableService adminTableService;
	
	@Autowired
	private AdminPageService adminPageService; 

	@RequestMapping(value = "/tables-member.mdo", method = RequestMethod.GET)
	public String tablemember(HttpServletRequest request, HttpSession session) {
		if(session.getAttribute("admin_id") == null) {
			return "redirect:login.mdo";
		}
		
		List<AdminPageVO> adminpagelist = adminPageService.getAdminPageList();
		request.setAttribute("list", adminpagelist);
		
		return "/tables-member";

	}

	@RequestMapping(value = "/membergender.mdo", method = RequestMethod.GET)
	public String membergender(HttpServletRequest request, HttpSession session) {
		if(session.getAttribute("admin_id") == null) {
			return "redirect:login.mdo";
		}
		
		double AdminTableWoman = adminTableService.getAdminTableWoman();
		double AdminTableMan = adminTableService.getAdminTableMan();

		double Total = AdminTableWoman + AdminTableMan;

		int adminTableWomanPer = (int) ((AdminTableWoman / Total) * 100);
		int adminTableManPer = (int) ((AdminTableMan / Total) * 100);

		request.setAttribute("wpercent", adminTableWomanPer);
		request.setAttribute("mpercent", adminTableManPer);

		request.setAttribute("woman", AdminTableWoman);
		request.setAttribute("man", AdminTableMan);

		return "/membergender";
	}

	@RequestMapping(value = "/memberbirth.mdo", method = RequestMethod.GET)
	public String memberbirth(HttpServletRequest request, HttpSession session) {
		if(session.getAttribute("admin_id") == null) {
			return "redirect:login.mdo";
		}
		
		List<String> array = adminTableService.getBirth();

		int teenager = 0;
		int twenties = 0;
		int thirties = 0;
		int forties = 0;
		int overfifties = 0;

		Calendar current = Calendar.getInstance();
		int currentYear = current.get(Calendar.YEAR);

		int birth;

		for (int i = 0; i < array.size(); i++) {
			birth = Integer.valueOf((array.get(i).substring(0, 2)));
			if (birth >= 22) {
				birth = 1900 + birth;
			} else if (birth < 22) {
				birth = 2000 + birth;
			}
			
			int age = currentYear - birth +1 ;
			
			if(age < 20) {
				teenager++;
			}else if (age < 30) {
				twenties++;
			}else if(age < 40) {
				thirties++;
			}else if(age < 50) {
				forties++;
			}else {
				overfifties++;
			}
		}
			ArrayList<Integer> arrayList = new ArrayList<>();
			
			arrayList.add(teenager);
			arrayList.add(twenties);
			arrayList.add(thirties);
			arrayList.add(forties);
			arrayList.add(overfifties);
			
		request.setAttribute("List", arrayList);		
		
		return "/memberbirth";
	}

	@RequestMapping(value = "/memberaddress.mdo", method = RequestMethod.GET)
	public String memberaddress(HttpServletRequest request, HttpSession session) {
		if(session.getAttribute("admin_id") == null) {
			return "redirect:login.mdo";
		}
		
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
			// ?????? ?????? ??????
			String[] address = String.valueOf(arr.get(i)).split(" ");
			// ?????? ???
			String add = address[0];
			// ??????
			switch (add) {
			case "??????":
				seoul++;
				break;
			case "??????":
				gyunggi++;
				break;
			case "??????":
				kangwon++;
				break;
			case "??????":
				incheon++;
				break;
			case "??????":
				chungnam++;
				break;
			case "??????":
				chungbuk++;
				break;
			case "??????":
				daejeon++;
				break;
			case "??????":
				gyeongbuk++;
				break;
			case "??????":
				daegu++;
				break;
			case "??????":
				gyeongnam++;
				break;
			case "??????":
				ulsan++;
				break;
			case "??????":
				busan++;
				break;
			case "??????":
				jeonbuk++;
				break;
			case "??????":
				jeonnam++;
				break;
			case "??????":
				kwangju++;
				break;
			case "??????":
				jeju++;
				break;
			case "??????":
				sejong++;
				break;
			default:
				break;
			}
		}

		for (int i = 0; i < man.size(); i++) {
			// ?????? ?????? ??????
			String[] manAddress = String.valueOf(man.get(i)).split(" ");
			// ?????? ???
			String strMan = manAddress[0];
			// ??????
			
			switch (strMan) {
			case "??????":
				manSeoul++;
				break;
			case "??????":
				manGyunggi++;
				break;
			case "??????":
				manKangwon++;
				break;
			case "??????":
				manIncheon++;
				break;
			case "??????":
				manChungnam++;
				break;
			case "??????":
				manChungbuk++;
				break;
			case "??????":
				manDaejeon++;
				break;
			case "??????":
				manGyeongbuk++;
				break;
			case "??????":
				manDaegu++;
				break;
			case "??????":
				manGyeongnam++;
				break;
			case "??????":
				manUlsan++;
				break;
			case "??????":
				manBusan++;
				break;
			case "??????":
				manJeonbuk++;
				break;
			case "??????":
				manJeonnam++;
				break;
			case "??????":
				manKwangju++;
				break;
			case "??????":
				manJeju++;
				break;
			case "??????":
				manSejong++;
				break;
			default:
				break;
			}
		}
		
		for (int i = 0; i < woman.size(); i++) {
			// ?????? ?????? ??????
			String[] womanAddress = String.valueOf(woman.get(i)).split(" ");
			// ?????? ???
			String strWoman = womanAddress[0];
			// ??????
			switch (strWoman) {
			case "??????":
				womanSeoul++;
				break;
			case "??????":
				womanGyunggi++;
				break;
			case "??????":
				womanKangwon++;
				break;
			case "??????":
				womanIncheon++;
				break;
			case "??????":
				womanChungnam++;
				break;
			case "??????":
				womanChungbuk++;
				break;
			case "??????":
				womanDaejeon++;
				break;
			case "??????":
				womanGyeongbuk++;
				break;
			case "??????":
				womanDaegu++;
				break;
			case "??????":
				womanGyeongnam++;
				break;
			case "??????":
				womanUlsan++;
				break;
			case "??????":
				womanBusan++;
				break;
			case "??????":
				womanJeonbuk++;
				break;
			case "??????":
				womanJeonnam++;
				break;
			case "??????":
				womanKwangju++;
				break;
			case "??????":
				womanJeju++;
				break;
			case "??????":
				womanSejong++;
				break;
			default:
				break;
			}
		}
		// ?????? ??????
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
		
		// ??????
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
		
		// ??????
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
		return "/memberaddress";
	}
	
	@GetMapping(value="excel_tablemember.mdo")
	 public void excelDownload(HttpServletResponse response) throws IOException {
	      
          // Workbook wb = new HSSFWorkbook();
           Workbook wb = new XSSFWorkbook();
           Sheet sheet = wb.createSheet("????????? ??????");
           Row row = null;
           Cell cell = null;
           int rowNum = 0;

           // Header
           String[] header = {"??????????????????", "??????", "?????????", "????????????", "???????????????", "????????????", "??????", "????????????", "??????", "??????", "??????????????? ??????", "?????????????????????", "??????", "??????????????????"};
           row = sheet.createRow(rowNum++);
           for(int i=0; i<header.length; i++) {
              cell = row.createCell(i);
              cell.setCellValue(header[i]);
           }
         
           List<AdminTableVO> paymentList = adminTableService.orderList();
           
           // Body
           for (int i=0; i<paymentList.size(); i++) {           
            SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
                
               row = sheet.createRow(rowNum++);
               cell = row.createCell(0);
               cell.setCellValue(paymentList.get(i).getEmail_id());
               cell = row.createCell(1);
               cell.setCellValue(paymentList.get(i).getName());
               cell = row.createCell(2);
               cell.setCellValue(paymentList.get(i).getNickname());
               cell = row.createCell(3);
               cell.setCellValue(paymentList.get(i).getPhone());
               cell = row.createCell(4);
               cell.setCellValue(date.format(paymentList.get(i).getDate()));
               cell = row.createCell(5);
               cell.setCellValue(paymentList.get(i).getAddress1());
               cell = row.createCell(6);
               cell.setCellValue(paymentList.get(i).getAddress2());
               cell = row.createCell(7);
               cell.setCellValue(paymentList.get(i).getAddress3());
               cell = row.createCell(8);
               cell.setCellValue(paymentList.get(i).getBirth());
               cell = row.createCell(9);
               cell.setCellValue(paymentList.get(i).getGender());
               cell = row.createCell(10);            
               cell.setCellValue(paymentList.get(i).getBlacklist_date());
               cell = row.createCell(11);
               cell.setCellValue(paymentList.get(i).getSocial_login());
               cell = row.createCell(12);
               cell.setCellValue(paymentList.get(i).getRating());
               cell = row.createCell(13);
               cell.setCellValue(paymentList.get(i).getReports());
           }

           // ????????? ????????? ????????? ??????
           response.setContentType("ms-vnd/excel");
          // response.setHeader("Content-Disposition", "attachment;filename=example.xls");
           response.setHeader("Content-Disposition", "attachment;filename=member.xlsx");

           // Excel File Output
           wb.write(response.getOutputStream());
           wb.close();
       }
   
}