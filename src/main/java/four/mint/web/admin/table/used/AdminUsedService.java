package four.mint.web.admin.table.used;

import java.util.List;

public interface AdminUsedService {
	List<AdminUsedVO>getAdminUsedList();
	List<AdminUsedVO> getAdminUsedSellList(int status);
	void delete(int market_seq);
}
