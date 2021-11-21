package four.mint.web.admin.banner.market.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import four.mint.web.admin.banner.market.AdminBannerMarketService;
import four.mint.web.admin.banner.market.AdminBannerMarketVO;
import four.mint.web.common.AesVO;
import four.mint.web.common.SThreeVO;

@Service("adminBannerMarketService")
public class AdminBannerMarketServiceImpl implements AdminBannerMarketService {

	@Autowired
	private AdminBannerMarketDAO adminBannerMarketDAO;
	
	@Override
	public void updateBannerMarket(AdminBannerMarketVO vo) {
		adminBannerMarketDAO.updateBanner(vo);
	}

	@Override
	public String getBanner(int num) {
		
		return adminBannerMarketDAO.getBanner(num);
	}

	@Override
	public SThreeVO getSkey() {
		SThreeVO newSVO = adminBannerMarketDAO.getSThree();
		
		return newSVO;
	}

	@Override
	public AesVO getKey() {
		AesVO newAesVO = adminBannerMarketDAO.getAes();
		
		return newAesVO;
	}

}
