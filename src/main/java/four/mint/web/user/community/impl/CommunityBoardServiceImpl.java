package four.mint.web.user.community.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import four.mint.web.user.board.common.LikeVO;
import four.mint.web.user.board.common.PageVO;
import four.mint.web.user.community.CommunityBoardService;
import four.mint.web.user.community.CommunityBoardVO;
import four.mint.web.user.community.CommunityCommentVO;

@Service("communityBoardService")
public class CommunityBoardServiceImpl implements CommunityBoardService {

	@Autowired
	private CommunityBoardDAO communityBoardDao;
	
	@Override
	public List<CommunityBoardVO> getCommunityBoardList(HttpServletRequest request, PageVO vo) {
		List<CommunityBoardVO> newVo = communityBoardDao.getCommunityBoardList(request, vo);

		return newVo;
	}

	@Override
	public int getBoardCount() {
		int page = communityBoardDao.getBoardCount();
		
		return page;
	}

	@Override
	public void insertCommunity(CommunityBoardVO cVO) {
		communityBoardDao.insertCommunity(cVO);
	}

	@Override
	public List<CommunityBoardVO> getKindList(String kind) {
		return communityBoardDao.getKindList(kind);
	}

	@Override
	public CommunityBoardVO getBoard(int seq) {
		return communityBoardDao.getBoard(seq);
	}

	@Override
	public void insertComment(CommunityCommentVO cVO) {
		communityBoardDao.insertComment(cVO);
	}

	@Override
	public List<CommunityCommentVO> getCommunityComment(int community_seq) {
		return communityBoardDao.getCommunityComment(community_seq);
	}

	@Override
	public List<CommunityBoardVO> getCommunityListMe(String nickname) {
		return communityBoardDao.getCommunityListMe(nickname);
	}

	@Override
	public void updateViews(int seq) {
		communityBoardDao.updateViews(seq);
	}

	@Override
	public void updateComments(int board_seq) {
		communityBoardDao.updateComments(board_seq);
	}

	@Override
	public List<CommunityCommentVO> getCommentList(String nickname) {
		return communityBoardDao.getCommentList(nickname);
	}

	@Override
	public List<CommunityBoardVO> getTopFive() {
		return communityBoardDao.getTopFive();
	}

	@Override
	public void insertLike(int seq) {
		communityBoardDao.insertLike(seq);
	}

	@Override
	public LikeVO checkLike(LikeVO lVO) {
		return communityBoardDao.checkLike(lVO);
	}

	@Override
	public void insertCommunityLike(LikeVO lVO) {
		communityBoardDao.insertCommunityLike(lVO);
	}

	@Override
	public void deleteLike(int seq) {
		communityBoardDao.deleteLike(seq);
	}

	@Override
	public void deleteCommunityLike(LikeVO lVO) {
		communityBoardDao.deleteCommunityLike(lVO);
	}
	
	
}

