package four.mint.web.admin.login;

import java.util.List;

import four.mint.web.admin.transactionhistory.AdminTransactionHistoryVO;

public interface AdminService {
	
	void insertAdmin(AdminVO vo);
	AdminVO getAdmin(AdminVO vo);	
	String getname(AdminVO vo);
	
}
