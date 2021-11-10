package four.mint.web.user.market;

import java.io.IOException;
import java.io.InputStream;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import four.mint.web.common.AES256Util;
import four.mint.web.common.AwsS3;
import four.mint.web.common.DateUtil;
import four.mint.web.user.UserService;
import four.mint.web.user.UserVO;
import four.mint.web.user.board.common.PageVO;
import four.mint.web.user.board.common.SearchVO;

@Controller
public class MarketController {

	@Autowired
	private MarketService marketService;

	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/marketBoardList.do", method = RequestMethod.GET)
	public String marketBoardList() {

		return "/board/market_all_post_list";
	}

	@RequestMapping(value = "/marketBoard.do", method = RequestMethod.GET)
    public String mintBoard(HttpServletRequest request, UserVO vo, MarketVO marvo, Model model) {
		marvo = marketService.getMarketOne(Integer.valueOf(request.getParameter("seq")));
		
		model.addAttribute("content", marvo);
		model.addAttribute("date", DateUtil.txtDate(marvo.getDate()));
		
		model.addAttribute("result1", userService.getAddress1(vo));
		model.addAttribute("result2", userService.getAddress2(vo));
		model.addAttribute("result3", userService.getAddress3(vo));

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
		request.setAttribute("page", page);
		request.setAttribute("maxPage", maxPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("listCount", listCount);
		request.setAttribute("marketList", mVo);
		request.setAttribute("pageNum", page);
		
		return "/board/market_post_list";
	}
	
	@RequestMapping(value = "/marketDetailList.do", method = RequestMethod.POST)
	public String mintDetailListUpload(HttpServletRequest request, HttpServletResponse response, SearchVO svo) {
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
		request.setAttribute("page", page);
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
			return "/user/login";
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
			System.out.println("main 업로드 완료");
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
}
