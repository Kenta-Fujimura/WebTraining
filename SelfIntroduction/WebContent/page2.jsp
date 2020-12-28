<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
		request.setCharacterEncoding("UTF-8");
	%>
<%
	String name=request.getParameter("name");
	int seed=0;
	for(int i=0;i<name.length();i++){
		seed+=name.charAt(i);
	}
	request.setAttribute("seed", seed);
	//ステータス作成
	Random rnd = new Random(seed);
	int status[] ={
			rnd.nextInt(100)+1,
			rnd.nextInt(100)+1,
			rnd.nextInt(50)+1,
			rnd.nextInt(50)+1,
			rnd.nextInt(50)+1};

%>
<p>初期ステータスが決定しました</p>
<p><% out.println(Arrays.toString(status)); %>
<p>[体力:<%= status[0]%>
		魔力:<%= status[1]%>
		パワー:<%= status[2]%>
	    きようさ:<%=status[3]%>
	    すばやさ:<%=status[4]%> ]</p>
<p>種族を選んでください</p>
<form action="/SelfIntroduction/page3.jsp" method="post">
<input type="radio" name="race" value="0">人間<br>
<input type="radio" name="race" value="1">ハイエルフ<br>
<input type="radio" name="race" value="2">トロル<br>
<input type="radio" name="race" value="3">ノーム<br>
<input type="hidden" name="seed" value=<%= seed%>>
<input type="hidden" name="status" value=<%= status%>>
<button type="submit" >選択</button>
</form>
</body>
</html>