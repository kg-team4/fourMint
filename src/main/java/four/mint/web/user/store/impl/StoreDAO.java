package four.mint.web.user.store.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import four.mint.web.user.board.common.PageVO;
import four.mint.web.user.board.common.SearchVO;
import four.mint.web.user.store.CartVO;
import four.mint.web.user.store.StoreCategoryBigVO;
import four.mint.web.user.store.StoreVO;
import four.mint.web.user.store.TransactionHistoryVO;
import four.mint.web.user.store.UpVO;

@Repository
public class StoreDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<StoreVO> getStoreList(HttpServletRequest request, PageVO vo) {
		System.out.println("====> marketList SELECT");

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

	public int getKindCount(SearchVO svo) {
		return sqlSessionTemplate.selectOne("StoreDAO.getKindCount", svo);
	}

	public List<StoreVO> getKindList(SearchVO svo) {
		return sqlSessionTemplate.selectList("StoreDAO.getKindList", svo);
	}

	public StoreVO getStoreOne(int seq) {
		return sqlSessionTemplate.selectOne("StoreDAO.getStoreOne", seq);
	}

	public void insertCart(CartVO vo) {
		sqlSessionTemplate.insert("StoreDAO.insertCart", vo);
	}
	
	public List<CartVO> getCartList(String nickname) {
		return sqlSessionTemplate.selectList("StoreDAO.getCartList", nickname);
	}

	public void updateCart(UpVO vo) {
		sqlSessionTemplate.update("StoreDAO.updateCart", vo);
	}

	public void deleteCart(int id) {
		sqlSessionTemplate.delete("StoreDAO.deleteCart", id);
	}

	public CartVO getCart(int cartNum) {
		return sqlSessionTemplate.selectOne("StoreDAO.getCart", cartNum);
	}

	public void updateCart(CartVO cart) {
		sqlSessionTemplate.update("StoreDAO.updateCartVO", cart);
	}

	public int getPrice(int cart_id) {
		return sqlSessionTemplate.selectOne("StoreDAO.getPrice", cart_id);
	}

	public void insertHistory(TransactionHistoryVO thVO) {
		sqlSessionTemplate.insert("StoreDAO.insertHistory", thVO);
	}
}
