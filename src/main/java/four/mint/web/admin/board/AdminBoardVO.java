package four.mint.web.admin.board;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class AdminBoardVO {
	int market_seq;
	String category_big;
	String product_name;
	String product_price;
	String product_content;
	Timestamp date;
	String nickname;
	String buyer;
	Timestamp sell_date;

}
