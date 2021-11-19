package four.mint.web.user.market;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import four.mint.web.common.AesVO;
import four.mint.web.common.SThreeVO;
import four.mint.web.user.board.common.PageVO;
import four.mint.web.user.board.common.SearchVO;

public interface MarketService {
	
	MarketVO getMarketOne(int market_seq);

	List<MarketVO> getMarketList(HttpServletRequest request, PageVO vo);
	
	int getMarketCount();
	
	void insertMarket(MarketVO vo);
	
	List<MarketCategoryBigVO> getMarketCategoryBig();
	
	SThreeVO getSkey();
	
	AesVO getKey();
	
	int getKindCount(SearchVO svo);
	
	int getKindTwoCount(SearchVO svo);

	List<MarketVO> getKindList(SearchVO svo);

	List<MarketVO> getKindTwoList(SearchVO svo);

	int getUserBoardCount(String nickname);
	
	List<MarketVO> getMarketNickname(String nickname);

	void updateViews(int market_seq);

	void deleteMarket(int seq);
}
