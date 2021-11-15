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

}
