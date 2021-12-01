package four.mint.web.user.store.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import four.mint.web.user.board.common.LikeVO;
import four.mint.web.user.board.common.PageVO;
import four.mint.web.user.board.common.SearchVO;
import four.mint.web.user.store.CartVO;
import four.mint.web.user.store.StoreAskVO;
import four.mint.web.user.store.StoreCategoryBigVO;
import four.mint.web.user.store.StoreRateVO;
import four.mint.web.user.store.StoreVO;
import four.mint.web.user.store.TransactionHistoryVO;
import four.mint.web.user.store.UpVO;

@Repository
public class StoreDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<StoreVO> getStoreList(HttpServletRequest request, PageVO vo) {
		return sqlSessionTemplate.selectList("StoreDAO.getStoreList", vo);
	}
	
	public int getStoreCount() {
		return sqlSessionTemplate.selectOne("StoreDAO.getStoreCount");
	}

	public List<StoreCategoryBigVO> getStoreCategoryBig() {
		return sqlSessionTemplate.selectList("StoreDAO.getStoreCategoryBig");
	}
	
	public void insertStore(StoreVO vo) {
		sqlSessionTemplate.insert("StoreDAO.insertStore", vo);
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

	public List<StoreVO> getStoreListSix() {
		return sqlSessionTemplate.selectList("StoreDAO.getStoreListSix");
	}

	public void minusStock(TransactionHistoryVO thVO) {
		sqlSessionTemplate.update("StoreDAO.minusStock", thVO);
	}

	public List<StoreVO> getBest() {
		return sqlSessionTemplate.selectList("StoreDAO.getBest");
	}

	public List<TransactionHistoryVO> getTransactionList(String email_id) {
		return sqlSessionTemplate.selectList("StoreDAO.getTransactionList", email_id);
	}

	public void insertLike(LikeVO lVO) {
		sqlSessionTemplate.insert("StoreDAO.insertLike", lVO);
	}

	public void deleteLike(LikeVO lVO) {
		sqlSessionTemplate.delete("StoreDAO.deleteLike", lVO);
	}

	public LikeVO getLike(LikeVO tempLVO) {
		return sqlSessionTemplate.selectOne("StoreDAO.getLike", tempLVO);
	}

	public List<StoreVO> getStoreLike(String nickname) {
		return sqlSessionTemplate.selectList("StoreDAO.getStoreLike", nickname);
	}

	public void updateCancel(TransactionHistoryVO thVO) {
		sqlSessionTemplate.update("StoreDAO.updateCancel", thVO);
	}

	public TransactionHistoryVO getTransaction(TransactionHistoryVO tVO) {
		return sqlSessionTemplate.selectOne("StoreDAO.getTransaction", tVO);
	}

	public void insertRate(StoreRateVO srVO) {
		sqlSessionTemplate.insert("StoreDAO.insertRate", srVO);
	}

	public List<StoreRateVO> getRateList(int seq) {
		return sqlSessionTemplate.selectList("StoreDAO.getRateList", seq);
	}

	public void deleteRate(int seq) {
		sqlSessionTemplate.delete("StoreDAO.deleteRate", seq);
	}

	public void insertAsk(StoreAskVO qVO) {
		sqlSessionTemplate.insert("StoreDAO.insertAsk", qVO);
	}

	public List<StoreAskVO> getAskList(StoreAskVO askVO) {
		return sqlSessionTemplate.selectList("StoreDAO.getAskList", askVO);
	}

	public void deleteAsk(int seq) {
		sqlSessionTemplate.delete("StoreDAO.deleteAsk", seq);
	}

	public int searchLikes(int seq) {
		return sqlSessionTemplate.selectOne("StoreDAO.searchLikes", seq);
	}
	
	// admin chart
	public List<Integer> getCategoryBig() {
		return sqlSessionTemplate.selectList("StoreDAO.getCategoryBig");
	}
	
	public void plusStock(StoreVO vo) {
		sqlSessionTemplate.selectOne("StoreDAO.plusStock", vo);
	}
	
	public StoreVO getTransactionHistoryOne(StoreVO vo) {
		return sqlSessionTemplate.selectOne("StoreDAO.getTransactionHistoryOne", vo);
	}

	public float getAvg(int seq) {
		if(sqlSessionTemplate.selectOne("StoreDAO.getAvg", seq) == null) {
			return 0;
		}
		return sqlSessionTemplate.selectOne("StoreDAO.getAvg", seq);
	}

	public CartVO getCart(CartVO vo) {
		return sqlSessionTemplate.selectOne("StoreDAO.getCartDouble", vo);
	}
}
