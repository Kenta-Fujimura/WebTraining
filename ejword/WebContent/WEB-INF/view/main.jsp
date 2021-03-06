<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*,java.util.*"%>
<%
String searchWord=(String)request.getAttribute("searchWord");
searchWord=searchWord ==null? "":searchWord;
String mode=(String)request.getAttribute("mode");
mode=mode == null? "":mode;
List<Word> list=(List<Word>)request.getAttribute("list");
Integer total=(Integer)request.getAttribute("total");
Integer limit=(Integer)request.getAttribute("limit");
Integer pageNo=(Integer)request.getAttribute("pageNo");
String pagination=(String)request.getAttribute("pagination");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EJWord</title><!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
<style>
.container{
min-height:calc(100vh - 70px);
}
form{
margin:20px auto;
}
input,select{
margin-right:5px;
}
.pager{
text-align:left;
}
.paginationBox{
text-align:center;
}
footer{
height:40px;
background:#347ab7;
color:white;
text-align:center;
line-height:40px;
margin-top:30px;
}
</style>
</head>
<body>
<div class="container">
<form action="/ejword/main" method="get" class="form-inline">
<input type="text" name="searchWord" value="<%=searchWord%>" class="form-control" placeholder="検索語を入力" required>
<select name="mode" class="form-control">
<option value="startsWith"<%if(mode.equals("statsWith")) out.print(" selected"); %>>で始まる</option>
<option value="contains"<%if(mode.equals("contains")) out.print(" selected"); %>>含む</option>
<option value="endsWith"<%if(mode.equals("endsWith")) out.print(" selected"); %>>で終わる</option>
<option value="match"<%if(mode.equals("match")) out.print(" selected"); %>>一致する</option>
</select>
<button type="submit" class="btn btn-primary">検索</button>
</form>

<% if(list !=null && list.size() > 0){ %>
<%-- 件数表示部分作成 --%>

<% if(total <= limit){ %>
<p>全<%=total %>件</p>
<%}else{ %>
<%--ページ番号を利用して何件から何件を表示しているのかを表示する --%>
		<p>全<%=total %>件中 <%=(pageNo-1)*limit+1 %>~<%=pageNo*limit > total? total:pageNo*limit %>件を表示</p>
<%--ページ番号が１より大きかったら前へのリンクを表示 --%>
		<ul class="pager">
		<%if(pageNo > 1) {%>
		  <li><a href="/ejword/main?searchWord=<%=searchWord %>&mode=<%=mode %>&page=<%=pageNo-1%>"><span aria-hidden="true">&larr;</span>前へ</a></li>

		<%} %>
		<%--件数が全件数に届かないときは次へのリンクを表示 --%>
		<%if(pageNo*limit < total) {%>
		<li><a href="/ejword/main?searchWord=<%=searchWord %>&mode=<%=mode %>&page=<%=pageNo+1%>">次へ<span aria-hidden="true">&rarr;</a></li>

		<%} %>
		</ul>
<%} %>

<table class="table table-bordered table-striped">
<% for(Word w:list){ %>
<tr><th><%=w.getTitle() %></th><td><%=w.getBody() %></td></tr>
<%} %>
</table>
<%} %>
<%if(pagination != null){ %>
 <%=pagination %>
 <%} %>
</div><!-- container -->
<footer>
&copy; 2021 Fujimura Kenta
</footer>
</body>
</html>