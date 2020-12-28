<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>結果</title>
</head>
<body>
<ol type="1">
<%
	String names[] ={"足立","石川","宇佐美","大野"};
	for(int i = 0;i<names.length;i++){
		out.println("<li>"+names[i]+"</li>");
	}
%>
</ol>
</body>
</html>