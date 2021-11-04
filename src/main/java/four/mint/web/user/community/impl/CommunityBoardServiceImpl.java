package four.mint.web.user.community.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import four.mint.web.user.board.common.PageVO;
import four.mint.web.user.community.CommunityBoardService;
import four.mint.web.user.community.CommunityBoardVO;

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
}

