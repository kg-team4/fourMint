package four.mint.web.user.impl;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import four.mint.web.user.UserVO;

@Repository
public class UserDAO {

	@Autowired
	private SqlSessionFactory sqlFactory;
	
	public void insertUser(UserVO vo) {
//		System.out.println("====> member TABLE INSERT one member");
//		sqlSessionTemplate.insert("UserDAO.insertUser", vo);
		System.out.println(sqlFactory);
	}
}
