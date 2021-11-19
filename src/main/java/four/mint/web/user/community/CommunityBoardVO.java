package four.mint.web.user.community;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CommunityBoardVO {

	private int community_seq;
	private String title;
	private String category;
	private Timestamp date;
	private String nickname;
	private String address2;
	private String content;
	private String url;
	private int views;
	private int likes;
	private int comments;
}
