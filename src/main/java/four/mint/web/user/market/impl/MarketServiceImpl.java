package four.mint.web.user.market.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import four.mint.web.common.AesVO;
import four.mint.web.common.SThreeVO;
import four.mint.web.user.board.common.PageVO;
import four.mint.web.user.market.MarketCategoryBigVO;
import four.mint.web.user.market.MarketService;
import four.mint.web.user.market.MarketVO;

@Service("marketService")
public class MarketServiceImpl implements MarketService {

	@Autowired
	private MarketDAO marketDao;

	@Override
	public MarketVO getMarketOne(int market_seq) {
		MarketVO vo = marketDao.getMarketOne(market_seq);
		
		return vo;
	}
	
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
	public void insertMarket(MarketVO vo) {
		marketDao.insertMarket(vo);
		
	}

	@Override
	public List<MarketCategoryBigVO> getMarketCategoryBig() {
		List<MarketCategoryBigVO> newCaVO = marketDao.getMarketCategoryBig();
		
		return newCaVO;
	}
	
	@Override
	public SThreeVO getSkey() {
		SThreeVO newSVO = marketDao.getSThree();
		
		return newSVO;
	}

	@Override
	public AesVO getKey() {
		AesVO newAesVO = marketDao.getAes();
		
		return newAesVO;
	}

}
