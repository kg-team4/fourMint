package four.mint.web.admin.qna;

import java.sql.Timestamp;

import lombok.Data;
@Data
public class AdminQnaVO {
	int ask_seq;
	int store_seq;
	String nickname;
	String content;
	Timestamp date;
	String product_name;
	int status;

}
