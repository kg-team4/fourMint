package four.mint.web.admin.qna;

import java.sql.Timestamp;

import lombok.Data;
@Data
public class AdminQnaVO {
	private int ask_seq;
	private int store_seq;
	private String nickname;
	private String content;
	private Timestamp date;
	private String product_name;
	private int status;
	private String answer;
	private Timestamp answer_date;
}
