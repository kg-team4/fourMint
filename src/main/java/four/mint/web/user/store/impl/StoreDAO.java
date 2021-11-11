package four.mint.web.user.store.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import four.mint.web.user.board.common.PageVO;
import four.mint.web.user.store.StoreCategoryBigVO;
import four.mint.web.user.store.StoreVO;

@Repository
public class StoreDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<StoreVO> getStoreList(HttpServletRequest request, PageVO vo) {
		System.out.println("====> marketList SELETE");

		return sqlSessionTemplate.selectList("StoreDAO.getStoreList", vo);
	}
	
	public int getStoreCount() {
		
		return sqlSessionTemplate.selectOne("StoreDAO.getStoreCount");
	}

	public List<StoreCategoryBigVO> getStoreCategoryBig() {
		System.out.println("======> categoryBig get");
		
		return sqlSessionTemplate.selectList("StoreDAO.getStoreCategoryBig");
	}
	
	public void insertStore(StoreVO vo) {
		sqlSessionTemplate.insert("StoreDAO.insertStore", vo);
		
		System.out.println("======> store INSERT");
	}
}
