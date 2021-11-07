package four.mint.web.user.market;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import four.mint.web.common.AesVO;
import four.mint.web.common.SThreeVO;
import four.mint.web.user.board.common.PageVO;

public interface MarketService {
	
	MarketVO getMarketOne(int market_seq);

	List<MarketVO> getMarketList(HttpServletRequest request, PageVO vo);
	
	int getMarketCount();
	
	void insertMarket(MarketVO vo);
	
	List<MarketCategoryBigVO> getMarketCategoryBig();
	
	SThreeVO getSkey();
	
	AesVO getKey();
}
