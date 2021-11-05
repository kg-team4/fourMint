package four.mint.web.user.store;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class StoreController {

	@RequestMapping(value = "/storeBoardList.do", method = RequestMethod.GET)
	public String storeBoardList() {
		
		return "/board/store_all_post_list";
	}
	
	@RequestMapping(value = "/storeBoard.do", method = RequestMethod.GET)
	public String storeBoard() {
		
		return "/board/store_post_content";
	}
	
	@RequestMapping(value = "/storeDetailList.do", method = RequestMethod.GET)
	public String storeList() {
		
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
