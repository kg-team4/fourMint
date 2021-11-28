package four.mint.web.admin.table.member;

import java.sql.Timestamp;
import lombok.Data;


@Data
public class AdminTableVO {
	String email_id;
	String name;
	String nickname;
	String phone;
	String address1;
	String address2;
	String address3;
	String birth;
	String gender;
	Timestamp date;
	Timestamp blacklist_date;
	String social_login;
	String rating;
	String reports;
	Timestamp delete_date;

}
