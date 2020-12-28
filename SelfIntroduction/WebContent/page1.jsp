<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>START</title>
</head>
<body>
	<h1>名前入力</h1>
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<form action="/SelfIntroduction/page2.jsp" method="post">
		名前を入力してください<input type="text" name="name"><br> 
		<input type="submit" value="送信">
	</form>
</body>
</html>