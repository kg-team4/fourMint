package four.mint.web.user.board.common;

import lombok.Data;

@Data
public class SearchVO {
	
	private String kind;
	private String kindTwo;
	private int page;
	private int rnum;
	private String keyword;
	private String option;
	private String address;
}
