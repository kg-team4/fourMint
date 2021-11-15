package four.mint.web.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LogoutController {
	
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		session.invalidate();
		
		return "/index/index";
	}
	
	@RequestMapping("/kakaoLogout.do")
	public String kakaoLogout(HttpSession session) {
		session.invalidate();
		System.out.println("111111");
		
		return "redirect:home.do";
	}
}
