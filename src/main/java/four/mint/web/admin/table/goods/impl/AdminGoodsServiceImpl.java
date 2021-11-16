package four.mint.web.admin.table.goods.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import four.mint.web.admin.table.goods.AdminGoodsService;
import four.mint.web.admin.table.goods.AdminGoodsVO;

@Service("adminGoodsService")
public class AdminGoodsServiceImpl implements AdminGoodsService {
	
	@Autowired
	private AdminGoodsDAO adminGoodsDao;

	@Override
	public void insertstoreboard(AdminGoodsVO vo) {
		adminGoodsDao.insertAdminGoods(vo);
		
	}

	@Override
	public AdminGoodsVO getAdmin(AdminGoodsVO vo) {
		AdminGoodsVO newVo = adminGoodsDao.getAdminGoods(vo);
		return null;
	}

	@Override
	public List<AdminGoodsVO> getAdminGoodsList() {
		
		return adminGoodsDao.getAdminGoodsList();
	}

}
