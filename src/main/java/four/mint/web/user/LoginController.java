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
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuth2AccessTokenErrorResponse;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.itextpdf.tool.xml.css.parser.state.Properties;

import four.mint.web.user.impl.UserDAO;

@Controller
public class LoginController {
	
	@Autowired
	private UserService userService;
	
	@Inject
	private SnsValue naverSns;
	
	@Inject
	private SnsValue kakaoSns;

	@RequestMapping(value = "/login.do", method = RequestMethod.GET )
	public String login(Model model) throws Exception {
		
		SNSLogin naverLogin = new SNSLogin(naverSns);
		model.addAttribute("naver_url", naverLogin.getNaverAuthURL());
		
//		SNSLogin kakaoLogin = new SNSLogin(kakaoSns);
//		model.addAttribute("kakao_url", kakaoLogin.getKakaoAuthURL());
//		String reqUrl = 
//				"https://kauth.kakao.com/oauth/authorize"
//				+ "?client_id=	67f4a0492398f30f491a028bba163eac"
//				+ "&redirect_uri=http://localhost:8080/kakaocallback.do"
//				+ "&response_type=code";
//		model.addAttribute("kakao_url", reqUrl);
		
		return "/user/login";
	}
	@RequestMapping(value = "/kakaoLogin.do", method = RequestMethod.POST)
	public String kakaoLogin(@RequestBody  KakaoVO vo, HttpSession session)throws Exception{
		
		
		if(vo.getGender().equals("male")) {
			vo.setGender("man");
		}else {
			vo.setGender("woman");
		}
		
		
		vo.setSocial_login("kakao");
		System.out.println("email" + vo.getEmail());
		System.out.println("!!!!!!!" + vo.getSocial_login());
		String doubleCheck = userService.getBySns(vo.getEmail());
		System.out.println(doubleCheck);
		if(doubleCheck.equals("kakao")) {
			session.setAttribute("sns", vo.getSocial_login());
			session.setAttribute("userEmail_id", vo.getEmail());
		}else {
			session.setAttribute("sns", vo.getSocial_login());
			session.setAttribute("userEmail_id", vo.getEmail());
			userService.kakaologin(vo);	
			
			
			
		}
		
		return "redirect:home.do";
		
		
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
	@RequestMapping(value = "/navercallback.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String NaverLgoinCallback(@RequestParam String code, HttpSession session)throws Exception {
		
		SnsValue sns = naverSns;
		
		SNSLogin snsLogin = new SNSLogin(sns);
		
		NaverVO snsUser = snsLogin.getNaverProfile(code);
		
		System.out.println(snsUser.getNaverid());
		System.out.println(snsUser.getPhone());
		System.out.println(snsUser.getBirth());
		
		String doubleCheck = userService.getBySns(snsUser.getEmail());
		
		System.out.println(doubleCheck);
		if(doubleCheck.equals("naver")) {
			System.out.println(doubleCheck);
			session.setAttribute("sns", snsUser.getSocial_login());
			session.setAttribute("userEmail_id", snsUser.getEmail());
		}else {
			session.setAttribute("sns", snsUser.getSocial_login());
			session.setAttribute("userEmail_id", snsUser.getEmail());
			userService.naverlogin(snsUser);
			return "redirect:home.do";
		}
		
		
		
		return "index/index";
	}
	
	@RequestMapping(value = "/kakaocallback.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String KakaoLoginCallback(@RequestParam(value = "code", required = false) String code, HttpSession session)throws Exception{
		
		
//		SnsValue sns = kakaoSns;
//		
//		SNSLogin snsLogin = new SNSLogin(sns);
//		JsonObject snsUser = snsLogin.getKakaoProfile(code);
//		
//		System.out.println("profile ==="+ snsUser);
		
		
		return "index/index";
	}
	
	
//	@RequestMapping(value = "/{snsService}/callback.do", method =  {RequestMethod.GET, RequestMethod.POST})
//	public String snsLoginCallback(@PathVariable("snsService") String snsService, @RequestParam String code, HttpSession session) 
//			throws Exception,OAuth2AccessTokenErrorResponse{
//		
//		SnsValue sns = null;
//		
//		if(StringUtils.equals("naver", snsService))
//			sns = naverSns;
//		else
//			sns = kakaoSns;
//		
//		//code를 이용하여 토큰 받고 profile 정보 가져오기
//		SNSLogin snsLogin = new SNSLogin(sns);
//		
//		SnsUserVO snsUser = snsLogin.getUserProfile(code);
//		System.out.println("profile ===="+snsUser);
//		
//		
//		session.setAttribute("userEmail_id", snsUser.getEmail());
//		
//		return "index/index";
//	}

	


          
	
}