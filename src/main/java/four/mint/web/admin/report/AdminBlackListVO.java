package four.mint.web.admin.report;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class AdminBlackListVO {
	int blacklist_seq;
	String name;
	String email_id;
	String nickname;
	Timestamp date;
	int report_seq;

}
