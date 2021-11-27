package four.mint.web.admin.announce;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class AdminAnnounceVO {
	int notice_seq;
	String notice_title;
	String notice_content;
	Timestamp date;
	int status;

}
