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

	@RequestMapping(value = "/tables-blacklist.mdo", method = RequestMethod.GET)
	public String report(HttpServletRequest request) {
		List<AdminBlackListVO> adminblacklist = adminReportService.getAdminBlackList();

		request.setAttribute("list", adminblacklist);
		return "/tables-blacklist";
	}

	@RequestMapping(value = "/black_list.mdo", method = RequestMethod.GET)
	public String black_list(HttpServletRequest request) {
		List<AdminBlackListVO> adminblacklist = adminReportService.getAdminBlackList();
		
		request.setAttribute("list", adminblacklist);
		return "/black_list";
	}

	@RequestMapping(value = "/blacklist_report.mdo", method = RequestMethod.GET)
	public String getblacklist_report(HttpServletRequest request) {
		List<AdminReportVO> adminreportlist = adminReportService.getAdminReportList();

		request.setAttribute("list", adminreportlist);
		return "/report";
	}
	
	@RequestMapping(value = "/report_list.mdo", method = RequestMethod.GET)
	public String report_list(HttpServletRequest request) {
		List<AdminReportVO> adminreportlist = adminReportService.getAdminReportList();

		request.setAttribute("list", adminreportlist);
		
		return "/report_list";
	}

	@RequestMapping(value = "/blacklist_modify.mdo", method = RequestMethod.POST)
	public String blacklist_modify(@RequestParam("nickname") String nickname, int report_seq) throws Exception {
		UserVO vo = adminReportService.getUserInfo(nickname);

		AdminBlackListVO blackVO = new AdminBlackListVO();
		blackVO.setEmail_id(vo.getEmail_id());
		blackVO.setName(vo.getName());
		blackVO.setNickname(vo.getNickname());
		blackVO.setReport_seq(report_seq);

		adminReportService.insertblacklist(blackVO);

		return "redirect:black_list.mdo";
	}

	@RequestMapping(value = "/blacklist_delete.mdo", method = RequestMethod.POST)
	public String blacklist_delete(@RequestParam("report_seq") int report_seq) throws Exception {
		adminReportService.delete(report_seq);

		return "/black_list";
	}

	@RequestMapping(value = "/report_delete.mdo", method = RequestMethod.POST)
	public String report_delete(@RequestParam("blacklist_seq") int blacklist_seq) throws Exception {
		adminReportService.blacklist_delete(blacklist_seq);

		return "redirect:report_list.mdo";
	}

}
