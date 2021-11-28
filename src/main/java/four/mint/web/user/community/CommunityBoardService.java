package four.mint.web.user.community;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import four.mint.web.user.board.common.LikeVO;
import four.mint.web.user.board.common.PageVO;
import four.mint.web.user.board.common.SearchVO;

public interface CommunityBoardService {

	List<CommunityBoardVO> getCommunityBoardList(HttpServletRequest request, PageVO vo);
	
	int getBoardCount();

	void insertCommunity(CommunityBoardVO cVO);

	List<CommunityBoardVO> getKindList(SearchVO svo);

	CommunityBoardVO getBoard(int seq);

	void insertComment(CommunityCommentVO cVO);

	List<CommunityCommentVO> getCommunityComment(int community_seq);

	List<CommunityBoardVO> getCommunityListMe(String nickname);

	void updateViews(int seq);

	List<CommunityCommentVO> getCommentList(String nickname);

	List<CommunityBoardVO> getTopFive(String address);

	void insertLike(int seq);

	LikeVO checkLike(LikeVO lVO);

	void insertCommunityLike(LikeVO lVO);

	void deleteLike(int seq);

	void deleteCommunityLike(LikeVO lVO);

	void updateCommunity(CommunityBoardVO cVO);

	void deleteCommunity(int seq);

	void deleteCommunityComment(int seq);

	List<CommunityBoardVO> getFindList(FindVO fVO);

	int getKindCount(SearchVO svo);
}
