package four.mint.web.admin.qna;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class AdminAnswerVO {
	int ask_seq;
	String content;
	Timestamp date;

	}
