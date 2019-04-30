<%@page import="kr.co.hta.hr.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	int boardNo = Integer.parseInt(request.getParameter("bid"));
	int pno = Integer.parseInt(request.getParameter("pno"));
	BoardDao boardDao = new BoardDao();
	boardDao.recoverBoards(boardNo);
	
	response.sendRedirect("recover.jsp?pno="+pno);
%>