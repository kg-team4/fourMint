package four.mint.web.user.market.impl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import four.mint.web.common.AesVO;
import four.mint.web.common.SThreeVO;
import four.mint.web.user.board.common.PageVO;
import four.mint.web.user.board.common.SearchVO;
import four.mint.web.user.market.MarketCategoryBigVO;
import four.mint.web.user.market.MarketVO;

@Repository
public class MarketDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public MarketVO getMarketOne(int market_seq) {
		System.out.println("==========> get marketOne");
		
		return sqlSessionTemplate.selectOne("MarketDAO.getMarketOne", market_seq);
	}
	
	public List<MarketVO> getMarketList(HttpServletRequest request, PageVO vo) {
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
		String kind = svo.getKind();
		return sqlSessionTemplate.selectOne("MarketDAO.getKindCount", kind);
	}

	public List<MarketVO> getKindList(SearchVO svo) {
		return sqlSessionTemplate.selectList("MarketDAO.getKindList", svo);
	}

	public List<MarketVO> getKindTwoList(SearchVO svo) {
		return sqlSessionTemplate.selectList("MarketDAO.getKindTwoList", svo);
	}
}
