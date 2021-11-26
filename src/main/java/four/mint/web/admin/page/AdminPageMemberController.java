package four.mint.web.admin.page;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import four.mint.web.admin.page.store.AdminPageStoreVO;
import four.mint.web.admin.table.member.AdminTableService;
import four.mint.web.admin.table.member.AdminTableVO;



@Controller
public class AdminPageMemberController {
	
	@Autowired
	private AdminPageService adminPageService;
	
	@Autowired
	private AdminTableService adminTableService;
	
	@RequestMapping(value="/memberpage.mdo", method= RequestMethod.GET)
	public String memberpage(HttpSession session, HttpServletRequest request) {

		if(session.getAttribute("admin_id") == null) {
			return "/login";
		}
		else {
		List<AdminPageVO> adminpagelist = adminPageService.getAdminPageList();
		
		request.setAttribute("list", adminpagelist);
		
		return "/memberpage";
		}
	}
	
	
	@RequestMapping(value="/memberlist.mdo", method= RequestMethod.GET)
	public String memberlist(HttpSession session, HttpServletRequest request) {
		
		if(session.getAttribute("admin_id") == null) {
			return "/login";
		}
		else {
			
		}
		List<AdminTableVO> adminMemberlist = adminTableService.getAdminTableList();
		
		request.setAttribute("list", adminMemberlist);
		
		return "/memberlist";
	}
	
	@RequestMapping(value = "/deleteMember.mdo", method = RequestMethod.POST)
	public String updateStore(AdminPageStoreVO vo, HttpServletRequest request) {
		adminPageService.deleteMember(request.getParameter("nickname"));
		
		return "redirect:/memberpage.mdo";
	}
}
