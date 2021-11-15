package four.mint.web.admin.table.used;

import java.util.List;

public interface AdminUsedService {
	void insertmarketboard(AdminUsedVO vo);
	AdminUsedVO getAdmin(AdminUsedVO vo);
	
	
	List<AdminUsedVO>getAdminUsedList();

}
