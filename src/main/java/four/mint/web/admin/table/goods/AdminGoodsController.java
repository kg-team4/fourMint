package four.mint.web.admin.table.goods;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminGoodsController {
	
	@Autowired
	private AdminGoodsService adminGoodsService;
	
	@RequestMapping(value="/tables-storegoods.mdo", method=RequestMethod.GET)
	public String storeboard(HttpServletRequest request) {
		List<AdminGoodsVO> admingoodslist = adminGoodsService.getAdminGoodsList();
		
		request.setAttribute("list", admingoodslist);
		
		return "/tables-storegoods";
	}

}
