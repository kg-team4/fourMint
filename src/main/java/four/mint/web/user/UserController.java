package four.mint.web.user;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

import four.mint.web.user.impl.UserDAO;

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
   
   @RequestMapping(value = "/snsUpdate.do", method = RequestMethod.POST)
   public String snsUpdate(UserVO vo, HttpSession session) {
	   System.out.println("sns유저 수정");
	   session.setAttribute("address2", vo.getAddress2());
	   session.setAttribute("name", vo.getName());
	   session.setAttribute("nickname", vo.getNickname());
	   vo.setEmail_id(session.getAttribute("userEmail_id").toString());
	   userService.updateSns(vo);
	   
	   return "redirect:/profile.do";
   }
   
   @RequestMapping(value = "/profile.do", method = RequestMethod.GET)
   public String info() {
      
      return "/member/profile";
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
   
   @RequestMapping(value = "/updateAddr.do", method = RequestMethod.POST)
   @ResponseBody
   public String updateAddr(HttpServletRequest request, HttpSession session ,UserVO vo ) {
	  vo.setEmail_id(session.getAttribute("userEmail_id").toString());
	  System.out.println(session.getAttribute("userEmail_id").toString());
	  vo.setAddress1(request.getParameter("addr1"));
	  vo.setAddress2(request.getParameter("addr2"));
	  vo.setAddress3(request.getParameter("addr3"));
	  
	  userService.updateAddress(vo);
	  System.out.println(vo.getEmail_id());
	  System.out.println(vo.getAddress2());
	  
	  return "/profile.do";
   }
  
  @RequestMapping(value = "/pwCheck.do", method = RequestMethod.POST)
  @ResponseBody
  public int pwCheck(HttpServletRequest request, HttpSession session, UserVO vo) {
	  String pw = request.getParameter("pw");
	  System.out.println("111"+pw);
	  vo.setEmail_id(session.getAttribute("userEmail_id").toString());
	  vo.setPassword(userService.getPw(vo));
	  String realPw = vo.getPassword();
	  System.out.println("222"+realPw);
	  
	  
	  /*
	   * flag 1 = 비밀번호 일치 2 = 불일치
	   */
	  int flag = 0;
	  if(pw.equals(realPw)) {
		  flag = 1;
		  System.out.println(flag);
	  }else {
		  flag = 2;
	  }
	  
	  
	  return flag;
  }
  
  @RequestMapping(value = "/updatePw.do")
  public String updatePw(UserVO vo, HttpSession session) {
	  System.out.println("updatePw");
	  vo.setEmail_id(session.getAttribute("userEmail_id").toString());
	 
	  if(vo.getPassword() != null) 
		  userService.updatePw(vo);
	  
	  return "redirect:profile.do";
  }
  
  @RequestMapping(value = "/secession.do")
  public String secession(HttpSession session) {
	  System.out.println("secession");
	  String id = session.getAttribute("userEmail_id").toString();
	  
	  System.out.println(id);
	  
	  userService.updateDate(id);
	  userService.insertDel(id);
	  userService.dropMem(id);
	  
	  session.invalidate();
	  return "redirect:home.do";
  }
}