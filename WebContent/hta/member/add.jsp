<%@page import="kr.co.hta.login.vo.User"%>
<%@page import="kr.co.hta.login.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");
	String email = request.getParameter("email");
	
	UserDao userDao = new UserDao();
	User user = userDao.getUser(id);
	
	if(user == null){
		response.sendRedirect("complete.jsp");
	}
	if(user!=null){
		response.sendRedirect("/hta/member/form.jsp?result=fail");
	}
	
%>