package kr.co.hta.hr.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import kr.co.hta.board.vo.Board;
import kr.co.hta.util.ConnectionUtils;

public class BoardDao {
	// 모든 게시글 갯수 조회 기능
	public int getBoardsCount()	throws Exception{
		int totalCount = 0;
		
		String sql = "select count(*) as cnt "
				+ "from hta_boards "
				+ "where board_used_yn = 'Y'";
		Connection con = ConnectionUtils.htaConnection();
		PreparedStatement pstmt =  con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		totalCount = rs.getInt("cnt");
		
		rs.close();
		pstmt.close();
		con.close();
		
		return totalCount;
	}
	
	// 모든 게시글 조회 기능
	public ArrayList<Board> getAllBoards() throws Exception{
		ArrayList<Board> boards = new ArrayList<Board>();
		
		String sql = "select * from hta_boards "
				+ "where board_used_yn = 'Y'";
		
		Connection con = ConnectionUtils.htaConnection();
		PreparedStatement pstmt =  con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Board board = new Board();
			board.setNo(rs.getInt("board_no"));
			board.setTitle(rs.getString("board_title"));
			board.setWriter(rs.getString("board_writer"));
			board.setContents(rs.getString("board_contents"));
			board.setLikes(rs.getInt("board_likes"));
			board.setUsed(rs.getString("board_used_yn"));
			board.setCreateDate(rs.getDate("board_create_date"));
			
			boards.add(board);
		}
		
		return boards;
	}
	public ArrayList<Board> getRecoverBoards() throws Exception{
		ArrayList<Board> boards = new ArrayList<Board>();
		
		String sql = "select * "
				+ "from hta_boards "
				+ "where board_used_yn = 'N' "
				+ "order by board_no desc";
		
		Connection con = ConnectionUtils.htaConnection();
		PreparedStatement pstmt =  con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Board board = new Board();
			board.setNo(rs.getInt("board_no"));
			board.setTitle(rs.getString("board_title"));
			board.setWriter(rs.getString("board_writer"));
			board.setContents(rs.getString("board_contents"));
			board.setLikes(rs.getInt("board_likes"));
			board.setUsed(rs.getString("board_used_yn"));
			board.setCreateDate(rs.getDate("board_create_date"));
			
			boards.add(board);
		}
		
		return boards;
	}
	public void recoverBoards(int boardNo) throws Exception{
		String sql = "update hta_boards "
				+ "set board_used_yn = 'Y' "
				+ "where board_no = ?";
		
		Connection con = ConnectionUtils.htaConnection();
		PreparedStatement pstmt =  con.prepareStatement(sql);
		pstmt.setInt(1, boardNo);
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
	// 새로운 게시글 등록 기능
	public void addNewBoard(String title, String writer, String contents) throws Exception{
		String sql = "insert into hta_boards "
				+ "(board_no, board_title, board_writer, board_contents) "
				+ "values(board_seq.nextval, ?,?,?)";
		
		Connection con = ConnectionUtils.htaConnection();
		PreparedStatement pstmt =  con.prepareStatement(sql);
		pstmt.setString(1, title);
		pstmt.setString(2, writer);
		pstmt.setString(3, contents);
		
		pstmt.executeUpdate();
		pstmt.close();
		con.close();
		
	}
	// 게시글 정보 상세 조회 기능
	public Board getBoardByNo(int boardNo) throws Exception{
			Board board = null;
			String sql = "select * "
					+ "from hta_boards "
					+ "where board_used_yn = 'Y' "
					+ "and board_no = ? "
					+ "order by board_no desc";
			
			Connection con = ConnectionUtils.htaConnection();
			PreparedStatement pstmt =  con.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				board = new Board();
				board.setNo(rs.getInt("board_no"));
				board.setTitle(rs.getString("board_title"));
				board.setWriter(rs.getString("board_writer"));
				board.setContents(rs.getString("board_contents"));
				board.setLikes(rs.getInt("board_likes"));
				board.setUsed(rs.getString("board_used_yn"));
				board.setCreateDate(rs.getDate("board_create_date"));
			}
			
			return board;
	}
	// 게시글 삭제 기능
//	public void deleteBoard(int boardNo) throws Exception{
//		String sql = "update hta_boards "
//				+ "set board_used_yn = 'N' "
//				+ "where board_no = ?";
//		
//		Connection con = ConnectionUtils.htaConnection();
//		PreparedStatement pstmt =  con.prepareStatement(sql);
//		pstmt.setInt(1, boardNo);
//		pstmt.executeUpdate();
//		
//		pstmt.close();
//		con.close();
//	}
	public void liveBoard(int boardNo) throws Exception{
		String sql = "update hta_boards "
				+ "set board_used_yn = 'Y' "
				+ "where board_no = ?";
		
		Connection con = ConnectionUtils.htaConnection();
		PreparedStatement pstmt =  con.prepareStatement(sql);
		pstmt.setInt(1, boardNo);
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
	// 게시글 변경 기능
	public void updateBoard(Board board) throws Exception{
		String sql = "update hta_boards "
				+ "set board_title = ?, "
				+ "board_writer = ?, "
				+ "board_contents = ?, "
				+ "board_likes = ?, "
				+ "board_used_yn = ? "
				+ "where board_no = ?";
		
		Connection con = ConnectionUtils.htaConnection();
		PreparedStatement pstmt =  con.prepareStatement(sql);
		pstmt.setString(1, board.getTitle());
		pstmt.setString(2, board.getWriter());
		pstmt.setString(3, board.getContents());
		pstmt.setInt(4, board.getLikes());
		pstmt.setString(5, board.getUsed());
		pstmt.setInt(6, board.getNo());
	
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	public ArrayList<Board> getBoardsByRange(int begin, int end) throws Exception{
		ArrayList<Board> boards = new ArrayList<Board>();
		
		String sql = "select * "
				+ "from (select row_number() over (order by board_no desc) as row_no, A.* "
				+ "from hta_boards A "
				+ "where board_used_yn = 'Y') "
				+ "where row_no >=? and row_no <=?";
		
		Connection con = ConnectionUtils.htaConnection();
		PreparedStatement pstmt =  con.prepareStatement(sql);
		pstmt.setInt(1, begin);
		pstmt.setInt(2, end);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Board board = new Board();
			board.setNo(rs.getInt("board_no"));
			board.setTitle(rs.getString("board_title"));
			board.setWriter(rs.getString("board_writer"));
			board.setContents(rs.getString("board_contents"));
			board.setLikes(rs.getInt("board_likes"));
			board.setUsed(rs.getString("board_used_yn"));
			board.setCreateDate(rs.getDate("board_create_date"));
			
			boards.add(board);
		}
		return boards;
	}
}
