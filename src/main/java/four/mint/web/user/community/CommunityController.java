package four.mint.web.user.community;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CommunityController {

	@RequestMapping(value = "/communityBoardList.do", method = RequestMethod.GET)
	public String communityBoardList() {
		
		return "/board/community_all_post_list";
	}
	
	@RequestMapping(value = "/communityBoard.do", method = RequestMethod.GET)
	public String communityBoard() {
		
		return "/board/community_post_content";
	}
	
	@RequestMapping(value = "/communityDetailList.do", method = RequestMethod.GET)
	public String communityDetailList() {
		
		return "/board/community_post_list";
	}
}