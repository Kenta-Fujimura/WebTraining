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
	String status[] = request.getParameterValues("status");
	out.println(Arrays.toString(status));

	int[] ia = new int[status.length];
	for (int i = 0; i < status.length; i++) {
   		 ia[i] = Integer.parseInt(status[i]);
	}

	String seed = request.getParameter("seed");
	out.print(seed);
	String race=request.getParameter("race");
	Integer index = Integer.parseInt(race);
	String[] races={"人間","ハイエルフ","トロル","ノーム"};
	switch(index){
	case 0:
		ia[0] += 10;
		ia[1] += 10;
		ia[2] += 10;
		ia[3] += 10;
		ia[4] += 10;
		break;
	case 1 :
		ia[1] += 20;
		ia[3] += 10;
		ia[4] += 20;
		break;
	case 2 :
		ia[0] += 30;
		ia[2] += 20;
		break;
	case 3 :
		ia[0] += 10;
		ia[3] += 25;
		ia[4] += 20;
		break;
	}
%>

<p><%= races[index]%>のボーナスが適用されました!</p>
<p>[体力:<%= ia[0]%>
		魔力:<%= ia[1]%>
		パワー:<%= ia[2]%>
	    きようさ:<%=ia[3]%>
	    すばやさ:<%=ia[4]%> ]</p>
<p>職業を選んでください</p>
<form action="/SelfIntroduction/page4.jsp" method="post">
	<input type="radio" name="job" value="0">戦士<br>
	<input type="radio" name="job" value="1">盗賊<br>
	<input type="radio" name="job" value="2">僧侶<br>
	<input type="radio" name="job" value="3">魔術師<br>
	<button type="submit">選択</button>
</form>
</body>
</html>