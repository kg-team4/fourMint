package four.mint.web.admin;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.io.IOException;
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
	private AdminReportService adminReportService;
	
	@RequestMapping(value = "/home.mdo", method = RequestMethod.GET)
	public String home(AdminVO vo, HttpSession session) {
		List<AdminReportVO> adminreportlist = adminReportService.getAdminReportList();
		
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
	public String charts(Locale locale, Model model) {
		
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

