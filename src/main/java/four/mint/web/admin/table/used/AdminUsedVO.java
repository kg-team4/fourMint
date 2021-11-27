package four.mint.web.admin.table.used;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class AdminUsedVO {
	String market_seq;
	String category_big;
	String category_middle;
	String product_name;
	String product_price;
	String product_content;
	String url;
	Timestamp date;
	String address2;
	String nickname;
	int view;
	int status;
	String buyer;
	Timestamp sell_date;
}
