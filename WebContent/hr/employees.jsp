<%@page import="kr.co.hta.hr.dao.EmployeeDao"%>
<%@page import="kr.co.hta.hr.vo.Employee"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 조회</title>
</head>
<body>
	<%
		EmployeeDao empDao = new EmployeeDao();
		ArrayList<Employee> employees = new ArrayList<Employee>();
		employees = empDao.getAllEmployees();
	%>
		<table border="1" style= "width:70%;">
			<thead>
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>급여</th>
					<th>부서아이디</th>
					<th>직종</th>
					<th>매니저아이디</th>
				</tr>
			</thead>
			<tbody>
			<%
			for(Employee employee : employees){
				%>
					<tr>
						<td><%= employee.getId() %></td>
						<td><%= employee.getFirstName()%> <%= employee.getLastName() %></td>
						<td><%= employee.getSalary() %></td>
						<td><%= employee.getDepartmentId() %></td>
						<td><%= employee.getJobId() %></td>
						<td><%= employee.getManagerId() %></td>
					</tr>
				<%		
					}
				%>
			</tbody>
		</table>			
</body>
</html>