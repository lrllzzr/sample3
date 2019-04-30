<%@page import="kr.co.hta.qna.dao.QADao"%>
<%@page import="kr.co.hta.qna.vo.Question"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	int questionNo = Integer.parseInt(request.getParameter("qid"));	
	QADao qaDao = new QADao();
	Question question = qaDao.getQuestionByNo(questionNo);
	
	question.setStatus("질문 취소");
	qaDao.updateQuestion(question);
	
	response.sendRedirect("list.jsp");
%>