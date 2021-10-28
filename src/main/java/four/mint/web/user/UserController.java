package four.mint.web.user;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import four.mint.web.user.impl.UserDAO;

@Controller
public class UserController {

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
	@RequestMapping(value = "/joinProc.do", method = RequestMethod.GET)
	public String joinProc() {
		UserDAO userDAO = new UserDAO();
		UserVO userVO = new UserVO();
			userVO.setEmail_id("hi");
		
		System.out.println("하이");
		userDAO.insertUser(userVO);
		System.out.println("짜증");
		
		return "/index/index";
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
