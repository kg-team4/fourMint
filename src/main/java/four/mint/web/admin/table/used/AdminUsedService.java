package four.mint.web.admin.table.used;

import java.util.List;

public interface AdminUsedService {
	void insertmarketboard(AdminUsedVO vo);
	AdminUsedVO getAdmin(AdminUsedVO vo);	
	
	List<AdminUsedVO>getAdminUsedList();
	
	//삭제
	public void delete(int market_seq)throws Exception;
	List<AdminUsedVO> orderList();

}
