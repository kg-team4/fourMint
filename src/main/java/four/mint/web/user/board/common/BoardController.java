package four.mint.web.user.board.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BoardController {

	@RequestMapping(value = "/sell.do", method = RequestMethod.GET)
	public String sell() {
		
		return "/board/market_write";
	}
}
