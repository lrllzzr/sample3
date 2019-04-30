<%@page import="kr.co.hta.util.DateUtils"%>
<%@page import="java.util.ArrayList"%>
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
		<h1>문의 게시판</h1>
	</div>
	
	<table class="table table-condensed table-hover">
		<colgroup>
			<col width="5%">
			<col width="8%">
			<col width="*">
			<col width="15%">
			<col width="10%">
			<col width="10%">
		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>구분</th>
				<th>제목</th>
				<th>작성자</th>
				<th>진행상태</th>
				<th>등록일</th>
			</tr>
		</thead>
		<tbody>
			<%
				QADao qaDao = new QADao();
				int begin = (pno-1)*10 +1;
				int end = pno*10;
				ArrayList<Question> questions = qaDao.getQuestionsByRange(begin, end);
			%>
			<%
				for(Question question : questions){
			%>
			<tr>
				<td><%=question.getNo()%></td>
				<td><span class="text-primary"><%=question.getGubun() %></span></td>
				<td><a href="detail.jsp?qid=<%=question.getNo()%>&pno=<%=pno %>"><%=question.getTitle()%></a></td>
				<td><%=question.getWriter()%></td>
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
				<td><%=question.getCreateDate() %></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
		<%
			int totalCount = qaDao.countAllQuestions();
			int questionPages= (int)Math.ceil((double)totalCount/10);
		%>
		<div class="text-center">
		<ul class="pagination">
			<%
				for(int i=1; i<=questionPages; i++)	{
			%>
					<li class="<%=pno==i ? "active" : "" %>"><a href="list.jsp?pno=<%=i %>"><%=i %></a></li>
			<%
				}
			%>
		</ul>	
	</div>
	<div class="text-right">
		<a href="form.jsp?pno=<%=pno %>" class="btn btn-primary">질문쓰기</a>
	</div>
</div>
</body>
</html>