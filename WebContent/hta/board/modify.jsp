<%@page import="kr.co.hta.board.vo.Board"%>
<%@page import="kr.co.hta.hr.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	int boardNo = Integer.parseInt(request.getParameter("bid"));
	int pno = Integer.parseInt(request.getParameter("pno"));
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String contents = request.getParameter("contents");
	
	BoardDao boardDao = new BoardDao();
	Board board = boardDao.getBoardByNo(boardNo);
	
	board.setTitle(title);
	board.setWriter(writer);
	board.setContents(contents);
	boardDao.updateBoard(board);
	response.sendRedirect("list.jsp?pno="+pno);
%>