package four.mint.web.admin.table.used;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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

}
