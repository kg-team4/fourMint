package four.mint.web.user.market;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MarketVO {

	private int market_seq;
	private String img_name;
	private String category_big;
	private String category_middle;
	private String product_name;
	private String product_price;
	private String product_content;
	private String url;
	private Timestamp date;
	private String address2;
	private String nickname;
	private int views;
}
