package four.mint.web.admin;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itextpdf.text.DocumentException;

import four.mint.web.admin.login.AdminService;
import four.mint.web.admin.login.AdminVO;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;

	@RequestMapping(value = "/home.mdo", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "/index";
	}
	
	@RequestMapping(value = "/buttons.mdo", method = RequestMethod.GET)
	public String buttons(Locale locale, Model model) {
		
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
	
	@RequestMapping(value = "/utilities-annoucement.mdo", method = RequestMethod.GET)
	public String Uilities_bor(Locale locale, Model model) {
		
		return "/utilities-annoucement";
	}
	
	@RequestMapping(value = "/utilities-board.mdo", method = RequestMethod.GET)
	public String Uilities_col(Locale locale, Model model) {
		
		return "/utilities-board";
	}
	
	@RequestMapping(value = "/utilities-usedfaq.mdo", method = RequestMethod.GET)
	public String Uilities_oth(Locale locale, Model model) {
		
		return "/utilities-usedfaq";
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
	
	@RequestMapping(value = "/404.mdo", method = RequestMethod.GET)
	public String error404(Locale locale, Model model) {
		
		return "/404";
	}
	
	@RequestMapping(value = "/blank.mdo", method = RequestMethod.GET)
	public String blank(Locale locale, Model model) {
		
		return "/blank";
	}

	@RequestMapping(value ="/charts.mdo" , method = RequestMethod.GET)
	public String charts(Locale locale, Model model) {
		
		return "/charts";
	}
	
	@RequestMapping(value ="/tables-blacklist.mdo" , method = RequestMethod.GET)
	public String tables_blacklist(Locale locale, Model model) {
		
		return "/tables-blacklist";
	}
	@RequestMapping(value ="/tables-member.mdo" , method = RequestMethod.GET)
	public String tables_member(Locale locale, Model model) {
		
		return "/tables-member";
	}
	@RequestMapping(value ="/tables-purchasehistory.mdo" , method = RequestMethod.GET)
	public String tables_purchasehistory(Locale locale, Model model) {
		
		return "/tables-purchasehistory";
	}
	@RequestMapping(value ="/tables-storegoods.mdo" , method = RequestMethod.GET)
	public String tables_storegoods(Locale locale, Model model) {
		
		return "/tables-storegoods";
	}
	@RequestMapping(value ="/tables-used.mdo" , method = RequestMethod.GET)
	public String tables_used(Locale locale, Model model) {
		
		return "/tables-used";
	}
	@RequestMapping(value ="/ConvertToPdf.mdo" , method = RequestMethod.GET)
	public String convert(Locale locale, Model model, HttpServletRequest request) throws DocumentException, IOException {
		ConvertToPdf.createPdf("Admin2", "<h1>안녕하세요</h1>", request);
		
		return "/index";
	}
	
}

