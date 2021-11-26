package four.mint.web.user.store;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import four.mint.web.user.board.common.LikeVO;
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

	CartVO getCart(int cartNum);

	void updateCart(CartVO cart);

	int getPrice(int cart_id);

	void insertHistory(TransactionHistoryVO thVO);

	List<StoreVO> getStoreListSix();

	void minusStock(TransactionHistoryVO thVO);

	List<StoreVO> getBest();

	List<TransactionHistoryVO> getTransactionList(String email_id);

	void insertLike(LikeVO lVO);

	void deleteLike(LikeVO lVO);

	LikeVO getLike(LikeVO tempLVO);

	List<StoreVO> getStoreLike(String nickname);

	void updateCancel(TransactionHistoryVO thVO);

	TransactionHistoryVO getTransaction(TransactionHistoryVO tVO);

	void insertRate(StoreRateVO srVO);

	List<StoreRateVO> getRateList(int seq);

	void deleteRate(int seq);

	void insertAsk(StoreAskVO qVO);

	List<StoreAskVO> getAskList(StoreAskVO askVO);

	void deleteAsk(int seq);

	int searchLikes(int seq);


}
