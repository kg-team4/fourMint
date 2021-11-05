package four.mint.web.user.store;

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
import four.mint.web.user.market.MarketVO;

@Controller
public class StoreController {
	
	@Autowired
	private StoreService storeService;

	@RequestMapping(value = "/storeBoardList.do", method = RequestMethod.GET)
	public String storeBoardList() {
		
		return "/board/store_all_post_list";
	}
	
	@RequestMapping(value = "/storeBoard.do", method = RequestMethod.GET)
	public String storeBoard() {
		
		return "/board/store_post_content";
	}
	
	@RequestMapping(value = "/storeDetailList.do", method = RequestMethod.GET)
	public String storeList(HttpServletRequest request, HttpServletResponse response, Model model) {
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null)
			pageNum = "1";
		int pageSize = 5;
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int count = storeService.getStoreCount();
		int number = 0;
		List<StoreVO> storeList = null;
		PageVO vo = new PageVO();
		if(count > 0) { 
			vo.setStartRow(startRow);
			vo.setEndRow(endRow);
			storeList = storeService.getStoreList(request, vo);
		}
		else
			storeList = Collections.emptyList();
		number = count - (currentPage - 1) * pageSize;
		request.setAttribute("currentPage", Integer.valueOf(currentPage));
		request.setAttribute("startRow", Integer.valueOf(startRow));
		request.setAttribute("endRow", Integer.valueOf(endRow));
		request.setAttribute("count",  Integer.valueOf(count));
		request.setAttribute("pageSize", Integer.valueOf(pageSize));
		request.setAttribute("number", Integer.valueOf(number));
		request.setAttribute("storeList", storeList);
		
		model.addAttribute("storeList", storeList);
		
		return "/board/store_post_list";
	}
	

	@RequestMapping(value = "/pay/order.jsp", method = RequestMethod.GET)
	public String payment() {
		
		return "/pay/payment";
	}
	

	@RequestMapping(value = "/pay/payment.jsp", method = RequestMethod.GET)
	public String order() {
		
		return "/pay/order";
	}
}
