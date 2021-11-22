package four.mint.web.admin.page.store.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import four.mint.web.admin.page.store.AdminPageStoreService;
import four.mint.web.admin.page.store.AdminPageStoreVO;
import four.mint.web.common.AesVO;
import four.mint.web.common.SThreeVO;
import four.mint.web.user.board.common.SearchVO;
import four.mint.web.user.store.StoreCategoryBigVO;

@Service("adminPageStoreService")
public class AdminPageStoreServiceImpl implements AdminPageStoreService {
	
	@Autowired
	private AdminPageStoreDAO adminPageStoreDAO;

	@Override
	public List<AdminPageStoreVO> getStoreList() {
		List<AdminPageStoreVO> vo = adminPageStoreDAO.getStoreList();
		
		return vo;
	}

	@Override
	public int getStoreCount() {
		int count = adminPageStoreDAO.getStoreCount();
		
		return count;
	}

	@Override
	public List<StoreCategoryBigVO> getStoreCategoryBig() {
		List<StoreCategoryBigVO> cateCount = adminPageStoreDAO.getStoreCategoryBig();

		return cateCount;
	}

	@Override
	public void insertStore(AdminPageStoreVO vo) {
		
		adminPageStoreDAO.insertStore(vo);
	}

	@Override
	public int getKindCount(SearchVO svo) {
		int list = adminPageStoreDAO.getKindCount(svo);

		return list;
	}

	@Override
	public List<AdminPageStoreVO> getKindList(SearchVO svo) {
		List<AdminPageStoreVO> vo = adminPageStoreDAO.getKindList(svo);
		
		return vo;
	}

	@Override
	public AdminPageStoreVO getStoreOne(int seq) {
		
		return adminPageStoreDAO.getStoreOne(seq);
	}

	@Override
	public void updateStore(AdminPageStoreVO vo) {
		
		adminPageStoreDAO.updateStore(vo);
	}

	@Override
	public void deleteStore(int seq) {
		
		adminPageStoreDAO.deleteStore(seq);
	}
	
	@Override
	public SThreeVO getSkey() {
		SThreeVO newSVO = adminPageStoreDAO.getSThree();
		
		return newSVO;
	}

	@Override
	public AesVO getKey() {
		AesVO newAesVO = adminPageStoreDAO.getAes();
		
		return newAesVO;
	}
}
