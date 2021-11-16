package four.mint.web.admin.table.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class AdminTableController {
	
	@Autowired
	private AdminTableService adminTableService;
	
	@RequestMapping(value="/tables-member.mdo",method= RequestMethod.GET)
	public String tablemember(HttpServletRequest request){
		List<AdminTableVO> admintablelist =adminTableService.getAdminTableList();
		
		request.setAttribute("list", admintablelist);		
		return "/tables-member";
		
	}

}