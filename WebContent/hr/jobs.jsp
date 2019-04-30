<%@page import="kr.co.hta.hr.dao.JobDao"%>
<%@page import="kr.co.hta.hr.vo.Job"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>직종조회하기</h1>
	<table border = "1" style="width:70%;">
		<thead>
			<tr>
				<th>직종아이디</th>
				<th>직종이름</th>
				<th>최소급여</th>
				<th>최대급여</th>
			</tr>
		</thead>
		<tbody>
			<%
				JobDao jobdao = new JobDao();
				ArrayList<Job> jobs = jobdao.getAllJobs(); 
				
			%>
		<%
			for(Job job: jobs){
		%>
			<tr>
				<td><%= job.getId() %></td>
				<td> <a href ="searchJobs.jsp?jid=<%= job.getTitle() %>"><%= job.getTitle() %></a></td>
				<td><%= job.getMinSalary() %></td>
				<td><%= job.getMaxSalary() %></td>
			</tr>
		<%
			}
		%>
		</tbody>
	</table>
</body>
</html>