package four.mint.web.user;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserController {
	
	@Autowired
	private JavaMailSenderImpl mailSender;

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
	
	// 아이디 중복확인
	@ResponseBody
	@RequestMapping(value = "/idCheck.do", method = RequestMethod.POST, produces="application/json")
	public Map<Object, Object> idCheck(@RequestBody String id) throws Exception {
		Map<Object, Object> map = new HashMap<Object, Object>();
		
		int result = 0;
		
		result = userService.idCheck(id);
		map.put("check", result);
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "/nickCheck.do", method = RequestMethod.POST, produces="application/json")
	public Map<Object, Object> nickCheck(@RequestBody String nick) throws Exception {
		Map<Object, Object> map = new HashMap<Object, Object>();
		
		int result = 0;
		
		result = userService.nickCheck(nick);
		map.put("nickCheck", result);
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "/phoneCheck.do", method = RequestMethod.POST, produces="application/json")
	public Map<Object, Object> phoneCheck(@RequestBody String phone) throws Exception {
		Map<Object, Object> map = new HashMap<Object, Object>();
		
		int result = 0;
		
		result = userService.phoneCheck(phone);
		map.put("phoneCheck", result);
		
		return map;
	}

	// 전화번호 인증
	@RequestMapping(value = "/phoneCheck.do", method = RequestMethod.GET)
	@ResponseBody
	public String sendSMS(@RequestParam("phone") String userPhoneNumber) { // 휴대폰 문자보내기
		int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);//난수 생성

		userService.certifiedPhoneNumber(userPhoneNumber, randomNumber);
		
		return Integer.toString(randomNumber);
	}
	
	// 이메일 인증
	@RequestMapping(value = "/mailCheck.do", method = RequestMethod.GET)
	@ResponseBody
	public String mailCheck(@RequestParam("email_id") String email) throws Exception {
		int rand = (int) ((Math.random() * (999999 - 100000 + 1)) + 100000);

		String from = "kgmain4@gmail.com";// 보내는 이 메일주소
		String to = email;
		String title = "회원가입시 필요한 인증번호 입니다.";
		String content = "[인증번호] " + rand + " 입니다. <br/> 인증번호 확인란에 기입해주십시오.";
		String num = "";
		try {
			MimeMessage mail = mailSender.createMimeMessage();
			MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");

			mailHelper.setFrom(from);
			mailHelper.setTo(to);
			mailHelper.setSubject(title);
			mailHelper.setText(content, true);

			mailSender.send(mail);
			num = Integer.toString(rand);
		} catch (Exception e) {
			num = "error";
		}
		return num;
	}
}