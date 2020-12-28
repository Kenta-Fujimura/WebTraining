<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>結果</title>
</head>
<body>
<table border="1">
<caption>九九表</caption>
<%
for(int i=1;i<10;i++){
	out.println("<tr>");
	for(int j=1;j<10;j++){
		out.println("<td>" + (i * j) +"</td>");
	}
	out.println("</tr>");
}
%>
</table>
</body>
</html>