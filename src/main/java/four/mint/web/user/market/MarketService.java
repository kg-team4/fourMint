package four.mint.web.user.market;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import four.mint.web.user.board.common.PageVO;

public interface MarketService {

	List<MarketVO> getMarketList(HttpServletRequest request, PageVO vo);
	
	int getMarketCount();
	
	void insertMarket(MarketSellVO vo);
}
