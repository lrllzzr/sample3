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
		<h1>글 수정</h1>
	</div>
		<%
			BoardDao boardDao = new BoardDao();
			int boardNo = Integer.parseInt(request.getParameter("bid"));
			Board board = boardDao.getBoardByNo(boardNo);
		%>
	<div class="well">
		<form method = "post" action = "update.jsp">
				<input type="hidden" name="bid" value="<%=board.getNo() %>" />
				<input type="hidden" name="pno" value="<%=pno%>"/>
<%-- 		<div class="form-group">
				<label>번호</label>
				<input type="text" class="form-control" value="<%= board.getNo()%>" readonly="readonly" />
			</div>		
 --%>		<div class="form-group">
				<label>제목</label>
				<input type="text" class="form-control" value="<%=board.getTitle() %>" name ="title" />
			</div>
			<div class="form-group">
				<label>작성자</label>
				<input type="text" class="form-control" value="<%=board.getWriter() %>"  name ="writer"/>
			</div>
			<div class="form-group">
				<label>내용</label>
				<textarea rows="7" class="form-control"  name ="contents"><%=board.getContents() %></textarea>
			</div>
			<div class="text-right">
				<input type="submit" class="btn btn-primary" value="수정">
				<input type="reset" class="btn btn-default" value="취소">
			</div>
		</form>
	</div>
</div>
</body>
</html>