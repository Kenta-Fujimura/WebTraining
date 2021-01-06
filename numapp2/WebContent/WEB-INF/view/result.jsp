<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="model.Num"%>
<%
	Num num=(Num)request.getAttribute("num");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
</head>
<body>
	<p><%=num.getOrg()%>inchは<%=num.getAns() %>ｃｍです</p>
	<a href="/numapp/Main">戻る</a>
</body>
</html>