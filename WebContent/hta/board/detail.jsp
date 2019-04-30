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
</head>
<body>
<%
	String menu = "board";
	int pno = Integer.parseInt(request.getParameter("pno")); 
%>
<%@ include file="../common/navigation.jsp" %>
<div class="container">
	<div class="page-header">
		<h1>글 내용</h1>
	</div>
	
	<table class="table table-bordered">
		<colgroup>
			<col width="15%">
			<col width="35%">
			<col width="15%">
			<col width="35%">
		</colgroup>
		<%
			// "detail.jsp?bid=글번호"의 형태로 요청된 주소에서 글번호 가져오기
			int no = Integer.parseInt(request.getParameter("bid"));
			BoardDao boardDao = new BoardDao();
			Board board = boardDao.getBoardByNo(no);
		%>
		<tr>
			<th>번호</th>
			<td><%= board.getNo() %></td>
			<th>등록일</th>
			<td><%= board.getCreateDate() %></td>
		</tr>
		<tr>
			<th>제목</th>
			<td colspan="3"><%= board.getTitle() %></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%=board.getWriter() %></td>
			<th>추천수</th>
			<td><%=board.getLikes() %></td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="3">
				<%= board.getContents() %>
			</td>
		</tr>
	</table>
	
	<div>
		<a href="modifyform.jsp?bid=<%= board.getNo() %>&pno=<%=pno %>" class="btn btn-warning">수정</a>
		<a href="delete.jsp?bid=<%= board.getNo() %>&pno=<%=pno %>" class="btn btn-danger">삭제</a>
		<a href="likes.jsp?bid=<%= board.getNo() %>&pno=<%=pno %>" class="btn btn-success">좋아요</a>
		
		<a href="list.jsp?pno=<%=pno %>" class="btn btn-primary pull-right">목록</a>
	</div>
</div>
</body>
</html>