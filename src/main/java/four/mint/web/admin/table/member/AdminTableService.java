package four.mint.web.admin.table.member;

import java.util.List;

public interface AdminTableService {
	void inserttablemember(AdminTableVO vo);
	AdminTableVO getAdmin(AdminTableVO vo);
	String getname(AdminTableVO vo);
	
	List<AdminTableVO>getAdminTableList();

}
