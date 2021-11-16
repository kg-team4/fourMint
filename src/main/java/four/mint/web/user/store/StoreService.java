package four.mint.web.user.store;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import four.mint.web.user.board.common.PageVO;
import four.mint.web.user.board.common.SearchVO;

public interface StoreService {

	List<StoreVO> getStoreList(HttpServletRequest request, PageVO vo);
	
	int getStoreCount();
	
	List<StoreCategoryBigVO> getStoreCategoryBig();

	void insertStore(StoreVO vo);

	int getKindCount(SearchVO svo);

	List<StoreVO> getKindList(SearchVO svo);

	StoreVO getStoreOne(int seq);
	
	void insertCart(CartVO vo);
	
	List<CartVO> getCartList(String nickname);

	void updateCart(UpVO vo);

	void deleteCart(int id);
}
