package four.mint.web.user.store;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class StoreVO {

	private int store_seq;
	private String img_name;
	private String category_big;
	private String product_name;
	private String product_price;
	private String product_content;
	private String product_stock;
	private String url;
	private Timestamp date;
}
