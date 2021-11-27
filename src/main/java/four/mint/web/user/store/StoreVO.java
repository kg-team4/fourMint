package four.mint.web.user.store;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class StoreVO {
	private int store_seq;
	private String img_name;
	private String category_big;
	private String product_name;
	private int product_price;
	private String product_content;
	private int product_stock;
	private String url;
	private Timestamp date;
	private int transaction_seq;
	private String email_id;
	private int transaction_price;
	private int transaction_count;
	private String merchant_uid;
	private String request;
	private String address2;
	private String status;
	private Timestamp cancel_date;
	private String cancel_status;
}
