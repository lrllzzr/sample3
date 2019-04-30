<%@page import="kr.co.hta.qna.dao.AnswerDao"%>
<%@page import="kr.co.hta.qna.vo.Answer"%>
<%@page import="kr.co.hta.qna.vo.Question"%>
<%@page import="kr.co.hta.qna.dao.QADao"%>
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
		<h1>질문 및 답변보기</h1>
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
	<%
		if("답변 대기중".equals(question.getStatus())){
	%>	
		<div>
			<a href="process_cancel.jsp?qid=<%=question.getNo() %>&pno=<%=pno %>" class="btn btn-danger">질문취소</a>
			<a href="answerform.jsp?qid=<%=question.getNo() %>&pno=<%=pno %>" class="btn btn-success">답변달기</a>
		</div>
	<%
		}
	%>
	<%
		if(question.getStatus().equals("답변 완료")){
	%>	
		<div class="panel panel-danger panel-body">
	<%
		AnswerDao answerDao = new AnswerDao();
		Answer answer = answerDao.getAnswerByQuestion(questionNo);
	%>
			<table class="table">
				<colgroup>
					<col width="10%">
					<col width="*">
				</colgroup>
				<tr>
					<th>답변일</th>
					<td><%=answer.getCreateDate() %></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><%=answer.getWriter() %></td>
				</tr>
				<tr>
					<th>답변내용</th>
					<td>
					<%=answer.getContents() %>
					</td>
				</tr>
			</table>
		</div>
	<%
		}
	%>
	<div>
		<a href="list.jsp?pno=<%=pno %>" class="btn btn-primary pull-right">목록</a>
	</div>
</div>
</body>
</html>