package four.mint.web.admin.banner.store.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import four.mint.web.admin.banner.store.AdminBannerStoreVO;
import four.mint.web.common.AesVO;
import four.mint.web.common.SThreeVO;

@Repository
public class AdminBannerStoreDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void updateBanner(AdminBannerStoreVO vo) {
		sqlSessionTemplate.update("AdminBannerStoreDAO.updateBanner", vo);
	}
	
	public String getBanner(int num) {
		return sqlSessionTemplate.selectOne("AdminBannerStoreDAO.getBanner", num);
	}
	
	public SThreeVO getSThree() {
		
		return sqlSessionTemplate.selectOne("KeyDAO.getSkey");
	}
	
	public AesVO getAes() {
		
		return sqlSessionTemplate.selectOne("KeyDAO.getKey");
	}
}
