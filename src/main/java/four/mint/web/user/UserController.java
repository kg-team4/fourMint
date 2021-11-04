package four.mint.web.user;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;

	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "/index/index";
	}

	@RequestMapping(value = "/join.do", method = RequestMethod.GET)
	public String join() {
		
		return "/user/join";
	}
	@RequestMapping(value = "/joinProc.do", method = RequestMethod.POST)
	public String joinProc(UserVO vo) {
		System.out.println("회원가입 완료");
		userService.insertUser(vo);
		
		return "/index/index";
	}
	
	@RequestMapping(value = "/info.do", method = RequestMethod.GET)
	public String info() {
		
		return "/member/info";
	}

}
