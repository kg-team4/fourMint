package four.mint.web.user.market;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MarketController {

	@RequestMapping(value = "/marketBoardList.do", method = RequestMethod.GET)
	public String storeBoardList() {
		
		return "/board/market_all_post_list";
	}
}
