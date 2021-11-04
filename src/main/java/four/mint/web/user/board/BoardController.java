package four.mint.web.user.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import four.mint.web.user.UserService;
import four.mint.web.user.UserVO;

@Controller
public class BoardController {
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/mintBoardList.do", method = RequestMethod.GET)
	public String mintBoardList() {
		return "/board/used_all_post_list";
	}

	@RequestMapping(value = "/mintBoard.do", method = RequestMethod.GET)
	public String mintBoard(UserVO vo, Model model) {
		
		model.addAttribute("result1", userService.getAddress1(vo));
		model.addAttribute("result2", userService.getAddress2(vo));
		model.addAttribute("result3", userService.getAddress3(vo));
		
		return "/board/used_post_content";
	}

	@RequestMapping(value = "/mintDetailList.do", method = RequestMethod.GET)
	public String mintDetailList() {

		return "/board/used_post_list";
	}

	@RequestMapping(value = "/sell.do", method = RequestMethod.GET)
	public String sell() {
		
		return "/board/market_write";
	}
}
