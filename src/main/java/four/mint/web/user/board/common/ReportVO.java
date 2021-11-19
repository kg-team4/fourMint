package four.mint.web.user.board.common;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ReportVO {

	private int report_seq;
	private String reason;
	private String content;
	private int market_seq;
	private String reporter;
	private String reported;
	private Timestamp date;
}
