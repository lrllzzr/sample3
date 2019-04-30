<%@page import="kr.co.hta.board.vo.Board"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.hta.hr.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	int pno = Integer.parseInt(request.getParameter("pno"));
	String[] boardNums = request.getParameterValues("recover");
 	for(int i=0; i<boardNums.length; i++ ){
			BoardDao boardDao = new BoardDao();
			boardDao.recoverBoards(Integer.parseInt(boardNums[i]));
	}
	response.sendRedirect("recover.jsp?pno="+pno);
%>