package four.mint.web.user.store;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class TransactionHistoryVO {

	private int transaction_seq;
	private String email_id;
	private String product_name;
	private int product_price;
	private int transaction_price;
	private int transaction_count;
	private Timestamp date;
	private String merchant_uid;
	private String request;
}