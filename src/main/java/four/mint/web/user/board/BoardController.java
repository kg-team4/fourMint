package four.mint.web.user.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BoardController {

	@RequestMapping(value = "/mintBoardList.user", method = RequestMethod.GET)
	public String mintBoardList() {
		
		return "/board/used_all_post_list";
	}
	
	@RequestMapping(value = "/mintBoard.user", method = RequestMethod.GET)
	public String mintBoard() {
		
		return "/board/used_post_content";
	}
	
	@RequestMapping(value = "/mintDetailList.user", method = RequestMethod.GET)
	public String mintDetailList() {
		
		return "/board/used_post_list";
	}

	
}
