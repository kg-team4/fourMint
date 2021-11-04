package four.mint.web.user.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import four.mint.web.user.UserVO;

@Repository
public class UserDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void insertUser(UserVO vo) {
		System.out.println("====> member TABLE INSERT one member");
		sqlSessionTemplate.insert("UserDAO.insertUser", vo);
	}
	
	public UserVO getUser(UserVO vo) {
		System.out.println("====> member TABLE SELECT one member");
		
		return (UserVO)sqlSessionTemplate.selectOne("UserDAO.getUser", vo);
	}
	
	public String getAddress1(UserVO vo) {
		System.out.println("====> member TABLE SELECT address1");
		
		return sqlSessionTemplate.selectOne("UserDAO.getAddress1", vo);
	}
	
	public String getAddress2(UserVO vo) {
		System.out.println("====> member TABLE SELECT address2");
		
		return sqlSessionTemplate.selectOne("UserDAO.getAddress2", vo);
	}
	
	public String getAddress3(UserVO vo) {
		System.out.println("====> member TABLE SELECT address3");
		
		return sqlSessionTemplate.selectOne("UserDAO.getAddress3", vo);
	}
}
