package four.mint.web.admin.table.used;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AdminUsedController {
	
	@Autowired
	private AdminUsedService adminUsedService;
	
	@RequestMapping(value="/tables-used.mdo",method= RequestMethod.GET)
	public String marketboard(HttpServletRequest request) {
		List<AdminUsedVO> adminusedlist = adminUsedService.getAdminUsedList();
		
		request.setAttribute("list", adminusedlist);
		return "/tables-used";
	}
	
	@RequestMapping(value = "/used_delete.mdo", method = RequestMethod.POST)
	public String used_delete(int market_seq) throws Exception {
		adminUsedService.delete(market_seq);

		return "redirect:tables-used.mdo";
	}
	
}
