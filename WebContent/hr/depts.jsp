<%@page import="kr.co.hta.hr.vo.Department"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.hta.hr.dao.DepartmentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인사관리</title>
</head>
<body>
	<h1>전체 부서 목록</h1>
	<h2><a href="home.jsp">홈</a></h2>
	<% DepartmentDao deptDao = new DepartmentDao();
		ArrayList<Department> departments = deptDao.selectAllDepartments();
		
	%>
	<table border="1" style="width: 70%;">
		<thead>
			<tr>
				<th>아이디</th>
				<th>부서명</th>
				<th>담당자 아이디</th>
				<th>소재지 아이디</th>
			</tr>
		</thead>
		<tbody>
		<%
			for(Department dept : departments){
		%>
			<tr>
				<td><%= dept.getId() %></td>
				<td><a href="search.jsp?did=<%=dept.getId() %>"><%= dept.getName() %></a></td>
				<td><%= dept.getManagerId() %></td>
				<td><%= dept.getLocationName() %></td>
		<%
			}
		%>
		</tbody>
	</table>
</body>
</html>