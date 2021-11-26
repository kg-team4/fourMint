package four.mint.web.user.market.impl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import four.mint.web.common.AesVO;
import four.mint.web.common.SThreeVO;
import four.mint.web.user.board.common.LikeVO;
import four.mint.web.user.board.common.MarketBuyerVO;
import four.mint.web.user.board.common.PageVO;
import four.mint.web.user.board.common.SearchVO;
import four.mint.web.user.market.MarketCategoryBigVO;
import four.mint.web.user.market.MarketLikeVO;
import four.mint.web.user.market.MarketRatingVO;
import four.mint.web.user.market.MarketVO;

@Repository
public class MarketDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public MarketVO getMarketOne(int market_seq) {
		System.out.println("==========> get marketOne");
		
		return sqlSessionTemplate.selectOne("MarketDAO.getMarketOne", market_seq);
	}
	
	public List<MarketVO> getMarketList(PageVO vo) {
		System.out.println("====> marketList SELETE");

		return sqlSessionTemplate.selectList("MarketDAO.getMarketList", vo);
	}
	
	public int getMarketCount() {
		
		return sqlSessionTemplate.selectOne("MarketDAO.getMarketCount");
	}
	
	public void insertMarket(MarketVO vo) {
		System.out.println("======> market INSERT");
		sqlSessionTemplate.insert("MarketDAO.insertMarket", vo);
	}
	
	public List<MarketCategoryBigVO> getMarketCategoryBig() {
		System.out.println("======> categoryBig get");
		
		return sqlSessionTemplate.selectList("MarketDAO.getMarketCategoryBig");
	}
	
	public SThreeVO getSThree() {
		System.out.println("=====> s3key");
		
		return sqlSessionTemplate.selectOne("KeyDAO.getSkey");
	}
	
	public AesVO getAes() {
		System.out.println("=====> aeskey");
		
		return sqlSessionTemplate.selectOne("KeyDAO.getKey");
	}

	public int getKindCount(SearchVO svo) {
		return sqlSessionTemplate.selectOne("MarketDAO.getKindCount", svo);
	}
	
	public int getKindTwoCount(SearchVO svo) {
		return sqlSessionTemplate.selectOne("MarketDAO.getKindCount", svo);
	}

	public List<MarketVO> getKindList(SearchVO svo) {
		return sqlSessionTemplate.selectList("MarketDAO.getKindList", svo);
	}

	public List<MarketVO> getKindTwoList(SearchVO svo) {
		return sqlSessionTemplate.selectList("MarketDAO.getKindTwoList", svo);
	}
  
	public int getUserBoardCount(String nickname) {
		return sqlSessionTemplate.selectOne("MarketDAO.getUserBoardCount", nickname);
	}

	public List<MarketVO> getMarketNickname(String nickname) {
		return sqlSessionTemplate.selectList("MarketDAO.getMarketNickname", nickname);
	}

	public void updateViews(int market_seq) {
		sqlSessionTemplate.update("MarketDAO.updateViews", market_seq);
	}

	public void deleteMarket(int seq) {
		sqlSessionTemplate.delete("MarketDAO.deleteMarket", seq);
	}

	public List<MarketVO> getBest() {
		return sqlSessionTemplate.selectList("MarketDAO.getBest");
	}

	public List<MarketVO> getRecent() {
		return sqlSessionTemplate.selectList("MarketDAO.getRecent");
	}

	public List<MarketVO> getMarketListAddress(HashMap<String, String> searchTemp) {
		return sqlSessionTemplate.selectList("MarketDAO.getMarketListAddress", searchTemp);
	}

	public void insertLike(LikeVO lVO) {
		sqlSessionTemplate.insert("MarketDAO.insertLike", lVO);
	}

	public LikeVO getLike(LikeVO tempLVO) {
		return sqlSessionTemplate.selectOne("MarketDAO.getLike", tempLVO);
	}

	public void deleteLike(LikeVO lVO) {
		sqlSessionTemplate.delete("MarketDAO.deleteLike", lVO);
	}

	public List<MarketVO> getMarketLike(String nickname) {
		return sqlSessionTemplate.selectList("MarketDAO.getMarketLike", nickname);
	}

	public void sellProduct(MarketBuyerVO mbVO) {
		sqlSessionTemplate.update("MarketDAO.sellProduct", mbVO);
	}

	public List<MarketVO> getMarketBuy(String nickname) {
		return sqlSessionTemplate.selectList("MarketDAO.getMarketBuy", nickname);
	}

	public void updateRating(MarketRatingVO mrVO) {
		sqlSessionTemplate.update("MarketDAO.updateRating", mrVO);
	}

	public List<MarketRatingVO> getMarketRating(String nickname) {
		return sqlSessionTemplate.selectList("MarketDAO.getMarketRating", nickname);
	}

	public void setRating(int buy_seq) {
		sqlSessionTemplate.insert("MarketDAO.setRating", buy_seq);
	}

	public int searchLikes(int seq) {
		return sqlSessionTemplate.selectOne("MarketDAO.searchLikes", seq);
	}
}
