package four.mint.web.admin.used.faq;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminFaqController {
	
	@Autowired
	private AdminFaqService adminFaqService;
	
	@RequestMapping(value="/utilities-usedfaq.mdo",method= RequestMethod.GET)
	public String faq(HttpServletRequest request) {
		List<AdminFaqVO> aminfaqlist = adminFaqService.getAdminFaqList();
		
		request.setAttribute("list", aminfaqlist);
		return "/utilities-usedfaq";
	}

}
