package four.mint.web.user.store;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import four.mint.web.user.board.common.PageVO;

public interface StoreService {

	List<StoreVO> getStoreList(HttpServletRequest request, PageVO vo);
	
	int getStoreCount();
	
	List<StoreCategoryBigVO> getStoreCategoryBig();

	void insertStore(StoreVO vo);

}
