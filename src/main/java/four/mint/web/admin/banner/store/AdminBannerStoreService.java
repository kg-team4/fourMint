package four.mint.web.admin.banner.store;

import four.mint.web.common.AesVO;
import four.mint.web.common.SThreeVO;

public interface AdminBannerStoreService {
	void updateBannerStore(AdminBannerStoreVO vo);
	String getBanner(int num);
	SThreeVO getSkey();
	AesVO getKey();
}
