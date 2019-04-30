<%@page import="kr.co.hta.hr.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	// 요청객체에 문자변환방식을 지정한다.
    	request.setCharacterEncoding("utf-8");	// 얘는 request.getParameter 전에  나와야함
    	// 요청객체에서 요청파라미터값 꺼내기
    	String title = request.getParameter("title");
    	String writer = request.getParameter("writer");
    	String contents = request.getParameter("contents");
    	int pno = Integer.parseInt(request.getParameter("pno"));
    	BoardDao boardDao = new BoardDao();
    	boardDao.addNewBoard(title, writer, contents);
    	response.sendRedirect("list.jsp?pno="+pno);
    %>
