package four.mint.web.admin.qna.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import four.mint.web.admin.qna.AdminAnswerVO;
import four.mint.web.admin.qna.AdminQnaService;
import four.mint.web.admin.qna.AdminQnaVO;

@Service("adminQnaService")
public class AdminQnaServiceImpl implements AdminQnaService {
	
	@Autowired
	private AdminQnaDAO adminQnaDAO;

	@Override
	public List<AdminQnaVO> getAdminQnaList() {
		return adminQnaDAO.getAdminQnaList();
	}

	@Override
	public void qna_delete(int parameter) {
		adminQnaDAO.qna_delete(parameter);		
	}

	@Override
	public void modify_qna(AdminAnswerVO answerVO) {
		adminQnaDAO.modify_qna(answerVO);		
	}

	@Override
	public void update_status(int parameter) {
		adminQnaDAO.update_status(parameter);
		
	}
}
