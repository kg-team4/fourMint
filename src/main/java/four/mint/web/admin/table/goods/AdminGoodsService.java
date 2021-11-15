package four.mint.web.admin.table.goods;

import java.util.List;

public interface AdminGoodsService {
	void insertstoreboard(AdminGoodsVO vo);
	AdminGoodsVO getAdmin(AdminGoodsVO vo);
	
	List<AdminGoodsVO> getAdminGoodsList();
	

}
