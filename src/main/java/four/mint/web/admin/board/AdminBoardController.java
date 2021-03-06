package four.mint.web.admin.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class AdminBoardController {
	
	@Autowired
	private AdminBoardService adminBoardService;
	

	@RequestMapping(value = "/utilities-board.mdo", method = RequestMethod.GET)
	public String Uilities_board(HttpServletRequest request, HttpSession session) {
		if(session.getAttribute("admin_id") == null) {
			return "redirect:login.mdo";
		}
		
		List<AdminBoardVO> adminboardlist = adminBoardService.getAdminBoardList();
		
		request.setAttribute("list", adminboardlist);
		return "/utilities-board";
	}
	

}
