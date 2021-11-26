package four.mint.web.user.market;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MarketRatingVO {
	
//	DB
	private int market_seq;
	private float rating;
	private String writer;
	private Timestamp date;
	private String content;
	
//	JOIN
	private String product_name;
	private String profile;
}
