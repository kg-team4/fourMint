package four.mint.web.admin.page;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import four.mint.web.admin.page.store.AdminPageStoreVO;

@Controller
public class AdminPageMemberController {
	
	@Autowired
	private AdminPageService adminPageService;
	
	@RequestMapping(value="/memberpage.mdo", method= RequestMethod.GET)
	public String memberpage(Model model) {
		List<AdminPageVO> adminpagelist = adminPageService.getAdminPageList();
		
		model.addAttribute("list", adminpagelist);
		
		return "/memberpage";
	}
	
	@RequestMapping(value = "/deleteMember.mdo", method = RequestMethod.POST)
	public String updateStore(AdminPageStoreVO vo, HttpServletRequest request) {
		adminPageService.deleteMember(request.getParameter("nickname"));
		return "redirect:/memberpage.mdo";
	}
}
