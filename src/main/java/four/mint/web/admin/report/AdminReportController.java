package four.mint.web.admin.report;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.codehaus.plexus.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import four.mint.web.admin.login.AdminService;
import four.mint.web.admin.login.AdminVO;
import four.mint.web.user.UserVO;

@Controller
public class AdminReportController<BoardReportVO> {
	
	@Autowired
	private AdminReportService adminReportService;
	
	@RequestMapping(value= "/tables-blacklist.mdo", method = RequestMethod.GET)
	public String report(HttpServletRequest request) {
		List<AdminReportVO> adminreportlist = adminReportService.getAdminReportList();
		
		request.setAttribute("list", adminreportlist);
		return"/tables-blacklist";
	}
	
	@RequestMapping(value = "/blacklist_modify.mdo", method = RequestMethod.GET)
	public void getblacklist_modify(@RequestParam("report_seq")int report_seq,Model model)throws Exception {
		
			
		model.addAttribute("modify",report_seq);
													
	}
		
	
	@RequestMapping(value = "/blacklist_report.mdo", method = RequestMethod.GET)
	public String getblacklist_report(HttpServletRequest request) {
		List<AdminBlackListVO> adminblacklist = adminReportService.getAdminBlackList();
		
		request.setAttribute("list", adminblacklist);
		return "/report";
													
	}
	
	
	@RequestMapping(value = "/blacklist_delete.mdo", method = RequestMethod.GET)
	public void getblacklist_delete(@RequestParam("report_seq") int report_seq,Model model)throws Exception {
		
		model.addAttribute("delete",report_seq);		
	}
	
	@RequestMapping(value ="/blacklist_modify.mdo", method = RequestMethod.POST)
	public String blacklist_modify(@RequestParam("nickname") String nickname, int report_seq) throws Exception{
		UserVO vo = adminReportService.getUserInfo(nickname);

		AdminBlackListVO blackVO = new AdminBlackListVO();
			blackVO.setEmail_id(vo.getEmail_id());
			blackVO.setName(vo.getName());
			blackVO.setNickname(vo.getNickname());
			blackVO.setReport_seq(report_seq);
			
		adminReportService.insertblacklist(blackVO);
			
			
		return "redirect:blacklist_report.mdo";
	}
		
	 @RequestMapping(value = "/blacklist_delete.mdo", method = RequestMethod.POST)
	 public String blacklist_delete(@RequestParam("report_seq") int report_seq) throws Exception { 
		  adminReportService.delete(report_seq);
	  
		 return "/tables-blacklist"; 
	  }
	 
	 @RequestMapping(value = "/report_delete.mdo", method = RequestMethod.POST)
	 public String report_delete(@RequestParam("blacklist_seq") int blacklist_seq) throws Exception { 
		  adminReportService.blacklist_delete(blacklist_seq);
	  
		 return "redirect:blacklist_report.mdo"; 
	  }
	 
		  

}
