package four.mint.web.user.market.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import four.mint.web.user.board.common.PageVO;
import four.mint.web.user.community.CommunityBoardVO;
import four.mint.web.user.market.MarketSellVO;
import four.mint.web.user.market.MarketService;
import four.mint.web.user.market.MarketVO;

@Service("marketService")
public class MarketServiceImpl implements MarketService {

	@Autowired
	private MarketDAO marketDao;
	
	@Override
	public List<MarketVO> getMarketList(HttpServletRequest request, PageVO vo) {
		List<MarketVO> newVo = marketDao.getMarketList(request, vo);
		
		return newVo;
	}

	@Override
	public int getMarketCount() {
		int page = marketDao.getMarketCount();
		
		return page;
	}

	@Override
	public void insertMarket(MarketSellVO vo) {
		marketDao.insertMarket(vo);
		
	}

}
