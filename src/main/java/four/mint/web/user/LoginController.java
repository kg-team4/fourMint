package four.mint.web.user;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import four.mint.web.common.AES256Util;
import four.mint.web.user.market.MarketService;



@Controller
public class LoginController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private MarketService marketService;
	
	@Inject
	private SnsValue naverSns;
	
	@RequestMapping(value = "/login.do", method = RequestMethod.GET )
	public String login(Model model, HttpSession session) throws Exception {
		System.out.println("여기"+session.getAttribute("userEmail_id"));
		if(session.getAttribute("userEmail_id") != null) {
			return "redirect:/home.do";
		} else {
			SNSLogin naverLogin = new SNSLogin(naverSns);
			model.addAttribute("naver_url", naverLogin.getNaverAuthURL());
		}
		return "/user/login";
		
	}
	
	@RequestMapping(value = "/kakaoLogin.do", method = RequestMethod.POST)
	public String kakaoLogin(@RequestBody  SnsVO vo, HttpSession session) throws Exception{
		String nickname = null;
		String address = null;
		String name = null;
		if(vo.getGender() == null) {
			vo.setGender(null);
		}
		else if(vo.getGender().equals("male")) {
			vo.setGender("man");
		}else {
			vo.setGender("woman");
		}
		
		List<UserVO> user = userService.getMem(vo);
		
		for(UserVO list : user) {
			nickname = list.getNickname();
			address = list.getAddress2();
			name = list.getName();
		}
		
		vo.setSocial_login("kakao");
//		System.out.println("email" + vo.getEmail());
//		System.out.println("!!!!!!!" + vo.getSocial_login());
		String doubleCheck = userService.getBySns(vo.getEmail());
//		System.out.println(doubleCheck);
		if(doubleCheck == null) {
			session.setAttribute("sns", vo.getSocial_login());
			session.setAttribute("userEmail_id", vo.getEmail());
			userService.kakaologin(vo);	
		}else {
			if(nickname != null) {
			session.setAttribute("address2", address);
			session.setAttribute("name", name);
			session.setAttribute("nickname", nickname);
			session.setAttribute("sns", vo.getSocial_login());
			session.setAttribute("userEmail_id", vo.getEmail());
			}else {
				session.setAttribute("sns", vo.getSocial_login());
				session.setAttribute("userEmail_id", vo.getEmail());
				
			}
		}
		return "redirect:home.do";
	}
	
	
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(UserVO vo, HttpSession session, Model model)throws Exception {
		String pw = vo.getPassword();
		AES256Util.setKey(marketService.getKey().getKey());
		AES256Util aes = new AES256Util();
		String encoding = aes.encrypt(pw);
		
		int flag = 0;
		UserVO user = userService.getUser(vo);
		
		if(user.getEmail_id() != null) {
			if(user.getPassword().equals(encoding)) {
				session.setAttribute("userEmail_id", user.getEmail_id());
				session.setAttribute("name", user.getName());
				session.setAttribute("address2", user.getAddress2());
				session.setAttribute("nickname", user.getNickname());
				System.out.println("로그인 성공: " + user.getEmail_id());
			} else {
				System.out.println("패스워드 오류");
				flag = 1;
				model.addAttribute("flag", flag);
			
				return "user/login";
			}
		}else {
			System.out.println("존재하지 않는 아이디");
			flag = 2;
			model.addAttribute("flag", flag);
			
			return "user/login";
		}
		
		return "index/index";
	}
	
	@RequestMapping(value = "/navercallback.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String NaverLgoinCallback(@RequestParam String code, HttpSession session)throws Exception {
		String nickname = null;
		String name = null;
		String address = null;
		 
		
		SnsValue sns = naverSns;
		
		SNSLogin snsLogin = new SNSLogin(sns);
		
		SnsVO snsUser = snsLogin.getNaverProfile(code);
		
		
		List<UserVO> vo = userService.getMem(snsUser);
		
		for(UserVO list : vo) {
			nickname = list.getNickname();
			name = list.getName();
			address = list.getAddress2();
		}
		String doubleCheck = userService.getBySns(snsUser.getEmail());
		
		if(doubleCheck == null) {
//			System.out.println(doubleCheck);
			session.setAttribute("sns", snsUser.getSocial_login());
			session.setAttribute("userEmail_id", snsUser.getEmail());
			userService.naverlogin(snsUser);
		}else {
			if(nickname != null) {
				session.setAttribute("sns", snsUser.getSocial_login());
				session.setAttribute("userEmail_id", snsUser.getEmail());
				session.setAttribute("address2", address);
				session.setAttribute("name", name);
				session.setAttribute("nickname", nickname);
			}
			session.setAttribute("sns", snsUser.getSocial_login());
			session.setAttribute("userEmail_id", snsUser.getEmail());
			return "redirect:home.do";
		}
		
		return "/index/index";
	}
	
}