package kr.co.hta.qna.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.co.hta.qna.vo.Answer;
import kr.co.hta.qna.vo.Question;
import kr.co.hta.util.ConnectionUtils;

public class AnswerDao {
	
	public void addNewAnswer(Answer answer) throws Exception{
		String sql = "insert into hta_answers "
				+ "(ans_no, ans_writer, ans_contents, ques_no) "
				+ "values(qna_seq.nextval, ?,?,?)";
				
		Connection con = ConnectionUtils.htaConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, answer.getWriter());
		pstmt.setString(2, answer.getContents());
		pstmt.setInt(3, answer.getQuestionNo());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
	public Answer getAnswerByQuestion(int questionNo) throws Exception{
		Answer answer = null;
		String sql = "select * from hta_answers "
				+ "where ques_no = ?";
				
		Connection con = ConnectionUtils.htaConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, questionNo);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			answer = new Answer();
			answer.setNo(rs.getInt("ans_no"));
			answer.setWriter(rs.getString("ans_writer"));
			answer.setContents(rs.getString("ans_contents"));
			answer.setCreateDate(rs.getDate("ans_create_date"));
			answer.setQuestionNo(rs.getInt("ques_no"));
		}
		
		return answer;
	}
}
