package four.mint.web.admin.table.used;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import four.mint.web.admin.table.member.AdminTableVO;

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
	
	@GetMapping(value="excel_used.mdo")
	 public String excelDownload(HttpServletResponse response) throws IOException {
	      
         // Workbook wb = new HSSFWorkbook();
          Workbook wb = new XSSFWorkbook();
          Sheet sheet = wb.createSheet("첫번째 시트");
          Row row = null;
          Cell cell = null;
          int rowNum = 0;

          // Header
          String[] header = {"대분류", "중분류", "상품명", "상품가격"};
          row = sheet.createRow(rowNum++);
          for(int i=0; i<header.length; i++) {
             cell = row.createCell(i);
             cell.setCellValue(header[i]);
          }
        
          List<AdminUsedVO> paymentList = adminUsedService.orderList();
          
          // Body
          for (int i=0; i<paymentList.size(); i++) {           
           SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
               
              row = sheet.createRow(rowNum++);
              cell = row.createCell(0);
              cell.setCellValue(paymentList.get(i).getCategory_big());
              cell = row.createCell(1);
              cell.setCellValue(paymentList.get(i).getCategory_middle());
              cell = row.createCell(2);
              cell.setCellValue(paymentList.get(i).getProduct_name());
              cell = row.createCell(3);
              cell.setCellValue(paymentList.get(i).getProduct_price());
             
          }

          // 컨텐츠 타입과 파일명 지정
          response.setContentType("ms-vnd/excel");
         // response.setHeader("Content-Disposition", "attachment;filename=example.xls");
          response.setHeader("Content-Disposition", "attachment;filename=usedproduct.xlsx");

          // Excel File Output
          wb.write(response.getOutputStream());
          wb.close();

		return "redirect:tables-used.mdo";
	}
	
}
