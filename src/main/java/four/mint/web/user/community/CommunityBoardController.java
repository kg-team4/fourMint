package four.mint.web.user.community;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import four.mint.web.user.board.common.PageVO;

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
	public String communityDetailList(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null)
			pageNum = "1";
		int pageSize = 5;
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int count = communityBoardService.getBoardCount();
		int number = 0;
		List<CommunityBoardVO> articleList = null;
		PageVO vo = new PageVO();
		if(count > 0) { 
			vo.setStartRow(startRow);
			vo.setEndRow(endRow);
			articleList = communityBoardService.getCommunityBoardList(request, vo);
		}
		else
			articleList = Collections.emptyList();
		number = count - (currentPage - 1) * pageSize;
		request.setAttribute("currentPage", Integer.valueOf(currentPage));
		request.setAttribute("startRow", Integer.valueOf(startRow));
		request.setAttribute("endRow", Integer.valueOf(endRow));
		request.setAttribute("count",  Integer.valueOf(count));
		request.setAttribute("pageSize", Integer.valueOf(pageSize));
		request.setAttribute("number", Integer.valueOf(number));
		request.setAttribute("articleList", articleList);
		
		model.addAttribute("articleList", articleList);
		
		return "/board/community_post_list";
	}
}
