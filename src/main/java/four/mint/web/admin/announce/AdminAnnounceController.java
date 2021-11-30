package four.mint.web.admin.announce;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AdminAnnounceController {
	
	@Autowired
	private AdminAnnounceService adminAnnounceService;
	
	@RequestMapping(value="/utilities-annoucement.mdo",method= RequestMethod.GET)
	public String announce(HttpSession session, HttpServletRequest request) {
		
		if(session.getAttribute("admin_id") == null) {
			return "redirect:login.mdo";
		}
			
		List<AdminAnnounceVO> adminannouncelist = adminAnnounceService.getAdminAnnounceList();
		request.setAttribute("list", adminannouncelist);
		
		return "/utilities-annoucement";
		
	}
	
	@RequestMapping(value="/announcement.mdo",method=RequestMethod.POST)
	public String annoucement(HttpServletRequest request) {
		AdminAnnounceVO announcementVO = new AdminAnnounceVO();
			announcementVO.setNotice_title(request.getParameter("title"));
			announcementVO.setNotice_content(request.getParameter("content"));
			announcementVO.setStatus(Integer.valueOf(request.getParameter("static_status")));
		
		adminAnnounceService.insertAdminAnnounce(announcementVO);
		
		return "redirect:utilities-annoucement.mdo";
		
	}
	

	@RequestMapping(value="/announce_delete.mdo",method=RequestMethod.POST)
	public String announce_delete(HttpServletRequest request) {
		adminAnnounceService.announce_delete(Integer.valueOf(request.getParameter("notice_seq")));
		 		
		return "redirect:utilities-annoucement.mdo";
	}
	

	@RequestMapping(value="/update_announcement.mdo",method=RequestMethod.POST)
	public String update_announcement(HttpServletRequest request) {
		
		AdminAnnounceVO announcementVO = new AdminAnnounceVO();
			announcementVO.setNotice_seq(Integer.valueOf(request.getParameter("seq")));
			announcementVO.setNotice_title(request.getParameter("title"));
			announcementVO.setNotice_content(request.getParameter("content"));
			announcementVO.setStatus(Integer.valueOf(request.getParameter("static_status")));
			
			adminAnnounceService.update_announcement(announcementVO);
		
		return "redirect:utilities-annoucement.mdo";
		
	}
}
