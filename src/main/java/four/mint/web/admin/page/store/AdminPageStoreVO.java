package four.mint.web.admin.page.store;

import java.sql.Timestamp;
import java.util.List;

import lombok.Data;

@Data
public class AdminPageStoreVO {
	int store_seq;
	String url;
	String category_big;
	String product_name;
	int product_price;
	String product_content;
	Timestamp date;
	int product_like;
	int product_stock;
}
