package four.spring.web.custom;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class MyPostgresConnectionTest {

	private static final String DRIVER = "org.postgresql.Driver";
	private static final String URL = "jdbc:postgresql://localhost:5432/postgres";
	private static final String ID = "postgres";
	private static final String PASS = "postgres";
	
	@Test
	public void testConnection() throws Exception {
		Class.forName(DRIVER);
		try(Connection con = DriverManager.getConnection(URL, ID, PASS)) {
			System.out.println(con);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
