<%@page import="kr.co.hta.hr.dao.BoardDao"%>
<%@page import="java.util.ArrayList"%>
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
  </style>
</head>
<body>
<%
	String menu = "board";
	int pno = 0;
	try{
		pno = Integer.parseInt(request.getParameter("pno")); 
		
	} catch(NumberFormatException e){
		pno=1;
		/* response.sendRedirect("list.jsp?pno=1"); */
		return;
	}
%>
<%@ include file="../common/navigation.jsp" %>
<div class="container">
	<div class="page-header">
		<h1>자유게시판</h1>
	</div>
	
	<table class="table table-condensed table-hover">
		<colgroup>
			<col width="10%">
			<col width="*">
			<col width="15%">
			<col width="10%">
			<col width="10%">
			
		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>좋아요</th>
				<th>등록일</th>
			</tr>
		</thead>
		<tbody>
			<% 
				BoardDao boardDao = new BoardDao();
				int begin = (pno -1) *10 +1;
				int end = pno*10;
				ArrayList<Board> boardsByRange = boardDao.getBoardsByRange(begin, end);
			%>
			<%
				for(Board board : boardsByRange){
			%>
			<tr>
				<td><%= board.getNo() %></td>
				<td><a href="detail.jsp?bid=<%= board.getNo() %>&pno=<%=pno%>"><%= board.getTitle() %></a></td>
				<td><%= board.getWriter() %></td>
				<td><%= board.getLikes() %></td>
				<td><%= board.getCreateDate() %></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
	
	<%
		int totalCount = boardDao.getBoardsCount();
		int totalPagesCount = (int)Math.ceil((double)totalCount/10);
	%>
	<div class="text-center">
		<ul class="pagination">
			<%
				for(int i=1; i<=totalPagesCount; i++){
			%>
				<li class="<%=pno==i ? "active" : "" %>"><a href="list.jsp?pno=<%=i %>"><%=i %></a></li>
			<%
				}
			%>
		</ul>	
	</div>
	<div class="text-right">
		<a href="form.jsp?pno=<%=pno%> " class="btn btn-primary">새 글쓰기</a>
	</div>
	<div class="tr">
		<div class="text-right">
			<a href="recover.jsp?pno=<%=pno%>" class="btn btn-primary">글 복원하기</a>
		</div>
	</div>

</div>
</body>
</html>