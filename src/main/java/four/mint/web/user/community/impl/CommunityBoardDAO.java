package four.mint.web.user.community.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import four.mint.web.user.board.common.LikeVO;
import four.mint.web.user.board.common.PageVO;
import four.mint.web.user.board.common.SearchVO;
import four.mint.web.user.community.CommunityBoardVO;
import four.mint.web.user.community.CommunityCommentVO;
import four.mint.web.user.community.FindVO;
import four.mint.web.user.community.KindAddressVO;

@Repository
public class CommunityBoardDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<CommunityBoardVO> getCommunityBoardList(HttpServletRequest request, PageVO vo) {
		return sqlSessionTemplate.selectList("CommunityBoardDAO.getCommunityBoardList", vo);
	}
	
	public int getBoardCount() {
		return sqlSessionTemplate.selectOne("CommunityBoardDAO.getBoardCount");
	}

	public void insertCommunity(CommunityBoardVO cVO) {
		sqlSessionTemplate.insert("CommunityBoardDAO.insertCommunity", cVO);
	}

	public List<CommunityBoardVO> getKindList(SearchVO svo) {
		return sqlSessionTemplate.selectList("CommunityBoardDAO.getKindList", svo);
	}

	public CommunityBoardVO getBoard(int seq) {
		return sqlSessionTemplate.selectOne("CommunityBoardDAO.getBoard", seq);
	}

	public void insertComment(CommunityCommentVO cVO) {
		sqlSessionTemplate.insert("CommunityBoardDAO.insertComment", cVO);
	}

	public List<CommunityCommentVO> getCommunityComment(int community_seq) {
		return sqlSessionTemplate.selectList("CommunityBoardDAO.getCommunityComment", community_seq);
	}

	public List<CommunityBoardVO> getCommunityListMe(String nickname) {
		return sqlSessionTemplate.selectList("CommunityBoardDAO.getCommunityListMe", nickname);
	}

	public void updateViews(int seq) {
		sqlSessionTemplate.update("CommunityBoardDAO.updateViews", seq);
	}

	public List<CommunityCommentVO> getCommentList(String nickname) {
		return sqlSessionTemplate.selectList("CommunityBoardDAO.getCommentList", nickname);
	}

	public List<CommunityBoardVO> getTopFive(String address) {
		return sqlSessionTemplate.selectList("CommunityBoardDAO.getTopFive", address);
	}

	public void insertLike(int seq) {
		sqlSessionTemplate.update("CommunityBoardDAO.insertLike", seq);
	}

	public LikeVO checkLike(LikeVO lVO) {
		return sqlSessionTemplate.selectOne("CommunityBoardDAO.checkLike", lVO);
	}

	public void insertCommunityLike(LikeVO lVO) {
		sqlSessionTemplate.insert("CommunityBoardDAO.insertCommunityLike", lVO);
	}

	public void deleteLike(int seq) {
		sqlSessionTemplate.update("CommunityBoardDAO.deleteLike", seq);
	}

	public void deleteCommunityLike(LikeVO lVO) {
		sqlSessionTemplate.delete("CommunityBoardDAO.deleteCommunityLike", lVO);
	}

	public void updateCommunity(CommunityBoardVO cVO) {
		sqlSessionTemplate.update("CommunityBoardDAO.updateCommunity", cVO);
	}

	public void deleteCommunity(int seq) {
		sqlSessionTemplate.delete("CommunityBoardDAO.deleteCommunity", seq);
	}

	public void deleteCommunityComment(int seq) {
		sqlSessionTemplate.delete("CommunityBoardDAO.deleteCommunityComment", seq);
	}

	public List<CommunityBoardVO> getFindList(FindVO fVO) {
		return sqlSessionTemplate.selectList("CommunityBoardDAO.getFindList", fVO);
	}

	public int getKindCount(SearchVO svo) {
		return sqlSessionTemplate.selectOne("CommunityBoardDAO.getKindCount", svo);
	}
}
