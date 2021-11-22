package four.mint.web.admin.banner.market.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import four.mint.web.admin.banner.market.AdminBannerMarketVO;
import four.mint.web.common.AesVO;
import four.mint.web.common.SThreeVO;

@Repository
public class AdminBannerMarketDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void updateBanner(AdminBannerMarketVO vo) {
		sqlSessionTemplate.update("AdminBannerMarketDAO.updateBanner", vo);
	}
	
	public String getBanner(int num) {
		return sqlSessionTemplate.selectOne("AdminBannerMarketDAO.getBanner", num);
	}
	
	public SThreeVO getSThree() {
		
		return sqlSessionTemplate.selectOne("KeyDAO.getSkey");
	}
	
	public AesVO getAes() {
		
		return sqlSessionTemplate.selectOne("KeyDAO.getKey");
	}
}
