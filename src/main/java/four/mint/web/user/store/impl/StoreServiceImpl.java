package four.mint.web.user.store.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import four.mint.web.user.board.common.PageVO;
import four.mint.web.user.board.common.SearchVO;
import four.mint.web.user.store.CartVO;
import four.mint.web.user.store.StoreCategoryBigVO;
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

	
	

}
