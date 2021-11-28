package four.mint.web.admin.qna;

import java.util.List;

public interface AdminQnaService {
	List<AdminQnaVO>getAdminQnaList();

	void qna_delete(int parameter);

	int getQNA();

	void answer(AdminQnaVO aqVO);
}
