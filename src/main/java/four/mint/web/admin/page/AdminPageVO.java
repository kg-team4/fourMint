package four.mint.web.admin.page;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class AdminPageVO {
	
		String email_id;
		String name;
		String nickname;
		String phone;
		String address2;
		String birth;
		String gender;
		Timestamp date;
		Timestamp delete_date;

	}

