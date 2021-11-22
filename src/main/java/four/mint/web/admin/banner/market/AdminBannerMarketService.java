package four.mint.web.admin.banner.market;

import four.mint.web.common.AesVO;
import four.mint.web.common.SThreeVO;

public interface AdminBannerMarketService {
	void updateBannerMarket(AdminBannerMarketVO vo);
	String getBanner(int num);
	SThreeVO getSkey();
	AesVO getKey();
}
