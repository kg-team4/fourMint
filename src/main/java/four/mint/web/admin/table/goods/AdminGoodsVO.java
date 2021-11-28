package four.mint.web.admin.table.goods;

import java.sql.Timestamp;
import java.util.TimeZone;

import lombok.Data;

@Data
public class AdminGoodsVO {
	String store_seq;
	String category_big;
	String product_name;
	String product_price;
	Timestamp date;
	int product_stock;
	int product_like;
	
	
	
	
	

}
