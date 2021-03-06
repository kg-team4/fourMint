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
			return "redirect:login.mdo";
		}
		
		List<AdminPageVO> adminpagelist = adminPageService.getAdminPageList();
		request.setAttribute("list", adminpagelist);
		
		return "/memberpage";
	}
	
	@RequestMapping(value = "/deleteMember.mdo", method = RequestMethod.POST)
	public String deleteMember(HttpServletRequest request) {
		AdminPageVO newVO = adminPageService.getMemberOne(request.getParameter("nickname"));
		adminTableService.insertMember(newVO);
		adminPageService.deleteMember(request.getParameter("nickname"));
		
		return "redirect:/memberpage.mdo";
	}
	
	@RequestMapping(value = "/memberlist.mdo", method = RequestMethod.GET)
	public String memberlist(HttpSession session, HttpServletRequest request) {
		if(session.getAttribute("admin_id") == null) {
			return "redirect:login.mdo";
		}
		
		List<AdminTableVO> adminMemberlist = adminTableService.getAdminTableList();

		request.setAttribute("list", adminMemberlist);

		return "/memberlist";
	}

	@RequestMapping(value = "/delete.mdo", method = RequestMethod.POST)
	public String delMem(HttpServletRequest request) {
		adminTableService.deleteMember(request.getParameter("nickname"));
		
		return "redirect:/memberlist.mdo";
	}
}
