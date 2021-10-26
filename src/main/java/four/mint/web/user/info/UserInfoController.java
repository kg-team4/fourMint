package four.mint.web.user.info;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserInfoController {

	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "/index/index";
	}

	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login() {
		
		return "/user/login";
	}
	
	@RequestMapping(value = "/join.do", method = RequestMethod.GET)
	public String join() {
		
		return "/user/join";
	}
	
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout() {
//		session.invalidate();
		
		return "/index/index";
	}

	@RequestMapping(value = "/info.do", method = RequestMethod.GET)
	public String info() {
		
		return "/member/info";
	}
	
	
}
