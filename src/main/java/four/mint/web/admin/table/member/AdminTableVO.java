package four.mint.web.admin.table.member;

import java.sql.Timestamp;
import lombok.Data;


@Data
public class AdminTableVO {
	private String email_id;
	private String password;
	private String name;
	private String nickname;
	private String address1;
	private String address2;
	private String address3;
	private String phone;
	private String birth;
	private Timestamp blacklist_date;
	private String social_login;
	private String snsid;
	private String gender;
	private Float rating;
	private String profile;
	private int reoports;
	private Timestamp date;
	private Timestamp delete_date;
	
}
