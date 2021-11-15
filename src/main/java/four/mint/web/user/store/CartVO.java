package four.mint.web.user.store;

import lombok.Data;

@Data
public class CartVO {

	private int cart_id;
	private String nickname;
	private int store_seq;
	private String product_price;
	private int amount;
	private String url;
	private String product_name;
}
