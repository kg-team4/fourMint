package four.mint.web.admin.table.goods;

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

import four.mint.web.admin.report.AdminBlackListVO;

@Controller
public class AdminGoodsController {
	
	@Autowired
	private AdminGoodsService adminGoodsService;
	
	@RequestMapping(value="/tables-storegoods.mdo", method=RequestMethod.GET)
	public String storeboard(HttpServletRequest request) {
		List<AdminGoodsVO> admingoodslist = adminGoodsService.getAdminGoodsList();
		
		request.setAttribute("list", admingoodslist);
		
		return "/tables-storegoods";
	}
	
	 @GetMapping(value="excel_storeGoods.mdo")
	 public void excelDownload(HttpServletResponse response) throws IOException {
	      
        // Workbook wb = new HSSFWorkbook();
         Workbook wb = new XSSFWorkbook();
         Sheet sheet = wb.createSheet("첫번째 시트");
         Row row = null;
         Cell cell = null;
         int rowNum = 0;

         // Header
         String[] header = {"상품이름", "상품가격", "카테고리", "찜 개수", "상품 개수", "등록날짜"};
         
         row = sheet.createRow(rowNum++);
         for(int i=0; i<header.length; i++) {
            cell = row.createCell(i);
            cell.setCellValue(header[i]);
         }
       
         List<AdminGoodsVO> goods = adminGoodsService.getAdminGoodsList();
         
      
         // Body
         for (int i=0; i<goods.size(); i++) {           
          SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
              
             row = sheet.createRow(rowNum++);
             cell = row.createCell(0);
             cell.setCellValue(goods.get(i).getProduct_name());
             cell = row.createCell(1);
             cell.setCellValue(goods.get(i).getProduct_price());
             cell = row.createCell(2);
             cell.setCellValue(goods.get(i).getCategory_big());
             cell = row.createCell(3);
             cell.setCellValue(goods.get(i).getProduct_like());
             cell = row.createCell(4);
             cell.setCellValue(goods.get(i).getProduct_stock());
             cell = row.createCell(5);
//             cell.setCellValue(date.format(goods.get(i).getDate()));
             
             
           
             
            
         }

         // 컨텐츠 타입과 파일명 지정
         response.setContentType("ms-vnd/excel");
        // response.setHeader("Content-Disposition", "attachment;filename=example.xls");
         response.setHeader("Content-Disposition", "attachment;filename=goods.xlsx");

         // Excel File Output
         wb.write(response.getOutputStream());
         wb.close();
     }

}
