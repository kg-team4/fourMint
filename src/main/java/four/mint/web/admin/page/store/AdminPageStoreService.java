package four.mint.web.admin.page.store;

import java.util.List;

import four.mint.web.common.AesVO;
import four.mint.web.common.SThreeVO;
import four.mint.web.user.board.common.SearchVO;
import four.mint.web.user.store.StoreCategoryBigVO;

public interface AdminPageStoreService {
	List<AdminPageStoreVO> getStoreList();
	
	int getStoreCount();
	
	List<StoreCategoryBigVO> getStoreCategoryBig();

	void insertStore(AdminPageStoreVO vo);

	int getKindCount(SearchVO svo);

	List<AdminPageStoreVO> getKindList(SearchVO svo);

	AdminPageStoreVO getStoreOne(int seq);
	
	void updateStore(AdminPageStoreVO vo);

	void deleteStore(int seq);
	
	SThreeVO getSkey();
	
	AesVO getKey();
}
