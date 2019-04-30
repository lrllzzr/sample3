package sample3;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns="/bye.hta")
public class MyServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter pw = resp.getWriter();
		pw.println("byebye!!");
	      // 동적 html 컨텐츠를 응답으로 내려보내기
	      pw.println("<!doctype html>");
	      pw.println("<html>");
	      pw.println("<head>");
	      pw.println("<meta charset='utf-8'>");
	      pw.println("<title>환영 페이지<title>");
	      pw.println("</head>");
	      pw.println("<body>");
	      pw.println("<h1>환영합니다.<h1>");
	      
	      Date now = new Date();
	      
	      pw.println("<p> 현재시간 : " + now + "<p>");
	      pw.println("</body>");
	      pw.println("</head>");
	}
}
