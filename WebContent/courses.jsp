<%@page import="sample3.HelloServlet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%--
	 JSP의 구성요소
		 <%@ page %> - JSP 페이지에 대한 설정정보 저장한다.
	 	 <%@ include %> - JSP가 포함할 다른 JSP 페이지를 지정한다.
		 <%@ taglib %> - JSP에서 사용할 태그라이브러리를 지정한다.
		 <% ~ %> - 스클립틀릿(scriptlet)
		  - 자바 코딩 영역을 만든다.
		  - 동적 컨텐츠 생성에 필요한 자바코드 구현
			 1. 요청객체에서 클라이언트가 보낸 정보 획득하기
			 2. 업무로직 호출 -> 데이터 획득
			 3. 획득된 데이터로 동적 컨텐츠 생성
		 <%= ~  %> - 표현식(Expression)
		  - 응답(출력)결과에 값이 포함되게 한다.
		 <%! ~  %> - 선언식(Declaration)
		  - 필드/메서드를 정의할때 사용한다.
--%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과정 안내</title>
</head>
<body>
	<h1>개설 과정 안내</h1>
	<%
		String[] names = {"풀스택 개발자 과정","웹 모바일 개발자 과정"};
	%>
	<h3>모집 중인 과정</h3>
	<ul>
		<li><%= names[0] %></li>
		<li><%= names[1] %></li>
	</ul>
	<p>현재 개설 중인 과정이 없습니다.</p>
	<p> <a href = "home.jsp">홈</a> </p>
</body>
</html>
