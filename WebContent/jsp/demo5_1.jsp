<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요청객체의 주요 메소드 연습하기</title>
</head>
<body>
	<h1>요청객체의 주요 메소드 연습하기</h1>
	
	<form method="get" action="demo5_2.jsp">
		<label for="">이름</label><br />
		<input type="text" name ="username"/><br />
		<label for="거주지역"></label><br />
		<select name="city" id="" > <%-- option은 select에만 name을 적어주면 된다. --%>
			<option disabled="disabled">지역선택</option>
			<option value="seoul">서울</option>
			<option value="kyunggi">경기</option>
			<option value="incheon">인천</option>
			<option value="pusan">부산</option>
		</select><br />
		<p>
			<label for="">성별</label>
			<input type="radio" name="gender" value="male" />남성		
			<input type="radio" name="gender" value="female" />여성
		</p>
		<p>
			<label for="">학력</label>
			<input type="radio" name="school" value="초졸" />초등학교졸업		
			<input type="radio" name="school" value="중졸" />중학교졸업		
			<input type="radio" name="school" value="고졸" />고등학교졸업		
			<input type="radio" name="school" value="초대졸" />전문대학졸업		
			<input type="radio" name="school" value="대졸" checked="checked" />대학교졸업<br />
		</p>
		<p>
			<label for="">보유기술</label><br />
			<input type="checkbox" name="tech" value="자바" />자바
			<input type="checkbox" name="tech" value="python" />파이썬
			<input type="checkbox" name="tech" value="db" />데이터베이스
			<input type="checkbox" name="tech" value="datascience" />데이터분석
			<input type="checkbox" name="tech" value="bigdata" />빅데이터
			<input type="checkbox" name="tech" value="iot" />사물인터넷<br />
			
			<input type="submit" value="제출"/>
		</p>	
	</form>
</body>
</html>