package four.mint.web.user.community;

import java.util.Date;

import lombok.Data;

@Data
public class CommunityBoardVO {

	private String userImg;
	private Date date;
	private String userName;
	private String userAddress;
	private String content;
}
