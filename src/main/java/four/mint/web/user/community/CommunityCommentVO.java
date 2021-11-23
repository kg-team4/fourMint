package four.mint.web.user.community;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CommunityCommentVO {

	private int comment_seq;
	private String profile;
	private String nickname;
	private Timestamp date;
	private String content;
	private int board_seq;
	private int re_seq; 
	private String title;
}
