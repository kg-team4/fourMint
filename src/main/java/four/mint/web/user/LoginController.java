package four.mint.web.user;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {
	
	@Autowired
	private UserService userService;
	
	@Inject
	private SnsValue naverSns;
	
	@RequestMapping(value = "/login.do", method = RequestMethod.GET )
	public String login(Model model, HttpSession session) throws Exception {
		System.out.println(session.getAttribute("userEmail_id"));
		if(session.getAttribute("userEmail_id") != null) {
			return "redirect:/home.do";
		}else {
			
		
		SNSLogin naverLogin = new SNSLogin(naverSns);
		model.addAttribute("naver_url", naverLogin.getNaverAuthURL());
		}
		return "/user/login";
		
	}
	
	@RequestMapping(value = "/kakaoLogin.do", method = RequestMethod.POST)
	public String kakaoLogin(@RequestBody  KakaoVO vo, HttpSession session) throws Exception{
		System.out.println("!!!!"+vo.getGender());
		if(vo.getGender() == null) {
			vo.setGender(null);
		}
		else if(vo.getGender().equals("male")) {
			vo.setGender("man");
		}else {
			vo.setGender("woman");
		}
		
		vo.setSocial_login("kakao");
		System.out.println("email" + vo.getEmail());
		System.out.println("!!!!!!!" + vo.getSocial_login());
		String doubleCheck = userService.getBySns(vo.getEmail());
		System.out.println(doubleCheck);
		if(doubleCheck == null) {
			session.setAttribute("sns", vo.getSocial_login());
			session.setAttribute("userEmail_id", vo.getEmail());
			userService.kakaologin(vo);	
		}else {
			session.setAttribute("sns", vo.getSocial_login());
			System.out.println(vo.getSocial_login());
			session.setAttribute("userEmail_id", vo.getEmail());
		}
		return "redirect:home.do";
	}
	
	
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(UserVO vo, HttpSession session) {
		String id = vo.getEmail_id();
		String pw = vo.getPassword();
		
		
		UserVO user = userService.getUser(vo);
		
		if(id.equals(user.getEmail_id())) {
			if(pw.equals(user.getPassword())) {
				
			}
		}
		
		
		if (user != null) {
			session.setAttribute("userEmail_id", user.getEmail_id());
			session.setAttribute("name", user.getName());
			session.setAttribute("address2", user.getAddress2());
			session.setAttribute("nickname", user.getNickname());
			System.out.println("로그인 성공: " + user.getEmail_id());
			
			return "/index/index";
		} else {
			System.out.println("로그인 실패");
			
			return "/user/login";
		}
		
	}
	@RequestMapping(value = "/navercallback.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String NaverLgoinCallback(@RequestParam String code, HttpSession session)throws Exception {
		
		SnsValue sns = naverSns;
		
		SNSLogin snsLogin = new SNSLogin(sns);
		
		NaverVO snsUser = snsLogin.getNaverProfile(code);
		
		
		
		String doubleCheck = userService.getBySns(snsUser.getEmail());
		
		
		if(doubleCheck == null) {
			System.out.println(doubleCheck);
			session.setAttribute("sns", snsUser.getSocial_login());
			session.setAttribute("userEmail_id", snsUser.getEmail());
			
			userService.naverlogin(snsUser);
		}else {
			session.setAttribute("sns", snsUser.getSocial_login());
			System.out.println(snsUser.getSocial_login());
			System.out.println(snsUser.getEmail());
			session.setAttribute("userEmail_id", snsUser.getEmail());
			return "redirect:home.do";
		}
		
		return "/index/index";
	}
	
}