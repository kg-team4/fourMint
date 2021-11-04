package four.mint.web.user.market.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import four.mint.web.user.board.common.PageVO;
import four.mint.web.user.market.MarketSellVO;
import four.mint.web.user.market.MarketVO;

@Repository
public class MarketDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<MarketVO> getMarketList(HttpServletRequest request, PageVO vo) {
		System.out.println("====> marketList SELETE");

		return sqlSessionTemplate.selectList("MarketDAO.getMarketList", vo);
	}
	
	public int getMarketCount() {
		
		return sqlSessionTemplate.selectOne("MarketDAO.getMarketCount");
	}
	
	public void insertMarket(MarketSellVO vo) {
		System.out.println("======> market INSERT");
		sqlSessionTemplate.insert("MarketDAO.insertMarket", vo);
		
	}
}
