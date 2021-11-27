package four.mint.web.admin.used.faq;

import java.util.List;

public interface AdminFaqService {
	void insertfaq(AdminFaqVO vo);
	
	List<AdminFaqVO>getAdminFaqList();
	void faq_delete(int parameter);

	void update_faq(AdminFaqVO faqVO);
	

}
