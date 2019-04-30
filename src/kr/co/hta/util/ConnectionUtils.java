package kr.co.hta.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionUtils {
	public static Connection hrConnection() throws Exception{
		Class.forName("oracle.jdbc.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "hr";
		String password = "1111";
		
		return DriverManager.getConnection(url,id,password);
	}
	public static Connection htaConnection() throws Exception{
		Class.forName("oracle.jdbc.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "hta";
		String password = "zxcv1234";
		
		return DriverManager.getConnection(url,id,password);
	}
}
