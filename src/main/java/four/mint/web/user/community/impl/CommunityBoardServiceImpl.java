package four.mint.web.user.community.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import four.mint.web.user.community.CommunityBoardService;
import four.mint.web.user.community.CommunityBoardVO;

@Service("communityBoardService")
public class CommunityBoardServiceImpl implements CommunityBoardService {

	@Autowired
	private CommunityBoardDAO communityBoardDao;
	
	@Override
	public List<CommunityBoardVO> getCommunityBoardList(CommunityBoardVO vo) {
		List<CommunityBoardVO> newVo = communityBoardDao.getCommunityBoardList(vo);
		
		return newVo;
	}
	
}

