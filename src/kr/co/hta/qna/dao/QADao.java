package kr.co.hta.qna.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import kr.co.hta.qna.vo.Question;
import kr.co.hta.util.ConnectionUtils;

public class QADao {
	
	public ArrayList<Question> selectAllQuestions() throws Exception {
	ArrayList<Question> questions = new ArrayList<Question>();
	String sql = "select * from hta_questions "
			+ "order by ques_no desc";
	
	Connection con = ConnectionUtils.htaConnection();
	PreparedStatement pstmt = con.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
	while(rs.next()) {
		Question question = new Question();
		question.setNo(rs.getInt("ques_no"));
		question.setGubun(rs.getString("ques_gubun"));
		question.setTitle(rs.getString("ques_title"));
		question.setWriter(rs.getString("ques_writer"));
		question.setStatus(rs.getString("ques_status"));
		question.setContents(rs.getString("ques_contents"));
		question.setCreateDate(rs.getDate("ques_create_date"));
		
		questions.add(question);
	}
	rs.close();
	pstmt.close();
	con.close();
	
	return questions;
	}
	
	public Question getQuestionByNo(int questionNo) throws Exception{
		Question question = null;
		String sql = "select * from hta_questions "
				+ "where ques_no = ?"
				+ "order by ques_no desc";
		
		Connection con = ConnectionUtils.htaConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, questionNo);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			question = new Question();
			question.setNo(rs.getInt("ques_no"));
			question.setGubun(rs.getString("ques_gubun"));
			question.setTitle(rs.getString("ques_title"));
			question.setWriter(rs.getString("ques_writer"));
			question.setStatus(rs.getString("ques_status"));
			question.setContents(rs.getString("ques_contents"));
			question.setCreateDate(rs.getDate("ques_create_date"));
			
		}
		rs.close();
		pstmt.close();
		con.close();
		
		return question;
	}
	public void addNewQuestion(Question question) throws Exception{
		String sql = "insert into hta_questions "
				+ "(ques_no, ques_gubun, ques_title, ques_writer,  "
				+ "ques_contents) "
				+ "values(qna_seq.nextval, ?,?,?,?)";
				
		Connection con = ConnectionUtils.htaConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, question.getGubun());
		pstmt.setString(2, question.getTitle());
		pstmt.setString(3, question.getWriter());
		pstmt.setString(4, question.getContents());
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
		
	}
	
	public void updateQuestion(Question question) throws Exception{
		String sql = "update hta_questions "
				+ "set ques_status = ? "
				+ "where ques_no = ?";
				
		Connection con = ConnectionUtils.htaConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, question.getStatus());
		pstmt.setInt(2, question.getNo());
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
	public ArrayList<Question> getQuestionsByRange(int begin, int end) throws Exception{
		ArrayList<Question> questions = new ArrayList<Question>();
		String sql = "select * " + 
				"from (select row_number() over (order by ques_no desc) row_no, A.* " + 
					  "from hta_questions A) " + 
				"where row_no>=? and row_no<=?";
		
		Connection con = ConnectionUtils.htaConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, begin);
		pstmt.setInt(2, end);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Question question = new Question();
			question.setNo(rs.getInt("ques_no"));
			question.setGubun(rs.getString("ques_gubun"));
			question.setTitle(rs.getString("ques_title"));
			question.setWriter(rs.getString("ques_writer"));
			question.setStatus(rs.getString("ques_status"));
			question.setContents(rs.getString("ques_contents"));
			question.setCreateDate(rs.getDate("ques_create_date"));
			questions.add(question);
			
		}
		rs.close();
		pstmt.close();
		con.close();
		
		return questions;
	}
	
	public int countAllQuestions() throws Exception{
		int totalCount = 0;
		String sql = "select count(*) as cnt "
				+ "from hta_questions ";
		
		Connection con = ConnectionUtils.htaConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		rs.next();
		totalCount = rs.getInt("cnt");
		
		rs.close();
		pstmt.close();
		con.close();
		
		return totalCount;
	}
	
}
