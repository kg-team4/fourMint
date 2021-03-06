package four.mint.web.user.market;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import four.mint.web.admin.banner.market.AdminBannerMarketService;
import four.mint.web.common.AES256Util;
import four.mint.web.common.AwsS3;
import four.mint.web.user.FollowCountVO;
import four.mint.web.user.FollowService;
import four.mint.web.user.FollowingVO;
import four.mint.web.user.UserService;
import four.mint.web.user.UserVO;
import four.mint.web.user.board.common.LikeVO;
import four.mint.web.user.board.common.MarketBuyerVO;
import four.mint.web.user.board.common.SearchVO;
import four.mint.web.user.community.CommunityBoardService;
import four.mint.web.user.community.CommunityBoardVO;

@Controller
public class MarketController {

	@Autowired
	private MarketService marketService;

	@Autowired
	private UserService userService;
	
	@Autowired
	private FollowService followService;
	
	@Autowired
	private CommunityBoardService communityBoardService;

	@Autowired
	private AdminBannerMarketService adminBannerMarketService;
	
	@RequestMapping(value = "/marketBoardList.do", method = RequestMethod.GET)
	public String marketBoardList(HttpServletRequest request, HttpSession session) {

		String market_image1 = adminBannerMarketService.getBanner(1);
		String market_image2 = adminBannerMarketService.getBanner(2);
		String market_image3 = adminBannerMarketService.getBanner(3);
		String market_image4 = adminBannerMarketService.getBanner(4);
		request.setAttribute("market_banner1", market_image1);
		request.setAttribute("market_banner2", market_image2);
		request.setAttribute("market_banner3", market_image3);
		request.setAttribute("market_banner4", market_image4);
		
		List<MarketVO> bestVO = marketService.getBest();
		request.setAttribute("best", bestVO);
		
		List<MarketVO> recentVO = marketService.getRecent();
		request.setAttribute("recent", recentVO);
		
		String address = (String) session.getAttribute("address2");
		if(address != null) {
			HashMap<String, String> searchTemp = new HashMap<String, String>();
			
			String[] temp = address.split(" ");
			address = temp[1];
			if(temp[1].substring(address.length()-1).equals("???")) {
				address = temp[2];
			}
			request.setAttribute("addressSub", address);
			
			searchTemp.put("nickname", String.valueOf(session.getAttribute("nickname")));
			address = "%" + address.substring(0, 2) + "%";
			searchTemp.put("address", address);
			
			List<MarketVO> areaVO = marketService.getMarketListAddress(searchTemp);
			request.setAttribute("address", areaVO);
		}
		
		return "/board/market_all_post_list";
	}

	@RequestMapping(value = "/marketBoard.do", method = RequestMethod.GET)
    public String mintBoard(HttpServletRequest request, MarketVO marVO, FollowCountVO fVO, HttpSession session) {
		if(session.getAttribute("userEmail_id") == null) {
			return "redirect:/login.do";
		} else if(session.getAttribute("nickname") == null) {
			return "redirect:/profile.do";
		}
		/* ????????? ?????? */
		marketService.updateViews(Integer.valueOf(request.getParameter("seq")));
		
		/* ????????? ?????? ??? ?????? ?????? ?????? */
		marVO = marketService.getMarketOne(Integer.valueOf(request.getParameter("seq")));
		request.setAttribute("content", marVO);
		
		/* ????????? ????????? */
		UserVO user = userService.getUserFromNickname(marVO.getNickname());
		request.setAttribute("user", user);
		
		/* ????????? ?????? ?????? */
		fVO = followService.getFollowCount(user.getNickname());
		request.setAttribute("follow", fVO);
		
		/* ????????? ?????? ?????? */
		int boardCount = marketService.getUserBoardCount(user.getNickname());
		request.setAttribute("boardCount", boardCount);
		
		/* ????????? ?????? ????????? ?????? */
		List<MarketVO> marketList = marketService.getMarketNickname(user.getNickname());
		request.setAttribute("market", marketList);
		
		/* ????????? ????????? ???????????? ????????? ????????? */
		List<CommunityBoardVO> communityList = communityBoardService.getCommunityListMe(user.getNickname());
		request.setAttribute("community", communityList);
		
		/* ????????? ???????????? ?????? */
		int result = 0;
		LikeVO tempLVO = new LikeVO();
			tempLVO.setNickname(String.valueOf(session.getAttribute("nickname")));
			tempLVO.setSeq(Integer.valueOf(request.getParameter("seq")));
		LikeVO lVO = marketService.getLike(tempLVO);
		if(lVO == null) {
			result = 0;
			request.setAttribute("like", result);
		} else {
			result = 1;
			request.setAttribute("like", result);
		}
		
		/* ????????? ?????? ?????? */
		int sum = marketService.searchLikes(Integer.valueOf(request.getParameter("seq")));
		request.setAttribute("likes", sum);
		
		/* ????????? ?????? */
		int folResult = 0;
		FollowingVO fchVO = new FollowingVO();
			fchVO.setNickname(String.valueOf(session.getAttribute("nickname")));
			fchVO.setFollowing(user.getNickname());
		FollowingVO nfVO = followService.getCheck(fchVO);
		if(nfVO == null) {
			folResult = 0;
			request.setAttribute("fol", folResult);
		} else {
			folResult = 1;
			request.setAttribute("fol", folResult);
		}
		
		/* ?????? ?????? ?????? ?????? ?????? */
		List<MarketRatingVO> raVO = marketService.getMarketRating(user.getNickname());
		request.setAttribute("rating", raVO);
		
		return "/board/market_post_content";
	}

	@RequestMapping(value = "/marketDetailList.do", method = RequestMethod.GET)
	public String mintDetailList(HttpServletRequest request, HttpServletResponse response, SearchVO svo) {
		List<MarketCategoryBigVO> marketCategoryBig = marketService.getMarketCategoryBig();
		request.setAttribute("marketCategoryBig", marketCategoryBig);
		
		request.setAttribute("keyword", "");
		svo.setKeyword("%%");
		request.setAttribute("option", "title");
		svo.setOption("title");
		String kind = request.getParameter("kind");
		
		/*????????? ?????? ??????*/
		int page = 1;
		int limit = 9;     
		
		svo.setKind(kind);
		svo.setPage(page);
		
		int listCount = marketService.getKindTwoCount(svo);
		int maxPage = (listCount+limit-1)/limit;
		int startPage = ((page-1)/5) * 5 + 1;
		int endPage = startPage + 5 - 1;
		if(endPage > maxPage) 
			endPage = maxPage;
		if(endPage < page) 
			page = endPage;
		/*????????? ?????? ???*/
		
		List<MarketVO> mVo;
		mVo = marketService.getKindTwoList(svo); // ??????????????? ???????????? ????????? ????????????

		request.setAttribute("kind", kind);
		request.setAttribute("maxPage", maxPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("listCount", listCount);
		request.setAttribute("marketList", mVo);
		request.setAttribute("pageNum", page);
		
		return "/board/market_post_list";
	}
	
	@RequestMapping(value = "/marketDetailList.do", method = RequestMethod.POST)
	public String mintDetailListKind(@RequestParam(required = false) String keyword, HttpServletRequest request, HttpServletResponse response, SearchVO svo) {
		List<MarketCategoryBigVO> marketCategoryBig = marketService.getMarketCategoryBig();
		request.setAttribute("marketCategoryBig", marketCategoryBig);
		
		if(keyword != null) {
			request.setAttribute("keyword", keyword);
			svo.setKeyword("%" + keyword + "%");
		} else {
			request.setAttribute("keyword", "");
			svo.setKeyword("%%");
		} 
		
		request.setAttribute("option", svo.getOption());
		
		String kind = request.getParameter("kind");
		String kindTwo = request.getParameter("kindTwo");
		if(kindTwo == "") {
			kindTwo = null;
		}
		svo.setKind(kind);
		svo.setKindTwo(kindTwo);
		
		/*????????? ?????? ??????*/
		String currentPage = request.getParameter("pageNum");
		int page;

		if(currentPage == null) {
			page = 1; 
		} else {
			page = Integer.parseInt(currentPage);
		}
		
		int limit = 9;   // ??? ????????? ????????? ??? ??????
		svo.setPage(1);
		int listCount = marketService.getKindTwoCount(svo);
		int maxPage = (listCount+limit-1)/limit;
		
		String arrow = request.getParameter("arrow");
		if(arrow != null) {
			if(arrow.equals("prev")) {
				page = (page - 1) / 5 + ((page - 1) / 5) * 4;
				if(page < 1) {
					page = 1;
				}
			} else if(arrow.equals("next")) {
				page = (page + 6) / 6 + (5 * ((page + 6) / 6)) - ((page - 1) / 5);
				if(page > maxPage) {
					page = maxPage;
				}
			}
		}
		
		svo.setPage(page);
		
		List<MarketVO> mVo = marketService.getKindTwoList(svo);
		
		int startPage = ((page-1)/5) * 5 + 1;
		int endPage = startPage + 5 - 1;
		
		if(endPage > maxPage) 
			endPage = maxPage;
		if(endPage < page) 
			page = endPage;
		/*????????? ?????? ???*/

		request.setAttribute("kind", kind);
		request.setAttribute("kindTwo", kindTwo);
		request.setAttribute("maxPage", maxPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("listCount", listCount);
		request.setAttribute("marketList", mVo);
		request.setAttribute("pageNum", page);
		
		return "/board/market_post_list";
	}
	
	@RequestMapping(value = "/marketSell.do", method = RequestMethod.GET)
	public String marketSell(Model model, HttpSession session) {
		if(session.getAttribute("userEmail_id") == null) {
			return "redirect:/login.do";
		} else if(session.getAttribute("nickname") == null) {
			return "redirect:/profile.do";
		}
		List<MarketCategoryBigVO> marketCategoryBig = marketService.getMarketCategoryBig();
		model.addAttribute("marketCategoryBig", marketCategoryBig);
		
		return "/board/market_write";
	}
	
	@RequestMapping(value = "/marketSell.do", method = RequestMethod.POST)
	public String marketUpload(@RequestParam("file") MultipartFile file, HttpServletRequest request, HttpServletResponse response, MarketVO vo, HttpSession session) throws NoSuchAlgorithmException, GeneralSecurityException {
		try {
			AES256Util.setKey(marketService.getKey().getKey());
			AES256Util aes = new AES256Util();
			AwsS3.setAccessKey(aes.decrypt(marketService.getSkey().getAckey()));
			AwsS3.setSecretKey(aes.decrypt(marketService.getSkey().getSekey()));
			AwsS3 awsS3 = AwsS3.getInstance();
			String uploadFolder = "https://mintmarket.s3.ap-northeast-2.amazonaws.com/";
			String key = "market/" + file.getOriginalFilename();
			InputStream is = file.getInputStream();
			String contentType = file.getContentType();
			long contentLength = file.getSize();
			awsS3.upload(is, key, contentType, contentLength);
				vo.setImg_name(file.getOriginalFilename());
				vo.setUrl(uploadFolder + key);
				vo.setCategory_middle(vo.getCategory_middle().replace(",", ""));
				vo.setAddress2(String.valueOf(session.getAttribute("address2")));
				vo.setNickname(String.valueOf(session.getAttribute("nickname")));
			marketService.insertMarket(vo);
		} catch (IOException ex) {
			ex.printStackTrace();
		}

		return "redirect:marketBoardList.do";
	}
	
	@GetMapping("deleteMarket.do")
	public String goDeleteMarket(HttpServletRequest request, int seq) {
		request.setAttribute("seq", seq);
		
		return "/board/market_delete"; 
	}
	
	@PostMapping("deleteMarket.do")
	public String deleteMarket(HttpServletRequest request, HttpServletResponse response, UserVO vo, int seq) throws NoSuchAlgorithmException, GeneralSecurityException, IOException {
		request.setAttribute("seq", seq);
		String password = userService.getPassword(vo.getEmail_id());
			AES256Util.setKey(marketService.getKey().getKey());
			AES256Util aes = new AES256Util();
			String encoding = aes.encrypt(vo.getPassword());
		if(password.equals(encoding)) {
			marketService.deleteMarket(seq);
			return "redirect:marketBoardList.do";
		} else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('??????????????? ???????????????.'); </script>");
			out.flush();
			
			return "/board/market_delete";
		}
	}
	
	@GetMapping("updateMarket.do")
	public String goUpdateMarket(HttpServletRequest request, int seq) {
		MarketVO mVO = marketService.getMarketOne(seq);
		request.setAttribute("market", mVO);
		
		List<MarketCategoryBigVO> marketCategoryBig = marketService.getMarketCategoryBig();
		request.setAttribute("marketCategoryBig", marketCategoryBig);
		
		return "/board/market_post_content_edit";
	}
	
	@PostMapping("updateMarket.do")
	public String updateMarket(@RequestParam("file") MultipartFile file, HttpServletRequest request, MarketVO mVO, HttpSession session) throws NoSuchAlgorithmException, GeneralSecurityException {
		try {
			AES256Util.setKey(marketService.getKey().getKey());
			AES256Util aes = new AES256Util();
			AwsS3.setAccessKey(aes.decrypt(marketService.getSkey().getAckey()));
			AwsS3.setSecretKey(aes.decrypt(marketService.getSkey().getSekey()));
			AwsS3 awsS3 = AwsS3.getInstance();
			String uploadFolder = "https://mintmarket.s3.ap-northeast-2.amazonaws.com/";
			String key = "market/" + file.getOriginalFilename();
			InputStream is = file.getInputStream();
			String contentType = file.getContentType();
			long contentLength = file.getSize();
			awsS3.upload(is, key, contentType, contentLength);
				mVO.setImg_name(file.getOriginalFilename());
				mVO.setUrl(uploadFolder + key);
				mVO.setCategory_middle(mVO.getCategory_middle().replace(",", ""));
				mVO.setAddress2(String.valueOf(session.getAttribute("address2")));
				mVO.setNickname(String.valueOf(session.getAttribute("nickname")));
			marketService.updateMarket(mVO);
		} catch (IOException ex) {
			ex.printStackTrace();
		}
		
		return "redirect:marketBoard.do?seq=" + mVO.getMarket_seq();
	}
	
	@ResponseBody
	@RequestMapping(value = "/marketLike.do", method = RequestMethod.POST)
	public int marketLike(HttpSession session, int seq) throws Exception {
		LikeVO lVO = new LikeVO();
		lVO.setNickname(String.valueOf(session.getAttribute("nickname")));
		lVO.setSeq(seq);
		marketService.insertLike(lVO);		
		
		return 0;
	}
	
	@ResponseBody
	@RequestMapping(value = "/marketHate.do", method = RequestMethod.POST)
	public int marketHate(HttpSession session, int seq) throws Exception {
		LikeVO lVO = new LikeVO();
		lVO.setNickname(String.valueOf(session.getAttribute("nickname")));
		lVO.setSeq(seq);
		marketService.deleteLike(lVO);		
		
		return 0;
	}
	
	@ResponseBody
	@RequestMapping(value = "/follow.do", method = RequestMethod.POST)
	public int following(HttpSession session, String seller) throws Exception {
		FollowingVO fVO = new FollowingVO();
			fVO.setNickname(String.valueOf(session.getAttribute("nickname")));
			fVO.setFollowing(seller);
		followService.insertFollow(fVO);
		
		return 0;
	}
	
	@ResponseBody
	@RequestMapping(value = "/unfollow.do", method = RequestMethod.POST)
	public int unfollow(HttpSession session, String seller) throws Exception {
		FollowingVO fVO = new FollowingVO();
			fVO.setNickname(String.valueOf(session.getAttribute("nickname")));
			fVO.setFollowing(seller);
		followService.deleteFollow(fVO);
		
		return 0;
	}
	
	@PostMapping("/marketFinish.do")
	public String marketSell(int buy_seq, String buyer) {
		MarketBuyerVO mbVO = new MarketBuyerVO();
			mbVO.setBuy_seq(buy_seq);
			mbVO.setBuyer(buyer);
		marketService.sellProduct(mbVO);
		marketService.setRating(buy_seq);
		
		return "redirect:profile.do";
	}
	
	@PostMapping("/rating.do")
	public String rating(HttpSession session, int seq, float star, String content) {
		String writer = String.valueOf(session.getAttribute("nickname"));
		MarketRatingVO mrVO = new MarketRatingVO();
			mrVO.setMarket_seq(seq);
			mrVO.setRating(star);
			mrVO.setWriter(writer);
			mrVO.setContent(content);
		
		marketService.updateRating(mrVO);
		
		/* ?????? ?????? */
		MarketVO tempVO = marketService.getMarketOne(seq);
			String userNickname = tempVO.getNickname();
		
		float origin = userService.getRating(userNickname);
		float compare = mrVO.getRating();
		
		float sum = (origin + compare) / 2;
		
		UserVO tempUser = new UserVO();
			tempUser.setNickname(userNickname);
			tempUser.setRating(sum);
			
		userService.updateRating(tempUser);
		
		return "redirect:profile.do";
	}
}









