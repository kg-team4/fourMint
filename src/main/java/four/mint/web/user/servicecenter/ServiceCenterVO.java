package four.mint.web.user.servicecenter;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ServiceCenterVO {

	private int notice_seq;
	private int status;
	private String notice_title;
	private String notice_content;
	private Timestamp date;	
}
