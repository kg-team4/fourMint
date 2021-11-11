package four.mint.web.admin.login;

public interface AdminService {
	
	void insertAdmin(AdminVO vo);
	AdminVO getAdmin(AdminVO vo);	
	String getname(AdminVO vo);
}
