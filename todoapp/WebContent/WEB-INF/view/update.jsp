<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*"%>
<%
	Todo todo=(Todo)request.getAttribute("todo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TodoApp</title>
</head>
<body>
<form action="/todoapp/Update" method="Post">
Title:<input type="text" name="title" value="<%=todo.getTitle() %>"><br>
重要度:<select name="importance">
	<option value="1" <%=todo.getImportance()==1? " selected":"" %>>1</option>
	<option value="2" <%=todo.getImportance()==2? " selected":"" %>>2</option>
	<option value="3" <%=todo.getImportance()==3? " selected":"" %>>3</option>
	<option value="4" <%=todo.getImportance()==4? " selected":"" %>>4</option>
	<option value="5" <%=todo.getImportance()==5? " selected":"" %>>5</option>
</select><br>
<input type="hidden" name="id" value="<%=todo.getId() %>"><br>
<button type="submit">更新</button>
</form>
</body>
</html>