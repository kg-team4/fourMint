package four.mint.web.user.community;

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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import four.mint.web.common.AES256Util;
import four.mint.web.common.AwsS3;
import four.mint.web.user.board.common.LikeVO;
import four.mint.web.user.board.common.SearchVO;
import four.mint.web.user.market.MarketService;
import four.mint.web.user.store.StoreVO;

@Controller
public class CommunityBoardController {
	
	@Autowired
	private CommunityBoardService communityBoardService;

	@Autowired
	private MarketService marketService;
	
	/* 커뮤니티 글 작성 페이지로 이동 */
	@RequestMapping(value = "/communityBoardWrite.do", method = RequestMethod.GET)
	public String communityBoardWrite() {
		
		return "/board/community_write";
	}
	
	/* 커뮤니티 전체 목록 */
	@RequestMapping(value = "/communityBoardList.do", method = RequestMethod.GET)
	public String communityBoardList(HttpServletRequest request, HttpSession session) {
		if(session.getAttribute("userEmail_id") == null) {
			return "redirect:/login.do";
		} else if(session.getAttribute("nickname") == null) {
			return "redirect:/profile.do";
		}		
		String address = (String) session.getAttribute("address2");
		String[] temp = address.split(" ");
		address = temp[1];
		if(temp[1].substring(address.length()-1).equals("시")) {
			address = temp[2];
		}
		request.setAttribute("addressSub", address);
		
		address = "%" + address.substring(0, 2) + "%";
		
		/* 일주일 내로 작성된 글 중 조회수 탑5 목록만 출력 */
		List<CommunityBoardVO> topFive = communityBoardService.getTopFive(address);
		request.setAttribute("list", topFive);
		
		return "/board/community_all_post_list";
	}
	
	/* 게시글 입장 */
	@RequestMapping(value = "/communityBoard.do", method = RequestMethod.GET)
	public String communityBoard(HttpServletRequest request, int seq) {
		communityBoardService.updateViews(seq);
		CommunityBoardVO cVO = communityBoardService.getBoard(seq);
		request.setAttribute("content", cVO);
		
		List<CommunityCommentVO> ccVO = communityBoardService.getCommunityComment(cVO.getCommunity_seq());
		request.setAttribute("comment", ccVO);
		
		return "/board/community_post_content";
	}
	
	/* 카테고리별 목록 */
	@RequestMapping(value = "/communityDetailList.do", method = RequestMethod.GET)
	public String communityDetailList(HttpServletRequest request, HttpSession session, SearchVO svo) {
		if(session.getAttribute("userEmail_id") == null) {
			return "redirect:/login.do";
		} else if(session.getAttribute("nickname") == null) {
			return "redirect:/profile.do";
		}
		
		request.setAttribute("keyword", "");
		svo.setKeyword("%%");
		request.setAttribute("option", "title");
		svo.setOption("title");
		
		String kind = request.getParameter("kind");
		svo.setKind(kind);
		request.setAttribute("kind", kind);
		
			String address = (String) session.getAttribute("address2");
			String[] temp = address.split(" ");
			address = temp[1];
			if(temp[1].substring(address.length()-1).equals("시")) {
				address = temp[2];
			}
			request.setAttribute("addressSub", address);
			
			address = "%" + address.substring(0, 2) + "%";
		svo.setAddress(address);
		
		/* 페이징 처리 */
		int page = 1;
		int limit = 9;

		svo.setKind(kind);
		svo.setPage(page);

		int listCount = communityBoardService.getKindCount(svo);
		svo.setRnum(listCount);
		int maxPage = (listCount + limit - 1) / limit;
		int startPage = ((page - 1) / 5) * 5 + 1;
		int endPage = startPage + 5 - 1;
		if (endPage > maxPage)
			endPage = maxPage;
		if (endPage < page)
			page = endPage;
		/* 페이징 처리 끝 */
		
		List<CommunityBoardVO> list = communityBoardService.getKindList(svo);
		
		request.setAttribute("kind", kind);
		request.setAttribute("maxPage", maxPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("listCount", listCount);
		request.setAttribute("pageNum", page);
		request.setAttribute("list", list);
		
		return "/board/community_post_list";
	}
	
	@RequestMapping(value = "/communityDetailList.do", method = RequestMethod.POST)
	public String communityDetailLists(@RequestParam(required = false) String keyword, HttpServletRequest request, HttpSession session, SearchVO svo) {
		if(keyword != null) {
			request.setAttribute("keyword", keyword);
			svo.setKeyword("%" + keyword + "%");
		} else {
			request.setAttribute("keyword", "");
			svo.setKeyword("%%");
		}
		request.setAttribute("option", svo.getOption());
		
		String kind = request.getParameter("kind");
		String arrow = request.getParameter("arrow");
		
		/* 페이징 처리 시작 */
		String currentPage = request.getParameter("pageNum");
		int page;

		if (currentPage == null) {
			page = 1;
		} else {
			page = Integer.parseInt(currentPage);
		}

		if (arrow != null) {
			if (arrow.equals("prev")) {
				page = (page - 1) / 5 + ((page - 1) / 5) * 4;
				if (page < 1) {
					page = 1;
				}
			} else if (arrow.equals("next")) {
				page = (page + 6) / 6 + (5 * ((page + 6) / 6)) - ((page - 1) / 5);
			}
		}

		svo.setKind(kind);

		if (page > Math.round((double) communityBoardService.getKindCount(svo) / 9)) {
			page = (int) Math.round((double) communityBoardService.getKindCount(svo) / 9) + 1;
		}

		request.setAttribute("pageNum", page);

		int limit = 9;

		svo.setPage(page);
		int listCount = communityBoardService.getKindCount(svo);
		svo.setRnum(listCount);
		int maxPage = (listCount + limit - 1) / limit;
		int startPage = ((page - 1) / 5) * 5 + 1;
		int endPage = startPage + 5 - 1;
		if (endPage > maxPage)
			endPage = maxPage;
		if (endPage < page)
			page = endPage;
		/* 페이징 처리 끝 */

		List<CommunityBoardVO> sVo;
		sVo = communityBoardService.getKindList(svo); // 카테고리에 해당하는 부분만 불러오기

		request.setAttribute("kind", kind);
		request.setAttribute("maxPage", maxPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("listCount", listCount);
		request.setAttribute("list", sVo);
		
		return "/board/community_post_list";
	}
	
	/* 커뮤니티 글 작성 프로세스 */
	@RequestMapping(value = "/communityWrite.do", method = RequestMethod.POST)
	public String communityWrite(@RequestParam("file") MultipartFile file, HttpServletRequest request, HttpServletResponse response, HttpSession session, CommunityBoardVO cVO) throws NoSuchAlgorithmException, GeneralSecurityException {
		try {
			AES256Util.setKey(marketService.getKey().getKey());
			AES256Util aes = new AES256Util();
			AwsS3.setAccessKey(aes.decrypt(marketService.getSkey().getAckey()));
			AwsS3.setSecretKey(aes.decrypt(marketService.getSkey().getSekey()));
			AwsS3 awsS3 = AwsS3.getInstance();
			String uploadFolder = "https://mintmarket.s3.ap-northeast-2.amazonaws.com/";
			String key = "community/" + file.getOriginalFilename();
			InputStream is = file.getInputStream();
			String contentType = file.getContentType();
			long contentLength = file.getSize();
			awsS3.upload(is, key, contentType, contentLength);
				cVO.setNickname(String.valueOf(session.getAttribute("nickname")));
				cVO.setAddress2(String.valueOf(session.getAttribute("address2")));
				cVO.setUrl(uploadFolder + key);
			communityBoardService.insertCommunity(cVO);
		} catch (IOException ex) {
			ex.printStackTrace();
		}

		return "redirect:communityBoardList.do";
	}
	
	/* 댓글 작성 */
	@PostMapping("communityComment.do")
	public String communityComment(HttpServletRequest request, CommunityCommentVO cVO) {
		communityBoardService.insertComment(cVO);
		communityBoardService.updateComments(cVO.getBoard_seq());
		
		return "redirect:communityBoard.do?seq="+cVO.getBoard_seq();
	}
	
	/* 좋아요 적용 */
	@ResponseBody
	@RequestMapping(value = "/communityLikes.do", method = RequestMethod.POST)
	public int marketHate(HttpSession session, int seq) throws Exception {
		LikeVO lVO = new LikeVO();
			lVO.setSeq(seq);
			lVO.setNickname(String.valueOf(session.getAttribute("nickname")));
		LikeVO tempVO = communityBoardService.checkLike(lVO);
		
		if(tempVO == null) {
			communityBoardService.insertLike(seq);
			communityBoardService.insertCommunityLike(lVO);
			return 1;
		} else {
			communityBoardService.deleteLike(seq);
			communityBoardService.deleteCommunityLike(lVO);
			return 0;
		}
	}
	
	@GetMapping("/communityEdit.do")
	public String updateCommunity(HttpServletRequest request, int seq) {
		CommunityBoardVO cVO = communityBoardService.getBoard(seq);
		request.setAttribute("community", cVO);
		
		return "/board/community_post_content_edit";
	}
	
	@PostMapping("/communityEdit.do")
	public String updateCommunity(@RequestParam(required=false) MultipartFile file, HttpSession session, HttpServletRequest request, CommunityBoardVO cVO) throws NoSuchAlgorithmException, GeneralSecurityException {
		try {
			AES256Util.setKey(marketService.getKey().getKey());
			AES256Util aes = new AES256Util();
			AwsS3.setAccessKey(aes.decrypt(marketService.getSkey().getAckey()));
			AwsS3.setSecretKey(aes.decrypt(marketService.getSkey().getSekey()));
			AwsS3 awsS3 = AwsS3.getInstance();
			String uploadFolder = "https://mintmarket.s3.ap-northeast-2.amazonaws.com/";
			String key = "community/" + file.getOriginalFilename();
			InputStream is = file.getInputStream();
			String contentType = file.getContentType();
			long contentLength = file.getSize();
			awsS3.upload(is, key, contentType, contentLength);
				cVO.setNickname(String.valueOf(session.getAttribute("nickname")));
				cVO.setAddress2(String.valueOf(session.getAttribute("address2")));
				cVO.setUrl(uploadFolder + key);
			communityBoardService.updateCommunity(cVO);
		} catch (IOException ex) {
			ex.printStackTrace();
		}
		
		return "redirect:communityBoard.do?seq="+cVO.getCommunity_seq();
	}
	
	@ResponseBody
	@PostMapping("/deleteCommunity.do")
	public int deleteCommunity(HttpServletRequest request, int seq) {
		communityBoardService.deleteCommunity(seq);
		
		return 0;
	}
	
	@ResponseBody
	@PostMapping("/deleteCommunityComment.do")
	public int deleteCommunityComment(int seq) {
		communityBoardService.deleteCommunityComment(seq);
		
		return 0;
	}
}
























