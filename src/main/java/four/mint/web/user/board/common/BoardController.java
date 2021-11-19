package four.mint.web.user.board.common;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import four.mint.web.user.UserService;

@Controller
public class BoardController {

	@Autowired
	private UserService userService;
	
	@PostMapping("/report.do")
	public String report(HttpServletRequest request, ReportVO rVO) {
		userService.insertReport(rVO);
		userService.updateReport(rVO.getReported());
		
		return "/board/market_all_post_list";
	}
}



