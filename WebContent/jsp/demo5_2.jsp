<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String username = request.getParameter("username");
	String city = request.getParameter("city");
	String gender = request.getParameter("gender");
	String school = request.getParameter("school");
	String[] techs = request.getParameterValues("tech");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요청 파라미터값 확인하기</title>
</head>
<body>
		<h1>요청 파라미터값 확인하기</h1>
		<dl>
			<dt>이름</dt>
			<dd><%=username %></dd>
			<dt>거주지역</dt>
			<dd><%=city %></dd>
			<dt>성별</dt>
			<dd><%=gender %></dd>
			<dt>학력</dt>
			<dd><%=school %></dd>
			<dt>보유기술</dt>
			<dd><%=Arrays.toString(techs)%></dd>
		</dl>
</body>
</html>