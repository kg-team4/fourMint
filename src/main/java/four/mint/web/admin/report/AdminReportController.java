package four.mint.web.admin.report;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import four.mint.web.user.UserVO;

@Controller
public class AdminReportController<BoardReportVO> {

	@Autowired
	private AdminReportService adminReportService;

	@RequestMapping(value = "/tables-blacklist.mdo", method = RequestMethod.GET)
	public String report(HttpServletRequest request, HttpSession session) {
		if (session.getAttribute("admin_id") == null) {
			return "redirect:login.mdo";
		}

		List<AdminBlackListVO> adminblacklist = adminReportService.getAdminBlackList();
		request.setAttribute("list", adminblacklist);

		return "/tables-blacklist";
	}

	@RequestMapping(value = "/black_list.mdo", method = RequestMethod.GET)
	public String black_list(HttpServletRequest request, HttpSession session) {
		if (session.getAttribute("admin_id") == null) {
			return "redirect:login.mdo";
		}

		List<AdminBlackListVO> adminblacklist = adminReportService.getAdminBlackList();
		request.setAttribute("list", adminblacklist);

		return "/black_list";
	}

	@RequestMapping(value = "/blacklist_report.mdo", method = RequestMethod.GET)
	public String getblacklist_report(HttpServletRequest request, HttpSession session) {
		if (session.getAttribute("admin_id") == null) {
			return "redirect:login.mdo";
		}

		List<AdminReportVO> adminreportlist = adminReportService.getAdminReportList();
		request.setAttribute("list", adminreportlist);

		return "/report";
	}

	@RequestMapping(value = "/report_list.mdo", method = RequestMethod.GET)
	public String report_list(HttpServletRequest request, HttpSession session) {
		if (session.getAttribute("admin_id") == null) {
			return "redirect:login.mdo";
		}

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

	@GetMapping(value = "excel_blacklist.mdo")
	public void excelDownload(HttpServletResponse response) throws IOException {

		// Workbook wb = new HSSFWorkbook();
		Workbook wb = new XSSFWorkbook();
		Sheet sheet = wb.createSheet("첫번째 시트");
		Row row = null;
		Cell cell = null;
		int rowNum = 0;

		// Header
		String[] header = { "이메일", "이름", "블랙리스트로 넘어온 날짜" };
		row = sheet.createRow(rowNum++);
		for (int i = 0; i < header.length; i++) {
			cell = row.createCell(i);
			cell.setCellValue(header[i]);
		}

		List<AdminBlackListVO> blackList = adminReportService.getAdminBlackList();

		// Body
		for (int i = 0; i < blackList.size(); i++) {
			SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");

			row = sheet.createRow(rowNum++);
			cell = row.createCell(0);
			cell.setCellValue(blackList.get(i).getEmail_id());
			cell = row.createCell(1);
			cell.setCellValue(blackList.get(i).getName());
			cell = row.createCell(2);
			cell.setCellValue(blackList.get(i).getNickname());
			cell = row.createCell(3);
			cell.setCellValue(date.format(blackList.get(i).getDate()));
		}

		// 컨텐츠 타입과 파일명 지정
		response.setContentType("ms-vnd/excel");
		// response.setHeader("Content-Disposition", "attachment;filename=example.xls");
		response.setHeader("Content-Disposition", "attachment;filename=blacklist.xlsx");

		// Excel File Output
		wb.write(response.getOutputStream());
		wb.close();
	}

}
