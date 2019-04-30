<%@page import="kr.co.hta.qna.dao.QADao"%>
<%@page import="kr.co.hta.qna.vo.Question"%>
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
	String menu = "qna";
	int pno = 0;
	try{
		pno = Integer.parseInt(request.getParameter("pno"));
	} catch(NumberFormatException e){
		pno=1;
	}
%>
<%@ include file="../common/navigation.jsp" %>
<div class="container">
	<div class="page-header">
		<h1>답변 등록</h1>
	</div>
	
	<table class="table table-bordered">
		<colgroup>
			<col width="10%">
			<col width="23%">
			<col width="10%">
			<col width="24%">
			<col width="10%">
			<col width="23%">
		</colgroup>
		<%
			int questionNo = Integer.parseInt(request.getParameter("qid"));
			QADao qaDao = new QADao();
			Question question = qaDao.getQuestionByNo(questionNo);
		%>
		<tr>
			<th>번호</th>
			<td><%=question.getNo() %></td>
			<th>등록일</th>
			<td colspan="3"><%=question.getCreateDate() %></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%=question.getWriter() %></td>
			<th>구분</th>
			<td><%=question.getGubun() %></td>
			<th>진행상태</th>
			<% 
				if(("답변 대기중").equals(question.getStatus())){
			%>
				<td><span class="label label-default"><%=question.getStatus() %></span></td>
			<%
				} else if(("답변 완료").equals(question.getStatus())){
			%>
				<td><span class="label label-success"><%=question.getStatus() %></span></td>
			<%
				} else if(("질문 취소").equals(question.getStatus())){
			%>
				<td><span class="label label-warning"><%=question.getStatus() %></span></td>
			<% 
				} else{
			%>
				<td><span class="label label-warning"><%=question.getStatus() %></span></td>
			<%
				}
			%>
		</tr>
		<tr>
			<th>제목</th>
			<td colspan="5"><%=question.getTitle() %></td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="5"><%=question.getContents() %></td>
		</tr>
	</table>
	
	<hr />
	
	<div class="well">
		<form method="post" action = "process_answeradd.jsp" >
		<input type="hidden" name="qid" value="<%=question.getNo() %>" />
			<div class="form-group">
				<label>작성자</label>
				<input type="text" name="ansWriter" class="form-control" />
			</div>
			<div class="form-group">
				<label>답변내용</label>
				<textarea rows="7" name="ansContents" class="form-control"></textarea>
			</div>
			<div class="text-right">
				<input type="hidden" name="pno" value="<%=pno %>" />
				<input type="submit" class="btn btn-primary" value="답변등록">
				<input type="reset" class="btn btn-default" value="취소">
			</div>
		</form>
	</div>
</div>
</body>
</html>