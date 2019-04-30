<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.hta.hr.dao.BoardDao"%>
<%@page import="kr.co.hta.board.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>중앙HTA</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <style>
  	.tr{
  		margin-top: 10px;
  	}
  	.check{
  	
  		left:10px;
  	}
  	#no2{
  		margin-top : 10px;	
  	}
  </style>
</head>
<body>
<%
	String menu = "board";
	int pno = Integer.parseInt(request.getParameter("pno")); 
%>
<%@ include file="../common/navigation.jsp" %>
<div class="container">
	<div class="page-header">
		<h1>복원할 글 목록</h1>
	</div>
	<form action="recover3.jsp">
	<table class="table table-condensed table-hover">
		<colgroup>
			<col width="5%">
			<col width="10%">
			<col width="*">
			<col width="15%">
			<col width="10%">
			
		</colgroup>
		<thead>
		<% 
			BoardDao boardDao = new BoardDao();
			ArrayList<Board> boards = boardDao.getRecoverBoards();
		%>
			<tr>
				<th>번호</th>
				<th>복원여부</th>
				<th>제목</th>
				<th>작성자</th>
				<th>등록일</th>
			</tr>
		</thead>
		
		<tbody>
			
			<%
				for(Board board : boards){
			%>
			<tr>
				<td><%= board.getNo() %></td>
				<td><input class="check" type="checkbox" name="recover" value="<%=board.getNo()%>"/></td>
				<td><a href="recover2.jsp?bid=<%= board.getNo() %>&pno=<%=pno%>"><%= board.getTitle() %></a>
				</td>
				
				<td><%= board.getWriter() %></td>
				<td><%= board.getCreateDate() %></td>
			</tr>
			<%
				}
			%>
			
			
		</tbody>
		
	</table>
	
		<div class="text-right">
			<a href="list.jsp?pno=<%=pno%>" class="btn btn-primary">게시판으로 이동</a>
		</div>
		<div class="text-right" id="no2">
		<input type="hidden" name="pno" value=<%=pno %> />
		<input type="submit" class="btn btn-primary" value="복원하기">
		</div>
		</form>
	</div>

</body>
</html>