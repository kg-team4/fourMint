package four.mint.web.user;

import lombok.Data;

@Data
public class User {
	//kakao
	private String profileNick;
	private String profile;
	private String email;
	
	//naver
	private String naverid;
	private String nickname;
	private String gender;
	private String mobile;
	private String name;
	private String birthday;
	private String birhyear;
}
