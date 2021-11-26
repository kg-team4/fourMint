package four.mint.web.user.market.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import four.mint.web.common.AesVO;
import four.mint.web.common.SThreeVO;
import four.mint.web.user.board.common.LikeVO;
import four.mint.web.user.board.common.MarketBuyerVO;
import four.mint.web.user.board.common.PageVO;
import four.mint.web.user.board.common.SearchVO;
import four.mint.web.user.market.MarketCategoryBigVO;
import four.mint.web.user.market.MarketLikeVO;
import four.mint.web.user.market.MarketRatingVO;
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
	public List<MarketVO> getMarketList(PageVO vo) {
		List<MarketVO> newVo = marketDao.getMarketList(vo);
		
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

	@Override
	public int getKindCount(SearchVO svo) {
		int page = marketDao.getKindCount(svo);
		return page;
	}
	
	@Override
	public int getKindTwoCount(SearchVO svo) {
		int page = marketDao.getKindTwoCount(svo);
		return page;
	}

	@Override
	public List<MarketVO> getKindList(SearchVO svo) {
		List<MarketVO> newVo = marketDao.getKindList(svo);
	
		return newVo;
	}
	
	@Override
	public List<MarketVO> getKindTwoList(SearchVO svo) {
		List<MarketVO> newVo = marketDao.getKindTwoList(svo);
		
		return newVo;
	}

	@Override
	public int getUserBoardCount(String nickname) {
		return marketDao.getUserBoardCount(nickname);
	}

	@Override
	public List<MarketVO> getMarketNickname(String nickname) {
		return marketDao.getMarketNickname(nickname);
	}

	@Override
	public void updateViews(int market_seq) {
		marketDao.updateViews(market_seq);
	}

	@Override
	public void deleteMarket(int seq) {
		marketDao.deleteMarket(seq);
	}

	@Override
	public List<MarketVO> getBest() {
		return marketDao.getBest();
	}

	@Override
	public List<MarketVO> getRecent() {
		return marketDao.getRecent();
	}

	@Override
	public List<MarketVO> getMarketListAddress(HashMap<String, String> searchTemp) {
		return marketDao.getMarketListAddress(searchTemp);
	}

	@Override
	public void insertLike(LikeVO lVO) {
		marketDao.insertLike(lVO);
	}

	@Override
	public LikeVO getLike(LikeVO tempLVO) {
		return marketDao.getLike(tempLVO);
	}

	@Override
	public void deleteLike(LikeVO lVO) {
		marketDao.deleteLike(lVO);
	}

	@Override
	public List<MarketVO> getMarketLike(String nickname) {
		return marketDao.getMarketLike(nickname);
	}

	@Override
	public void sellProduct(MarketBuyerVO mbVO) {
		marketDao.sellProduct(mbVO);
	}

	@Override
	public List<MarketVO> getMarketBuy(String nickname) {
		return marketDao.getMarketBuy(nickname);
	}

	@Override
	public void updateRating(MarketRatingVO mrVO) {
		marketDao.updateRating(mrVO);
	}

	@Override
	public List<MarketRatingVO> getMarketRating(String nickname) {
		return marketDao.getMarketRating(nickname);
	}

	@Override
	public void setRating(int buy_seq) {
		marketDao.setRating(buy_seq);
	}

	@Override
	public int searchLikes(int seq) {
		return marketDao.searchLikes(seq);
	}
	
	
}
