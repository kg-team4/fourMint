package four.mint.web.user;

import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
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
import org.springframework.transaction.annotation.Transactional;
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
import four.mint.web.user.community.CommunityCommentVO;
import four.mint.web.user.community.FindVO;
import four.mint.web.user.market.MarketRatingVO;
import four.mint.web.user.market.MarketService;
import four.mint.web.user.market.MarketVO;
import four.mint.web.user.store.StoreService;
import four.mint.web.user.store.StoreVO;
import four.mint.web.user.store.TransactionHistoryVO;

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
	
	@Autowired
	private StoreService storeService;

	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		return "/index/index";
	}

	@RequestMapping(value = "/join.do", method = RequestMethod.GET)
	public String join() {

		return "/user/join";
	}

	@RequestMapping(value = "/find.do", method = RequestMethod.GET)
	public String find(UserVO vo, Model model) {
		
		return "/user/find_id_pw";
	}
	
	@RequestMapping(value = "/find_id.do", method = RequestMethod.POST)
	public String findId(UserVO vo, Model model) {
		
		String id = userService.getId(vo);
		
		if(id != null) {
			model.addAttribute("id", id);
			model.addAttribute("flag", 0);
		}else {
			model.addAttribute("flag", 1);
		}
		
		return "/user/find_id_result";
	}
	
	@RequestMapping(value = "/find_pw.do", method = RequestMethod.POST)
	@ResponseBody
	public int findPw(Model model, HttpServletRequest request) {
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		
		UserVO vo = new UserVO();
		
		vo.setEmail_id(id);
		vo.setName(name);
		vo.setPhone(phone);
		
		String pw = userService.getPw(vo);
		
		int flag = 0;
		
		/*
		 * flag = 1 ??????????????? ????????? ??????????????? ??????
		 * flag = 2 ?????? 
		 */
		
		if(pw != null) {
			flag = 1;
			
		}else {
			flag = 2;
		}
	
		return flag;
	}
	@RequestMapping(value = "/update_pw.do", method = RequestMethod.GET)
	public String update_pw(@RequestParam(name="email_id") String email_id, Model model) {
		model.addAttribute("email_id", email_id);
		return "/user/update_pw";
	}
	
	@RequestMapping(value = "/update_pw.do", method = RequestMethod.POST)
	public String update_pw(UserVO vo) throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException {
		
		AES256Util.setKey(marketService.getKey().getKey());
	    AES256Util aes = new AES256Util();
	    String pw = aes.encrypt(vo.getPassword());
		vo.setPassword(pw);
		if(vo.getPassword() != null) 
			userService.updatePw(vo);
		
		return "redirect:login.do";
	}

	@RequestMapping(value = "/joinProc.do", method = RequestMethod.POST)
	public String joinProc(UserVO vo) throws UnsupportedEncodingException, NoSuchAlgorithmException, GeneralSecurityException {
		AES256Util.setKey(marketService.getKey().getKey());
		AES256Util aes = new AES256Util();
		
		String encoding = aes.encrypt(vo.getPassword());

		vo.setPassword(encoding);
		userService.insertUser(vo);

		return "/index/index";
	}

	@RequestMapping(value = "/profile.do", method = RequestMethod.GET)
	public String info(HttpServletRequest request, HttpSession session, UserVO uVO, FollowCountVO fVO) {
		if(session.getAttribute("userEmail_id") == null) {
			return "redirect:/login.do";
		}  
		
		if(session.getAttribute("sns") == null || session.getAttribute("nickname") != null ) {
			
			/* ?????? ?????? ???????????? */
			uVO = userService.getUserFromNickname(String.valueOf(session.getAttribute("nickname")));
			request.setAttribute("user", uVO);
			
			/* ????????? ?????? ?????? */
			fVO = followService.getFollowCount(uVO.getNickname());
			request.setAttribute("follow", fVO);
			
			/* ????????? ?????? ?????? */
			int boardCount = marketService.getUserBoardCount(uVO.getNickname());
			request.setAttribute("boardCount", boardCount);
			
			/* ????????? ????????? */
			List<FollowerVO> followerList = userService.getFollowers(uVO.getNickname());
			request.setAttribute("follower", followerList);
			
			/* ????????? ????????? */
			List<FollowingVO> followingList = userService.getFollowings(uVO.getNickname());
			request.setAttribute("following", followingList);
			
			/* ?????? ????????? ????????? ????????? */
			List<MarketVO> marketList = marketService.getMarketNickname(uVO.getNickname());
			request.setAttribute("market", marketList);
			
			/* ????????? ???????????? ????????? ????????? */
			List<CommunityBoardVO> communityList = communityBoardService.getCommunityListMe(uVO.getNickname());
			request.setAttribute("community", communityList);
			
			/* ????????? ???????????? ?????? ????????? */
			List<CommunityCommentVO> commuCommentList = communityBoardService.getCommentList(uVO.getNickname());
			request.setAttribute("commentList", commuCommentList);
			
			/* ?????? ?????? ??? */
			List<MarketVO> marketLikeList = marketService.getMarketLike(uVO.getNickname());
			request.setAttribute("marketLike", marketLikeList);
			
			/* ????????? ?????? ??? */
			List<StoreVO> storeLikeList = storeService.getStoreLike(uVO.getNickname());
			request.setAttribute("storeLike", storeLikeList);
			
			/* ????????? ?????? ?????? */
			List<TransactionHistoryVO> tVO = storeService.getTransactionList(uVO.getEmail_id());
			request.setAttribute("history", tVO);
			
			/* ?????? ?????? ?????? */
			List<MarketVO> buyVO = marketService.getMarketBuy(uVO.getNickname());
			request.setAttribute("buy", buyVO);
			
			/* ?????? ?????? ?????? ?????? ?????? */
			List<MarketRatingVO> raVO = marketService.getMarketRating(uVO.getNickname());
			request.setAttribute("rating", raVO);
		}
		
		return "/member/profile";
	}

	@RequestMapping(value = "/snsUpdate.do", method = RequestMethod.POST)
	@ResponseBody	
	public String snsUpdate(UserVO vo, HttpSession session, HttpServletRequest request) {
		System.out.println("sns?????? ??????");
		
		if(request.getParameter("name") == null) {
			vo.setEmail_id(session.getAttribute("userEmail_id").toString());
			vo.setAddress1(request.getParameter("address1"));
			vo.setAddress2(request.getParameter("address2"));
			vo.setAddress3(request.getParameter("address3"));
			session.setAttribute("address2", vo.getAddress2());
			
			userService.updateAddress(vo);
			
		}else {
			vo.setEmail_id(session.getAttribute("userEmail_id").toString());
			vo.setName(request.getParameter("name"));
			vo.setNickname(request.getParameter("nickname"));
			vo.setPhone(request.getParameter("phone"));
			vo.setBirth(request.getParameter("birth"));
			vo.setAddress1(request.getParameter("address1"));
			vo.setAddress2(request.getParameter("address2"));
			vo.setAddress3(request.getParameter("address3"));
			
			session.setAttribute("address2", vo.getAddress2());
			session.setAttribute("name", vo.getName());
			session.setAttribute("nickname", vo.getNickname());
			
			userService.updateSns(vo);
			
			
		}
		return "profile.do";
		
	}
	
	@RequestMapping(value = "/updateAddr.do", method = RequestMethod.POST)
	@ResponseBody
	public String updateAddr(HttpServletRequest request, HttpSession session, UserVO vo) {
		vo.setEmail_id(session.getAttribute("userEmail_id").toString());
		vo.setAddress1(request.getParameter("addr1"));
		vo.setAddress2(request.getParameter("addr2"));
		vo.setAddress3(request.getParameter("addr3"));

		userService.updateAddress(vo);
		session.setAttribute("address2", vo.getAddress2());

		return "/profile.do";
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

	// ????????? ????????????
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
		System.out.println("????: " + result);
		map.put("phoneCheck", result);

		return map;
	}

	// ???????????? ??????
	@RequestMapping(value = "/phoneCheck.do", method = RequestMethod.GET)
	@ResponseBody
	public String sendSMS(@RequestParam("phone") String userPhoneNumber) { // ????????? ???????????????
		int randomNumber = (int) ((Math.random() * (9999 - 1000 + 1)) + 1000);// ?????? ??????
		System.out.println(randomNumber);
		userService.certifiedPhoneNumber(userPhoneNumber, randomNumber);

		return Integer.toString(randomNumber);
	}

	// ????????? ??????
	@RequestMapping(value = "/mailCheck.do", method = RequestMethod.GET)
	@ResponseBody
	public String mailCheck(@RequestParam("email_id") String email) throws Exception {
		int rand = (int) ((Math.random() * (999999 - 100000 + 1)) + 100000);

		String from = "kgmain4@gmail.com";// ????????? ??? ????????????
		String to = email;
		String title = "??????????????? ????????? ???????????? ?????????.";
		String content = "[????????????] " + rand + " ?????????. <br/> ???????????? ???????????? ?????????????????????.";
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

	

  
  @RequestMapping(value = "/pwCheck.do", method = RequestMethod.POST)
  @ResponseBody
  public int pwCheck(HttpServletRequest request, HttpSession session, UserVO vo) throws UnsupportedEncodingException, NoSuchAlgorithmException, GeneralSecurityException {
	  String pw = request.getParameter("pw");
	  AES256Util.setKey(marketService.getKey().getKey());
      AES256Util aes = new AES256Util();
      pw = aes.encrypt(pw);
      System.out.println(pw);
      
	  vo.setEmail_id(session.getAttribute("userEmail_id").toString());
	  vo.setPassword(userService.getPassword(vo.getEmail_id()));
	  String realPw = vo.getPassword();
	  System.out.println(realPw);
	  
	  /*
	   * flag 1 = ???????????? ?????? 2 = ??????
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
	public String updatePw(UserVO vo, HttpSession session) throws UnsupportedEncodingException, NoSuchAlgorithmException, GeneralSecurityException {
		System.out.println("updatePw");
		vo.setEmail_id(session.getAttribute("userEmail_id").toString());
		
		if(vo.getPassword() != null){
			AES256Util.setKey(marketService.getKey().getKey());
			AES256Util aes = new AES256Util();
			
			String pw = aes.encrypt(vo.getPassword());
			vo.setPassword(pw);
			userService.updatePw(vo);
		}
		
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
	
	// ?????? ??? ?????? ????????? 
	@RequestMapping(value = "/searchAllResult.do", method = RequestMethod.GET)
	public String searchAllResult(Model model, String keyword, HttpSession session) {
		model.addAttribute("keyword", keyword);
		keyword = "%" + keyword + "%";
		
		String[] addSpl = null;
		List<MarketVO> mVL = marketService.getFindList(keyword);
		for(int i=0; i<mVL.size(); i++) {
			addSpl = mVL.get(i).getAddress2().split(" ");
			if(addSpl[1].substring(addSpl[1].length()-1).equals("???")) {
				mVL.get(i).setAddress2(addSpl[0] + " " + addSpl[1] + " " + addSpl[2]);
			} else {
				mVL.get(i).setAddress2(addSpl[0] + " " + addSpl[1]);
			}
		}
		model.addAttribute("market", mVL);
		
		FindVO fVO = new FindVO();
			fVO.setKeyword(keyword);
			String address = (String) session.getAttribute("address2");
			if(address != null) {
				String[] temp = address.split(" ");
				address = temp[1];
				if(temp[1].substring(address.length()-1).equals("???")) {
					address = temp[2];
				}
				address = "%" + address.substring(0, 2) + "%";
				fVO.setAddress(address);
			} 
		List<CommunityBoardVO> cVL = communityBoardService.getFindList(fVO);
		model.addAttribute("community", cVL);
		
		return "/board/search_all_result";
	}
	
	@RequestMapping(value = "/searchCommunityMoreResult.do", method = RequestMethod.GET)
	public String searchCommunityMoreResult(Model model, String keyword, HttpSession session) {
		model.addAttribute("keyword", keyword);
		keyword = "%" + keyword + "%";
		
			FindVO fVO = new FindVO();
			fVO.setKeyword(keyword);
			String address = (String) session.getAttribute("address2");
			if(address != null) {
				String[] temp = address.split(" ");
				address = temp[1];
				if(temp[1].substring(address.length()-1).equals("???")) {
					address = temp[2];
				}
				address = "%" + address.substring(0, 2) + "%";
				fVO.setAddress(address);
			} 
		List<CommunityBoardVO> cVL = communityBoardService.getFindList(fVO);
		model.addAttribute("community", cVL);
			
		return "/board/search_community_more_result";
	}
	
	@RequestMapping(value = "/searchMarketMoreResult.do", method = RequestMethod.GET)
	public String searchMarketMoreResult(Model model, String keyword, HttpSession session) {
		model.addAttribute("keyword", keyword);
		keyword = "%" + keyword + "%";
		
		String[] addSpl = null;
		List<MarketVO> mVL = marketService.getFindList(keyword);
		for(int i=0; i<mVL.size(); i++) {
			addSpl = mVL.get(i).getAddress2().split(" ");
			if(addSpl[1].substring(addSpl[1].length()-1).equals("???")) {
				mVL.get(i).setAddress2(addSpl[0] + " " + addSpl[1] + " " + addSpl[2]);
			} else {
				mVL.get(i).setAddress2(addSpl[0] + " " + addSpl[1]);
			}
		}
		model.addAttribute("market", mVL);
		
		return "/board/search_market_more_result";
	}
	
	/* ?????????, ????????? */
	@ResponseBody
	@PostMapping("profileUnfollow.do")
	public int proUnfollow(HttpSession session, String seller) {
		FollowingVO fVO = new FollowingVO();
			fVO.setNickname(String.valueOf(session.getAttribute("nickname")));
			fVO.setFollowing(seller);
		followService.deleteFollow(fVO);
	
		return 0;
	}
	
	@ResponseBody
	@PostMapping("profileFollow.do")
	public int proFollow(HttpSession session, String seller) {
		FollowingVO fVO = new FollowingVO();
			fVO.setNickname(String.valueOf(session.getAttribute("nickname")));
			fVO.setFollowing(seller);
		followService.insertFollow(fVO);
			
		return 0;
	}
	
	
}












