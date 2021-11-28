package four.mint.web.admin.transactionhistory;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class AdminTransactionHistoryVO {
	int transaction_seq;
	String email_id;
	String product_name;
	String transaction_price;
	String transaction_count;
	Timestamp date;
	String merchant_uid;
	String product_price;
	String request;
	String address2;
	String status;
	String cancel_date;
	String cancel_status;
	String cancel_reason;
	String pay_cancel;
}
