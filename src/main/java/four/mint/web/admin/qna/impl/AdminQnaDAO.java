package four.mint.web.admin.qna.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import four.mint.web.admin.qna.AdminAnswerVO;
import four.mint.web.admin.qna.AdminQnaVO;

@Repository
public class AdminQnaDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<AdminQnaVO>getAdminQnaList(){		
		return sqlSessionTemplate.selectList("AdminQnaDAO.getAdminQnaList");
	}

	public void qna_delete(int parameter) {
		sqlSessionTemplate.delete("AdminQnaDAO.qna_delete",parameter);		
	}

	public void modify_qna(AdminAnswerVO answerVO) {
		sqlSessionTemplate.update("AdminQnaDAO.modify_qna",answerVO);
		
	}

	public void update_status(int parameter) {
		sqlSessionTemplate.update("AdminQnaDAO.update_status",parameter);
		
	}
	
	public int getQNA() {
		return sqlSessionTemplate.selectOne("AdminQnaDAO.getQNA");
	}
}
