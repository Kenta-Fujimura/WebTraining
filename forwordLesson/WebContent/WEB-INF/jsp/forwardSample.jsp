<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String fortune = (String)request.getAttribute("ft");
   	    String wether = (String)request.getAttribute("wt");
   	    Integer num = (Integer)request.getAttribute("num");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>フォワードサンプル</h1>
<p><%=fortune %></p>
<p><%=wether %></p>
<p><%=num %></p>
</body>
</html>