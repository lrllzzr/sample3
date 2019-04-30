<%@page import="kr.co.hta.qna.dao.AnswerDao"%>
<%@page import="kr.co.hta.qna.vo.Answer"%>
<%@page import="kr.co.hta.qna.vo.Question"%>
<%@page import="kr.co.hta.qna.dao.QADao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	int questionNo = Integer.parseInt(request.getParameter("qid"));
	int pno = Integer.parseInt(request.getParameter("pno"));
	String ansWriter = request.getParameter("ansWriter");
	String ansContents = request.getParameter("ansContents");
	
	QADao qaDao = new QADao();
	Answer answer = new Answer();

	AnswerDao answerDao = new AnswerDao();
	Question question = qaDao.getQuestionByNo(questionNo);
	
	
	answer.setWriter(ansWriter);
	answer.setContents(ansContents);
	answer.setQuestionNo(questionNo);
	
	question.setStatus("답변 완료");
	question.setAnswer(answer);

	answerDao.addNewAnswer(answer);
	qaDao.updateQuestion(question);
	
	response.sendRedirect("detail.jsp?qid="+questionNo+"&pno="+pno);		
%>