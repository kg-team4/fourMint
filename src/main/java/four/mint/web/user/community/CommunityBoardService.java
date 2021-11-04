package four.mint.web.user.community;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import four.mint.web.user.board.common.PageVO;

public interface CommunityBoardService {

	List<CommunityBoardVO> getCommunityBoardList(HttpServletRequest request, PageVO vo);
	
	int getBoardCount();
}
