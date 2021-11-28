package four.mint.web.admin.table.goods;

import lombok.Data;

@Data
public class AdminGoodsVO {
	private String store_seq;
	private String category_big;
	private String product_name;
	private String product_price;
	private int product_stock;
	private int product_like;
	

}
