package four.mint.web.user.store;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class StoreAskVO {

	private int ask_seq;
	private int store_seq;
	private String nickname;
	private String content;
	private Timestamp date;
	private int status;
	private String product_name;
	private String answer;
	private Timestamp answer_date;
	
	private String profile;
	
}
