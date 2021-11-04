package four.mint.web.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import four.mint.web.user.impl.UserDAO;

@Controller
public class LoginController {
	
	@Autowired
	private UserService userService;

	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login() {
		
		return "/user/login";
	}
	
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(UserVO vo, HttpSession session) {
		UserVO user = userService.getUser(vo);
		if (user != null) {
			session.setAttribute("userEmail_id", user.getEmail_id());
			System.out.println("로그인 성공: " + user.getEmail_id());
			
			return "/index/index";
		} else {
			System.out.println("로그인 실패");
			
			return "/user/login";
		}
		
	}
}