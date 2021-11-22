package four.mint.web.admin.table.member;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.amazonaws.Request;
import com.itextpdf.text.pdf.hyphenation.TernaryTree.Iterator;

import four.mint.web.user.UserService;
import four.mint.web.user.UserVO;
import four.mint.web.user.impl.UserDAO;


@Controller
public class AdminTableController {

	@Autowired
	private AdminTableService adminTableService;

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/tables-member.mdo", method = RequestMethod.GET)
	public String tablemember(HttpServletRequest request) {
		List<AdminTableVO> admintablelist = adminTableService.getAdminTableList();

		request.setAttribute("list", admintablelist);
		return "/tables-member";

	}

	@RequestMapping(value = "/membergender.mdo", method = RequestMethod.GET)
	public String membergender(HttpServletRequest request) {
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
	public String memberbirth(HttpServletRequest request) {
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
	public String memberaddress(HttpServletRequest request) {
		ArrayList<UserVO> arr = adminTableService.getAddress2();

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

		for (int i = 0; i < arr.size(); i++) {
			// 주소 공백 제거
			String[] aa = String.valueOf(arr.get(i)).split(" ");
			// 주소 앞
			String add = aa[0];
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

		request.setAttribute("AddressList", arrayList);
		return "/memberaddress";
	}
}