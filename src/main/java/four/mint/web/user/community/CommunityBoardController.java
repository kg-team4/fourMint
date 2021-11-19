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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import four.mint.web.common.AES256Util;
import four.mint.web.common.AwsS3;
import four.mint.web.user.market.MarketService;

@Controller
public class CommunityBoardController {
	
	@Autowired
	private CommunityBoardService communityBoardService;

	@Autowired
	private MarketService marketService;
	
	@RequestMapping(value = "/communityBoardWrite.do", method = RequestMethod.GET)
	public String communityBoardWrite() {
		
		return "/board/community_write";
	}
	
	@RequestMapping(value = "/communityBoardList.do", method = RequestMethod.GET)
	public String communityBoardList() {
		
		return "/board/community_all_post_list";
	}
	
	@RequestMapping(value = "/communityBoard.do", method = RequestMethod.GET)
	public String communityBoard(HttpServletRequest request, int seq) {
		communityBoardService.updateViews(seq);
		CommunityBoardVO cVO = communityBoardService.getBoard(seq);
		request.setAttribute("content", cVO);
		
		List<CommunityCommentVO> ccVO = communityBoardService.getCommunityComment(cVO.getCommunity_seq());
		request.setAttribute("comment", ccVO);
		
		return "/board/community_post_content";
	}
	
	@RequestMapping(value = "/communityDetailList.do", method = RequestMethod.GET)
	public String communityDetailList(HttpServletRequest request, HttpServletResponse response) {
		String kind = request.getParameter("kind");
		request.setAttribute("kind", kind);
		
		List<CommunityBoardVO> list = communityBoardService.getKindList(kind);
		
		request.setAttribute("list", list);
		
		return "/board/community_post_list";
	}
	
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
	
	@PostMapping("communityComment.do")
	public String communityComment(HttpServletRequest request, CommunityCommentVO cVO) {
		communityBoardService.insertComment(cVO);
		communityBoardService.updateComments(cVO.getBoard_seq());
		
		return "redirect:communityBoard.do?seq="+cVO.getBoard_seq();
	}
	
}
























