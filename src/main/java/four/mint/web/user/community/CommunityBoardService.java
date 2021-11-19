package four.mint.web.user.community;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import four.mint.web.user.board.common.PageVO;

public interface CommunityBoardService {

	List<CommunityBoardVO> getCommunityBoardList(HttpServletRequest request, PageVO vo);
	
	int getBoardCount();

	void insertCommunity(CommunityBoardVO cVO);

	List<CommunityBoardVO> getKindList(String kind);

	CommunityBoardVO getBoard(int seq);

	void insertComment(CommunityCommentVO cVO);

	List<CommunityCommentVO> getCommunityComment(int community_seq);

	List<CommunityBoardVO> getCommunityListMe(String nickname);

	void updateViews(int seq);

	void updateComments(int board_seq);
}
