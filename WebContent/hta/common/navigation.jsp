<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav class="navbar navbar-default">
	<div class="container">
    	<div class="navbar-header">
    		<a class="navbar-brand" href="/hta/main.jsp">중앙HTA</a>
    	</div>
    	<ul class="nav navbar-nav">
      		<li class="<%=menu.equals("home") ? "active" : ""%>"><a href="/hta/main.jsp">홈</a></li>
      		<li class="<%=menu.equals("course") ? "active" : ""%>"><a href="#">개설과정</a></li>
      		<li class="<%=menu.equals("board") ? "active" : ""%>"><a href="/hta/board/list.jsp?pno=1">자유게시판</a></li>
      		<li class="<%=menu.equals("qna") ? "active" : ""%>"><a href="/hta/qna/list.jsp?pno=1">문의게시판</a></li>
    	</ul>
    	<ul class="nav navbar-nav navbar-right">
      		<li class="<%=menu.equals("member") ? "active" : ""%>"><a href="/hta/member/form.jsp">회원가입</a></li>
      		<li class="<%=menu.equals("login") ? "active" : ""%>"><a href="/hta/login/loginform.jsp">로그인</a></li>
    	</ul>
  	</div>
</nav>