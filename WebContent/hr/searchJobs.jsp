<%@page import="kr.co.hta.hr.dao.JobDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.hta.hr.vo.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" style="width : 70%">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>급여</th>
			<th>부서아이디</th>
			<th>직종</th>
			<th>매니저아이디</th>
		</tr>
		<%
			JobDao jobDao = new JobDao();
			String title = request.getParameter("jid");
			ArrayList<Employee> employees = jobDao.getAllEmployeesByJobTitle(title);
		%>
		<%
			for(Employee employee : employees){
		%>
		<tr>
			<td><%= employee.getId() %></td>
			<td><%= employee.getFirstName()%><%= employee.getLastName()%></td>
			<td><%= employee.getSalary() %></td>
			<td><%= employee.getDepartmentId() %></td>
			<td><%= employee.getJobId() %></td>
			<td><%= employee.getManagerId() %></td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>