package four.mint.web.admin.page.store.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import four.mint.web.admin.page.store.AdminPageStoreVO;
import four.mint.web.common.AesVO;
import four.mint.web.common.SThreeVO;
import four.mint.web.user.board.common.SearchVO;
import four.mint.web.user.store.StoreCategoryBigVO;
import four.mint.web.user.store.StoreVO;

@Repository
public class AdminPageStoreDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<AdminPageStoreVO> getStoreList() {

		return sqlSessionTemplate.selectList("AdminPageStoreDAO.getStoreList");
	}
	
	public int getStoreCount() {
		
		return sqlSessionTemplate.selectOne("AdminPageStoreDAO.getStoreCount");
	}

	public List<StoreCategoryBigVO> getStoreCategoryBig() {
		
		return sqlSessionTemplate.selectList("AdminPageStoreDAO.getStoreCategoryBig");
	}
	
	public void insertStore(AdminPageStoreVO vo) {
		
		sqlSessionTemplate.insert("AdminPageStoreDAO.insertStore", vo);
	}

	public int getKindCount(SearchVO svo) {
		
		return sqlSessionTemplate.selectOne("AdminPageStoreDAO.getKindCount", svo);
	}

	public List<AdminPageStoreVO> getKindList(SearchVO svo) {
		return sqlSessionTemplate.selectList("AdminPageStoreDAO.getKindList", svo);
	}

	public AdminPageStoreVO getStoreOne(int seq) {
		return sqlSessionTemplate.selectOne("AdminPageStoreDAO.getStoreOne", seq);
	}

	public void updateStore(AdminPageStoreVO vo) {
		
		sqlSessionTemplate.update("AdminPageStoreDAO.updateStore", vo);
	}
	
	public void deleteStore(int seq) {
		
		sqlSessionTemplate.delete("AdminPageStoreDAO.deleteStore", seq);
	}
	
	public SThreeVO getSThree() {
		
		return sqlSessionTemplate.selectOne("KeyDAO.getSkey");
	}
	
	public AesVO getAes() {
		
		return sqlSessionTemplate.selectOne("KeyDAO.getKey");
	}
}
