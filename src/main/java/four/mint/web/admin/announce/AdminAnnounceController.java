package four.mint.web.admin.announce;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminAnnounceController {
	
	@Autowired
	private AdminAnnounceService adminAnnounceService;
	
	@RequestMapping(value="/utilities-annoucement.mdo",method= RequestMethod.GET)
	public String announce(HttpSession session, HttpServletRequest request) {
		
		if(session.getAttribute("admin_id") == null) {
			return "/login";
		}
		else {
			
		List<AdminAnnounceVO> adminannouncelist = adminAnnounceService.getAdminAnnounceList();
		request.setAttribute("list", adminannouncelist);
		
		return "/utilities-annoucement";
		
		}
	}
	
}
