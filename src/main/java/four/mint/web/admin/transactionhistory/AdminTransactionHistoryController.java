package four.mint.web.admin.transactionhistory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONArray;

@Controller
public class AdminTransactionHistoryController {

	@Autowired
	private AdminTransactionHistoryService adminTransactionHistoryService;

//	@ResponseBody
//	@PostMapping("getCharts.mdo")
//	public JSONArray getNewChart(@RequestBody AdminTransactionHistoryVO vo){
//		return JSONArray.fromObject(adminTransactionHistoryService.getAdminTransactionHistoryDateList(vo));
//	}
}
