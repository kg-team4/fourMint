package four.mint.web.admin.page;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class AdminPageVO {
	private String email_id;
	private String password;
	private String name;
	private String nickname;
	private String address1;
	private String address2;
	private String address3;
	private String phone;
	private String birth;
	private String gender;
	private String profile;
	private Timestamp date;
	private Timestamp delete_date;
}

