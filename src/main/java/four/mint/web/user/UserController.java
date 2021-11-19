package four.mint.web.user;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import four.mint.web.common.AES256Util;
import four.mint.web.common.AwsS3;
import four.mint.web.user.community.CommunityBoardService;
import four.mint.web.user.community.CommunityBoardVO;
import four.mint.web.user.market.MarketService;
import four.mint.web.user.market.MarketVO;

@Controller
public class UserController {

	@Autowired
	private JavaMailSenderImpl mailSender;

	@Autowired
	private UserService userService;
	
	@Autowired
	private MarketService marketService;
	
	@Autowired
	private FollowService followService;
	
	@Autowired
	private CommunityBoardService communityBoardService;

	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		return "/index/index";
	}

	@RequestMapping(value = "/join.do", method = RequestMethod.GET)
	public String join() {

		return "/user/join";
	}

	@RequestMapping(value = "/find.do", method = RequestMethod.GET)
	public String find() {

		return "/user/find_id_pw";
	}

	@RequestMapping(value = "/joinProc.do", method = RequestMethod.POST)
	public String joinProc(UserVO vo) {
		System.out.println("회원가입 완료");
		userService.insertUser(vo);

		return "/index/index";
	}

	@RequestMapping(value = "/profile.do", method = RequestMethod.GET)
	public String info(HttpServletRequest request, HttpSession session, UserVO uVO, FollowCountVO fVO) {
		/* 유저 정보 불러오기 */
		uVO = userService.getUserFromNickname(String.valueOf(session.getAttribute("nickname")));
		request.setAttribute("user", uVO);
		
		/* 팔로우 정보 확인 */
		fVO = followService.getFollowCount(uVO.getNickname());
		request.setAttribute("follow", fVO);
		
		/* 게시글 개수 확인 */
		int boardCount = marketService.getUserBoardCount(uVO.getNickname());
		request.setAttribute("boardCount", boardCount);
		
		/* 팔로워 리스트 */
		List<FollowerVO> followerList = userService.getFollowers(uVO.getNickname());
		request.setAttribute("follwer", followerList);
		
		/* 팔로잉 리스트 */
		List<FollowingVO> followingList = userService.getFollowings(uVO.getNickname());
		request.setAttribute("following", followingList);
		
		/* 판매 등록한 게시글 리스트 */
		List<MarketVO> marketList = marketService.getMarketNickname(uVO.getNickname());
		request.setAttribute("market", marketList);
		
		/* 등록한 커뮤니티 게시글 리스트 */
		List<CommunityBoardVO> communityList = communityBoardService.getCommunityListMe(uVO.getNickname());
		request.setAttribute("community", communityList);
		
		/* 등록한 커뮤니티 댓글 리스트 */
		
		
		return "/member/profile";
	}
	
	@PostMapping("/profileImage.do")
	public String profileImage(@RequestParam("file") MultipartFile file, HttpServletRequest requset, UserVO uVO) {
		try {
			if(file != null) {
				AES256Util.setKey(marketService.getKey().getKey());
				AES256Util aes = new AES256Util();
				AwsS3.setAccessKey(aes.decrypt(marketService.getSkey().getAckey()));
				AwsS3.setSecretKey(aes.decrypt(marketService.getSkey().getSekey()));
				AwsS3 awsS3 = AwsS3.getInstance();
				String uploadFolder = "https://mintmarket.s3.ap-northeast-2.amazonaws.com/";
				String key = "profile/" + file.getOriginalFilename();
				InputStream is = file.getInputStream();
				String contentType = file.getContentType();
				long contentLength = file.getSize();
				awsS3.upload(is, key, contentType, contentLength);
					uVO.setNickname(requset.getParameter("nickname"));
					uVO.setProfile(uploadFolder + key);
				userService.updateProfile(uVO);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		return "redirect:/profile.do";
	}

	// 아이디 중복확인
	@ResponseBody
	@RequestMapping(value = "/idCheck.do", method = RequestMethod.POST, produces = "application/json")
	public Map<Object, Object> idCheck(@RequestBody String id) throws Exception {
		Map<Object, Object> map = new HashMap<Object, Object>();

		int result = 0;

		result = userService.idCheck(id);
		map.put("check", result);

		return map;
	}

	@ResponseBody
	@RequestMapping(value = "/nickCheck.do", method = RequestMethod.POST, produces = "application/json")
	public Map<Object, Object> nickCheck(@RequestBody String nick) throws Exception {
		Map<Object, Object> map = new HashMap<Object, Object>();

		int result = 0;

		result = userService.nickCheck(nick);
		map.put("nickCheck", result);

		return map;
	}

	@ResponseBody
	@RequestMapping(value = "/phoneCheck.do", method = RequestMethod.POST, produces = "application/json")
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
		int randomNumber = (int) ((Math.random() * (9999 - 1000 + 1)) + 1000);// 난수 생성

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
	  System.out.println(pw);
	  vo.setEmail_id(session.getAttribute("userEmail_id").toString());
	  vo.setPassword(userService.getPw(vo));
	  String realPw = vo.getPassword();
	  System.out.println(realPw);
	  
	  
	  /*
	   * flag 1 = 비밀번호 일치 2 = 불일
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
	  System.out.println(vo.getPassword());
	  vo.setEmail_id(session.getAttribute("userEmail_id").toString());
	  
	  System.out.println("!!!!!"+vo.getPassword());
	  
	  if(vo.getPassword() != null) {
		  userService.updatePw(vo);
	  }
	  
	  return "redirect:profile.do";
  }
}