package four.mint.web.admin.page;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminPageMemberController {
	
	@Autowired
	private AdminPageService adminPageService;
	
	@RequestMapping(value="/memberpage.mdo", method= RequestMethod.GET)
	public String memberpage(HttpServletRequest request) {
		List<AdminPageVO> adminpagelist = adminPageService.getAdminPageList();
		
		request.setAttribute("list", adminpagelist);
		
		return "/memberpage";
	}
}
