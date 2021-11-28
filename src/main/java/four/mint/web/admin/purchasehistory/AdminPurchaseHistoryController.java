package four.mint.web.admin.purchasehistory;

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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import four.mint.web.admin.table.used.AdminUsedVO;


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
	@GetMapping(value="excel_purchasehistory.mdo")
	 public void excelDownload(HttpServletResponse response) throws IOException {
	      
        // Workbook wb = new HSSFWorkbook();
         Workbook wb = new XSSFWorkbook();
         Sheet sheet = wb.createSheet("첫번째 시트");
         Row row = null;
         Cell cell = null;
         int rowNum = 0;

         // Header
         String[] header = {"이메일", "상품명", "거래가격", "상품수량", "날짜", "주문번호", "상품가격", "거래"};
         row = sheet.createRow(rowNum++);
         for(int i=0; i<header.length; i++) {
            cell = row.createCell(i);
            cell.setCellValue(header[i]);
         }
       
         List<AdminPurchaseHistoryVO> paymentList = adminPurchaseHistoryService.getAdminPurchaseHistoryList();
         
         System.out.println(paymentList);
         // Body
         for (int i=0; i<paymentList.size(); i++) {           
          SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
              
             row = sheet.createRow(rowNum++);
             cell = row.createCell(0);
             cell.setCellValue(paymentList.get(i).getEmail_id());
             cell = row.createCell(1);
             cell.setCellValue(paymentList.get(i).getProduct_name());
             cell = row.createCell(2);
             cell.setCellValue(paymentList.get(i).getTransaction_price());
             cell = row.createCell(3);
             cell.setCellValue(paymentList.get(i).getTransaction_count());
             cell = row.createCell(4);
             cell.setCellValue(date.format(paymentList.get(i).getDate()));
             cell = row.createCell(5);
             cell.setCellValue(paymentList.get(i).getMerchant_uid());
             cell = row.createCell(6);
             cell.setCellValue(paymentList.get(i).getProduct_price());
             cell = row.createCell(7);
             cell.setCellValue(paymentList.get(i).getRequest());
             
            
         }

         // 컨텐츠 타입과 파일명 지정
         response.setContentType("ms-vnd/excel");
        // response.setHeader("Content-Disposition", "attachment;filename=example.xls");
         response.setHeader("Content-Disposition", "attachment;filename=purchasehistory.xlsx");

         // Excel File Output
         wb.write(response.getOutputStream());
         wb.close();
     }

	
	
	
	

}
