package four.mint.web.user;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import four.mint.web.user.impl.UserDAO;

@Controller
public class UserController {

	@RequestMapping(value = "/home.user", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "/index/index";
	}

	@RequestMapping(value = "/login.user", method = RequestMethod.GET)
	public String login() {
		
		return "/user/login";
	}
	
	@RequestMapping(value = "/join.user", method = RequestMethod.GET)
	public String join() {
		
		return "/user/join";
	}
	@RequestMapping(value = "/joinProc.user", method = RequestMethod.GET)
	public String joinProc() {
		UserDAO userDao = new UserDAO();
		userDao.insert();
		
		return "/user/index";
	}
	
	@RequestMapping(value = "/logout.user", method = RequestMethod.GET)
	public String logout() {
//		session.invalidate();
		
		return "/index/index";
	}

	@RequestMapping(value = "/info.user", method = RequestMethod.GET)
	public String info() {
		
		return "/member/info";
	}
	
	
}
