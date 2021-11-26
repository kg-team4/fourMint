package four.mint.web.user.store;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class StoreRateVO {

	private int rate_seq;
	private int store_seq;
	private String nickname;
	private float rating;
	private String content;
	private Timestamp date;
	
	private String profile;
}
