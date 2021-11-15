package four.mint.web.admin.used.faq;

import java.util.List;

public interface AdminFaqService {
	void insertfaq(AdminFaqVO vo);
	AdminFaqVO getAdmin(AdminFaqVO vo);
	
	List<AdminFaqVO>getAdminFaqList();
	

}
