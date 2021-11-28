package four.mint.web.admin.qna;

import java.util.List;

public interface AdminQnaService {
	List<AdminQnaVO>getAdminQnaList();

	void qna_delete(int parameter);

	void modify_qna(AdminAnswerVO answerVO);

	void update_status(int paramter);


}
