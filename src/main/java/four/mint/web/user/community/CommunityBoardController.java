package four.mint.web.user.community;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CommunityBoardController {
	
	@Autowired
	private CommunityBoardService communityBoardService;

	@RequestMapping(value = "/communityBoardList.do", method = RequestMethod.GET)
	public String communityBoardList() {
		
		return "/board/community_all_post_list";
	}
	
	@RequestMapping(value = "/communityBoard.do", method = RequestMethod.GET)
	public String communityBoard() {
		
		return "/board/community_post_content";
	}
	
	@RequestMapping(value = "/communityDetailList.do", method = RequestMethod.GET)
	public String communityDetailList(CommunityBoardVO vo, Model model) {
		List<CommunityBoardVO> boardList = communityBoardService.getCommunityBoardList(vo);
		model.addAttribute("boardList", boardList);
		
		return "/board/community_post_list";
	}
}
