package four.mint.web.user.store.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import four.mint.web.user.board.common.PageVO;
import four.mint.web.user.store.StoreCategoryBigVO;
import four.mint.web.user.store.StoreService;
import four.mint.web.user.store.StoreVO;

@Service("storeService")
public class StoreServiceImpl implements StoreService {
	
	@Autowired
	private StoreDAO storeDao;

	@Override
	public List<StoreVO> getStoreList(HttpServletRequest request, PageVO vo) {
		List<StoreVO> newVo = storeDao.getStoreList(request, vo);
		
		return newVo;
	}

	@Override
	public int getStoreCount() {
		int page = storeDao.getStoreCount();
		
		return page;
	}
	
	@Override
	public List<StoreCategoryBigVO> getStoreCategoryBig() {
		List<StoreCategoryBigVO> newCaVO = storeDao.getStoreCategoryBig();
		
		return newCaVO;
	}
	
	@Override
	public void insertStore(StoreVO vo) {
		storeDao.insertStore(vo);
		
	}

	

}
