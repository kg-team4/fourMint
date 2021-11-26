package four.mint.web.user.community;

import java.io.IOException;
import java.io.InputStream;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import four.mint.web.common.AES256Util;
import four.mint.web.common.AwsS3;
import four.mint.web.user.board.common.LikeVO;
import four.mint.web.user.market.MarketService;
import four.mint.web.user.market.MarketVO;

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
	public String communityDetailList(HttpServletRequest request, HttpSession session) {
		KindAddressVO kaVO = new KindAddressVO();
		
			String kind = request.getParameter("kind");
		kaVO.setKind(kind);
		request.setAttribute("kind", kind);
		
			String address = (String) session.getAttribute("address2");
			String[] temp = address.split(" ");
			address = temp[1];
			if(temp[1].substring(address.length()-1).equals("시")) {
				address = temp[2];
			}
			request.setAttribute("addressSub", address);
			
			address = "%" + address.substring(0, 2) + "%";
		kaVO.setAddress(address);
		
		List<CommunityBoardVO> list = communityBoardService.getKindList(kaVO);
		
		request.setAttribute("list", list);
		
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

		return "/board/market_all_post_list";
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
}
























