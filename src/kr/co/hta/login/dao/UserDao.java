package kr.co.hta.login.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.co.hta.login.vo.User;
import kr.co.hta.util.ConnectionUtils;


public class UserDao {
	
	public void insertMember(User user) throws Exception{
		String sql = "insert into hta_users "
				+ "(member_id, member_name, member_pwd, member_email) "
				+ "values(?,?,?,?)";
				
		Connection con = ConnectionUtils.htaConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, user.getId());
		pstmt.setString(2, user.getName());
		pstmt.setString(3, user.getPwd());
		pstmt.setString(4, user.getEmail());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	public User getUser(String userId) throws Exception{
		User user = null;
		String sql = "select * from hta_users "
				+ "where member_id = ?";
				
				
		Connection con = ConnectionUtils.htaConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, userId);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			user = new User();
			user.setId(rs.getString("member_id"));
			user.setName(rs.getString("member_name"));
			user.setPwd(rs.getString("member_pwd"));
			user.setEmail(rs.getString("member_email"));
			user.setUsed(rs.getString("member_used_yn"));
			user.setCreateDdate(rs.getDate("member_create_date"));
			
		}
		pstmt.close();
		con.close();
		
		return user;
		
	}
}
