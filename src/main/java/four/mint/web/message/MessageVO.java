package four.mint.web.message;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MessageVO {
	private int no;
	private int room;
	private String send_nick;
	private String recv_nick;
	private Timestamp send_time;
	private Timestamp read_time;
	private String content;
	private int read_check;

	// 현재 사용자의 메세지 상대 nick을 담는다.
	private String other_nick;

	// 현재 사용자의 메세지 상대 profile을 담는다.
	private String profile;

	// 현재 사용자 nick
	private String nickname;

	// 안읽은 메세지 갯수
	private int unread;
}
