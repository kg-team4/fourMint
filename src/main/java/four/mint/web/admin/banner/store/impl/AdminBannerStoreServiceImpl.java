package four.mint.web.admin.banner.store.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import four.mint.web.admin.banner.store.AdminBannerStoreService;
import four.mint.web.admin.banner.store.AdminBannerStoreVO;
import four.mint.web.common.AesVO;
import four.mint.web.common.SThreeVO;

@Service("adminBannerStoreService")
public class AdminBannerStoreServiceImpl implements AdminBannerStoreService {

	@Autowired
	private AdminBannerStoreDAO adminBannerStoreDAO;
	
	@Override
	public void updateBannerStore(AdminBannerStoreVO vo) {
		adminBannerStoreDAO.updateBanner(vo);
	}

	@Override
	public String getBanner(int num) {
		
		return adminBannerStoreDAO.getBanner(num);
	}

	@Override
	public SThreeVO getSkey() {
		SThreeVO newSVO = adminBannerStoreDAO.getSThree();
		
		return newSVO;
	}

	@Override
	public AesVO getKey() {
		AesVO newAesVO = adminBannerStoreDAO.getAes();
		
		return newAesVO;
	}

}
