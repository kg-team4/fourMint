package four.mint.web.user.store.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import four.mint.web.user.board.common.LikeVO;
import four.mint.web.user.board.common.PageVO;
import four.mint.web.user.board.common.SearchVO;
import four.mint.web.user.store.CartVO;
import four.mint.web.user.store.StoreAskVO;
import four.mint.web.user.store.StoreCategoryBigVO;
import four.mint.web.user.store.StoreRateVO;
import four.mint.web.user.store.StoreService;
import four.mint.web.user.store.StoreVO;
import four.mint.web.user.store.TransactionHistoryVO;
import four.mint.web.user.store.UpVO;

@Service("storeService")
public class StoreServiceImpl implements StoreService {
	
	@Autowired
	private StoreDAO storeDao;

	@Override
	public List<StoreVO> getStoreList(HttpServletRequest request, PageVO vo) {
		List<StoreVO> newVo = storeDao.getStoreList(request, vo);
		
		return newVo;
	}

	@Override
	public int getStoreCount() {
		int page = storeDao.getStoreCount();
		
		return page;
	}
	
	@Override
	public List<StoreCategoryBigVO> getStoreCategoryBig() {
		List<StoreCategoryBigVO> newCaVO = storeDao.getStoreCategoryBig();

		return newCaVO;
	}
	
	@Override
	public void insertStore(StoreVO vo) {
		storeDao.insertStore(vo);
		
	}

	@Override
	public int getKindCount(SearchVO svo) {
		int list = storeDao.getKindCount(svo);

		return list;
	}

	@Override
	public List<StoreVO> getKindList(SearchVO svo) {
		List<StoreVO> newVo = storeDao.getKindList(svo);
		
		return newVo;
	}

	@Override
	public StoreVO getStoreOne(int seq) {
		
		return storeDao.getStoreOne(seq);
	}

	@Override
	public void insertCart(CartVO vo) {
		storeDao.insertCart(vo);
	}

	@Override
	public List<CartVO> getCartList(String nickname) {
		return storeDao.getCartList(nickname);
	}

	@Override
	public void updateCart(UpVO vo) {
		storeDao.updateCart(vo);
	}

	@Override
	public void deleteCart(int id) {
		storeDao.deleteCart(id);
	}

	@Override
	public CartVO getCart(int cartNum) {
		return storeDao.getCart(cartNum);
	}

	@Override
	public void updateCart(CartVO cart) {
		storeDao.updateCart(cart);
	}

	@Override
	public int getPrice(int cart_id) {
		return storeDao.getPrice(cart_id);
	}

	@Override
	public void insertHistory(TransactionHistoryVO thVO) {
		storeDao.insertHistory(thVO);
	}

	@Override
	public List<StoreVO> getStoreListSix() {
		return storeDao.getStoreListSix();
	}

	@Override
	public void minusStock(TransactionHistoryVO thVO) {
		storeDao.minusStock(thVO);
	}

	@Override
	public List<StoreVO> getBest() {
		return storeDao.getBest();
	}

	@Override
	public List<TransactionHistoryVO> getTransactionList(String email_id) {
		return storeDao.getTransactionList(email_id);
	}

	@Override
	public void insertLike(LikeVO lVO) {
		storeDao.insertLike(lVO);
	}

	@Override
	public void deleteLike(LikeVO lVO) {
		storeDao.deleteLike(lVO);
	}

	@Override
	public LikeVO getLike(LikeVO tempLVO) {
		return storeDao.getLike(tempLVO);
	}

	@Override
	public List<StoreVO> getStoreLike(String nickname) {
		return storeDao.getStoreLike(nickname);
	}

	@Override
	public void updateCancel(TransactionHistoryVO thVO) {
		storeDao.updateCancel(thVO);
	}

	@Override
	public TransactionHistoryVO getTransaction(TransactionHistoryVO tVO) {
		return storeDao.getTransaction(tVO);
	}

	@Override
	public void insertRate(StoreRateVO srVO) {
		storeDao.insertRate(srVO);
	}

	@Override
	public List<StoreRateVO> getRateList(int seq) {
		return storeDao.getRateList(seq);
	}

	@Override
	public void deleteRate(int seq) {
		storeDao.deleteRate(seq);
	}

	@Override
	public void insertAsk(StoreAskVO qVO) {
		storeDao.insertAsk(qVO);
	}

	@Override
	public List<StoreAskVO> getAskList(StoreAskVO askVO) {
		return storeDao.getAskList(askVO);
	}

	@Override
	public void deleteAsk(int seq) {
		storeDao.deleteAsk(seq);
	}

	@Override
	public int searchLikes(int seq) {
		return storeDao.searchLikes(seq);
	}

	// admin chart
	@Override
	public List<Integer> getCategoryBig() {
		return storeDao.getCategoryBig();
	}

	@Override
	public void plusStock(StoreVO vo) {
		storeDao.plusStock(vo);
	}
	
	@Override
	public StoreVO getTransactionHistoryOne(StoreVO vo) {
		return storeDao.getTransactionHistoryOne(vo);
	}

	@Override
	public float getAvg(int seq) {
		return storeDao.getAvg(seq);
	}

	@Override
	public CartVO getCart(CartVO vo) {
		return storeDao.getCart(vo);
	}

	@Override
	public StoreVO getStoreCart(int id) {
		return storeDao.getStoreCart(id);
	}

	
}
