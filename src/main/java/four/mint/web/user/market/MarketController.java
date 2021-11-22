package four.mint.web.user.market;

import java.io.IOException;
import java.io.InputStream;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
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
import org.springframework.web.multipart.MultipartFile;

import four.mint.web.admin.banner.market.AdminBannerMarketService;
import four.mint.web.common.AES256Util;
import four.mint.web.common.AwsS3;
import four.mint.web.common.DateUtil;
import four.mint.web.user.FollowCountVO;
import four.mint.web.user.FollowService;
import four.mint.web.user.UserService;
import four.mint.web.user.UserVO;
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
	public String marketBoardList(Model model) {

		String market_image1 = adminBannerMarketService.getBanner(1);
		String market_image2 = adminBannerMarketService.getBanner(2);
		String market_image3 = adminBannerMarketService.getBanner(3);
		String market_image4 = adminBannerMarketService.getBanner(4);
		
		model.addAttribute("market_banner1", market_image1);
		model.addAttribute("market_banner2", market_image2);
		model.addAttribute("market_banner3", market_image3);
		model.addAttribute("market_banner4", market_image4);
		
		return "/board/market_all_post_list";
	}

	@RequestMapping(value = "/marketBoard.do", method = RequestMethod.GET)
    public String mintBoard(HttpServletRequest request, UserVO user, MarketVO marVO, FollowCountVO fVO) {
		/* 조회수 증가 */
		marketService.updateViews(Integer.valueOf(request.getParameter("seq")));
		
		/* 게시글 정보 및 시간 정보 출력 */
		marVO = marketService.getMarketOne(Integer.valueOf(request.getParameter("seq")));
		request.setAttribute("content", marVO);
		request.setAttribute("date", DateUtil.txtDate(marVO.getDate()));
		
		/* 접속자 정보 확인 */
		user = userService.getUserFromNickname(marVO.getNickname());
		request.setAttribute("user", user);
		
		/* 팔로우 정보 확인 */
		fVO = followService.getFollowCount(user.getNickname());
		request.setAttribute("follow", fVO);
		
		/* 게시글 개수 확인 */
		int boardCount = marketService.getUserBoardCount(user.getNickname());
		request.setAttribute("boardCount", boardCount);
		
		/* 모달에 띄울 게시글 목록 */
		List<MarketVO> marketList = marketService.getMarketNickname(user.getNickname());
		request.setAttribute("market", marketList);
		
		/* 모달에 등록한 커뮤니티 게시글 리스트 */
		List<CommunityBoardVO> communityList = communityBoardService.getCommunityListMe(user.getNickname());
		request.setAttribute("community", communityList);
		
		return "/board/market_post_content";
	}

	@RequestMapping(value = "/marketDetailList.do", method = RequestMethod.GET)
	public String mintDetailList(HttpServletRequest request, HttpServletResponse response, SearchVO svo) {
		List<MarketCategoryBigVO> marketCategoryBig = marketService.getMarketCategoryBig();
		request.setAttribute("marketCategoryBig", marketCategoryBig);
		
		String kind = request.getParameter("kind");
		
		/*페이징 처리 시작*/
		int page = 1;
		int limit = 9;     
		
		svo.setKind(kind);
		svo.setPage(page);
		
		int listCount = marketService.getKindCount(svo);
		svo.setRnum(listCount);
		int maxPage = (listCount+limit-1)/limit;
		int startPage = ((page-1)/5) * 5 + 1;
		int endPage = startPage + 5 - 1;
		if(endPage > maxPage) 
			endPage = maxPage;
		if(endPage < page) 
			page = endPage;
		/*페이징 처리 끝*/
		
		List<MarketVO> mVo;
		mVo = marketService.getKindList(svo); // 카테고리에 해당하는 부분만 불러오기

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
	public String mintDetailListKind(HttpServletRequest request, HttpServletResponse response, SearchVO svo) {
		List<MarketCategoryBigVO> marketCategoryBig = marketService.getMarketCategoryBig();
		request.setAttribute("marketCategoryBig", marketCategoryBig);
		
		String kind = request.getParameter("kind");
		String kindTwo = request.getParameter("kindTwo");
		String arrow = request.getParameter("arrow");
		
		/*페이징 처리 시작*/
		String currentPage = request.getParameter("pageNum");
		int page;

		if(currentPage == null) {
			page = 1; 
		} else {
			page = Integer.parseInt(currentPage);
		}
		
		if(arrow != null) {
			if(arrow.equals("prev")) {
				page = (page - 1) / 5 + ((page - 1) / 5) * 4;
				if(page < 1) {
					page = 1;
				}
			} else if(arrow.equals("next")) {
				page = (page + 6) / 6 + (5 * ((page + 6) / 6)) - ((page - 1) / 5);
			}
		}
		
		svo.setKind(kind);
		svo.setKindTwo(kindTwo);

		if(page > Math.round((double)marketService.getKindTwoCount(svo) / 9)) {
			page = (int)Math.round((double)marketService.getKindTwoCount(svo) / 9) + 1;
		}

		request.setAttribute("pageNum", page);
		
		int limit = 9;   
		
		svo.setPage(page);
		
		int listCount = marketService.getKindTwoCount(svo);
		svo.setRnum(listCount);
		int maxPage = (listCount+limit-1)/limit;
		int startPage = ((page-1)/5) * 5 + 1;
		int endPage = startPage + 5 - 1;
		
		if(endPage > maxPage) 
			endPage = maxPage;
		if(endPage < page) 
			page = endPage;
		/*페이징 처리 끝*/
		
		List<MarketVO> mVo;
		if(kindTwo == null) {
			mVo = marketService.getKindList(svo); // 카테고리에 해당하는 부분만 불러오기
		} else {
			mVo = marketService.getKindTwoList(svo);
		}

		request.setAttribute("kind", kind);
		request.setAttribute("kindTwo", kindTwo);
		request.setAttribute("maxPage", maxPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("listCount", listCount);
		request.setAttribute("marketList", mVo);
		
		return "/board/market_post_list";
	}
	
	@RequestMapping(value = "/marketSell.do", method = RequestMethod.GET)
	public String marketSell(Model model, HttpSession session) {
		if(session.getAttribute("userEmail_id") == null) {
			return "redirect:/login.do";
		}else if(session.getAttribute("sns") != null) {
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

		return "/board/market_all_post_list";
	}
	
	@GetMapping("deleteMarket.do")
	public String goDeleteMarket(HttpServletRequest request, int seq) {
		request.setAttribute("seq", seq);
		
		return "/board/market_delete"; 
	}
	
	@PostMapping("deleteMarket.do")
	public String deleteMarket(HttpServletRequest request, UserVO vo, int seq) {
		request.setAttribute("seq", seq);
		String password = userService.getPassword(vo.getEmail_id());
		if(password.equals(vo.getPassword())) {
			marketService.deleteMarket(seq);

			return "/board/market_all_post_list";
		} else {
			return "/board/market_delete";
		}
	}
	
	@GetMapping("updateMarket.do")
	public String goUpdateMarket(HttpServletRequest request, int seq) {
		request.setAttribute("seq", seq);
		
		return "/board/market_post_content_edit";
	}
}
