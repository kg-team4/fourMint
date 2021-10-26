package four.mint.web.user.community;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CommunityController {

	@RequestMapping(value = "/community.do", method = RequestMethod.GET)
	public String login() {
		
		return "/board/community_all_post_list";
	}
	
	@RequestMapping(value = "/communityContentList.do", method = RequestMethod.GET)
	public String contentList() {
		
		return "/board/community_post_list";
	}
}
