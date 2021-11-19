package four.mint.web.user.community.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
	
}

