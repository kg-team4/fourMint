package four.mint.web.admin.table.used;

import java.util.List;

public interface AdminUsedService {
	List<AdminUsedVO>getAdminUsedList();
	List<AdminUsedVO> getAdminUsedSellList(int status);
	
	//삭제
	public void delete(int market_seq)throws Exception;
	List<AdminUsedVO> orderList();

}
