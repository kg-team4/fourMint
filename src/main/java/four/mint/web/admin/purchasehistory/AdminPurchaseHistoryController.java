package four.mint.web.admin.purchasehistory;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class AdminPurchaseHistoryController {
	
	@Autowired
	private AdminPurchaseHistoryService adminPurchaseHistoryService;
	
	@RequestMapping(value="/tables-purchasehistory.mdo", method=RequestMethod.GET)
	public String purchasehistory(HttpServletRequest request) {
		List<AdminPurchaseHistoryVO> adminpurchasehistorylist= adminPurchaseHistoryService.getAdminPurchaseHistoryList();
		
		request.setAttribute("list", adminpurchasehistorylist);
		return "/tables-purchasehistory";
		
	}

	
	
	
	

}
