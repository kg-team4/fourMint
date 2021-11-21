package four.mint.web.admin.report;

import java.sql.Timestamp;
import lombok.Data;

@Data
public class AdminReportVO {
	int report_seq;
	String reason;
	String content;
	String market_seq;
	String reporter;
	String reported;
	Timestamp date;	
}

