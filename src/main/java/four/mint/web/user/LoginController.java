package four.mint.web.user;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import four.mint.web.user.impl.UserDAO;

@Controller
public class LoginController {
	
	@Inject 
	SnsValue naverSns;
	
	@Inject
	SnsValue kakaoSns;
	
	@Inject
	private UserService userService;
	
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login(Model model)throws Exception{
		
		SNSLogin KakaoLogin = new SNSLogin(kakaoSns);
		model.addAttribute("naver_url", KakaoLogin.getKakaoAuthURL());
		
		SNSLogin NaverLogin = new SNSLogin(naverSns);
		model.addAttribute("kakao_url", NaverLogin.getNaverAuthURL());
		
		return "user/login";
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
	@RequestMapping(value = "/naverlogin.do", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody String getNaverAuthUrl(HttpServletRequest request)throws Exception{
		SNSLogin snsLogin = new SNSLogin(naverSns);
		
		String reqUrl = snsLogin.getNaverAuthURL();
		System.out.println("naverUrl "+reqUrl);
		
		return reqUrl;
	}
	
	@RequestMapping(value = "/kakaologin.do", method = { RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody String getKakaoAuthUrl(HttpServletRequest request)throws Exception{
		SNSLogin snsLogin = new SNSLogin(kakaoSns);
		
		String reqUrl = snsLogin.getKakaoAuthURL();
		System.out.println("kakaoUrl "+reqUrl);
		return reqUrl;
		
	}
	
	@RequestMapping(value = "/{service}/callback.do", method = { RequestMethod.GET, RequestMethod.POST})
	public String snsLoginCallback(@PathVariable("service") String snsService, HttpSession session, @RequestParam(value = "code") String code) throws Exception {
		
		
		
		SnsValue sns = null;
			if(StringUtils.equals("naver", snsService)) {
				sns = naverSns;
			}else {
				sns = kakaoSns;
			}
			
			//code를 이용하여 accesstoken을 이용하여 사용자의 profile 정보 가져오
			SNSLogin snsLogin = new SNSLogin(sns);
			
			System.out.println("코드"+code);
			String snsUser = snsLogin.getUserProfile(code);
			
			
			System.out.println("???????????????"+snsUser);
//			System.out.println("profile "+snsUser.getEmail());
			//user 정보
//			model.addAttribute("result", snsUser);
			
//			session.setAttribute("result", snsUser.getEmail());

	
		return "/index/index";
	}
}