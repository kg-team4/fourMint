package four.mint.web.user;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class LogoutController {
	
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		session.invalidate();
		
//		Cookie loginCookie = WebUtils.getCookie(request, "userEmail_id");
//		if(loginCookie != null) {
//			loginCookie.setPath("/");
//			loginCookie.setMaxAge(0);
//			
//			response.addCookie(loginCookie);
//		}
		
		return "/index/index";
	}
	
	@RequestMapping("/kakaoLogout.do")
	public String kakaoLogout(HttpSession session) {
		session.invalidate();
		System.out.println("111111");
		
		return "redirect:home.do";
	}
}
