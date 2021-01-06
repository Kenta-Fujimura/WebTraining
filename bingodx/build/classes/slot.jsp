<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/main.css"><title>BingoDX</title>
</head>
    <%
    String buttonName = "START！";
    int numberArray[] = new int[9];
    String sbet = request.getParameter("sbet");
    String scoin = request.getParameter("scoin");
    int bet = 1,coin = 0;
    int gameoverflg = 0;
    int reachflg = 0;
    int win = 0;

    //初回以外
    if(sbet != null){
	    bet = Integer.parseInt(sbet);
	    coin = Integer.parseInt(scoin);
	    coin = coin - bet;
    }else{
    	//初回
    	coin = 100;
    }

    //乱数生成
	for(int i=0;i<9;i++){
      numberArray[i] = (int)(Math.random() * 8) + 1;
    }

    //当たり判定
    int hitcount = 0;
    if(numberArray[0]==numberArray[1] && numberArray[0]==numberArray[2]){hitcount ++;}
    if(numberArray[3]==numberArray[4] && numberArray[3]==numberArray[5]){hitcount ++;}
    if(numberArray[6]==numberArray[7] && numberArray[6]==numberArray[8]){hitcount ++;}
    if(numberArray[0]==numberArray[3] && numberArray[0]==numberArray[6]){hitcount ++;}
    if(numberArray[1]==numberArray[4] && numberArray[1]==numberArray[7]){hitcount ++;}
    if(numberArray[2]==numberArray[5] && numberArray[2]==numberArray[8]){hitcount ++;}
    if(numberArray[0]==numberArray[4] && numberArray[0]==numberArray[8]){hitcount ++;}
    if(numberArray[2]==numberArray[4] && numberArray[2]==numberArray[6]){hitcount ++;}

    //センターリーチ判定
    if(numberArray[0]==numberArray[8]||
    	numberArray[2]==numberArray[6]||
    	numberArray[1]==numberArray[7]||
    	numberArray[3]==numberArray[5])
    {reachflg = 1;}

    //当たり時の計算
    if(hitcount>0){
  		win = bet * 10 * hitcount;
  		coin = coin + win;
    }
  //GAMEOVER時処理
    if(coin == 0 && sbet != null){
    	coin = 100;
    	bet = 1;
    	gameoverflg = 1;
    }
  %>
  <body>
  <br>
  <table>
    <tr>
      <td><img class="fadein img02" src=./slot_images/<%=numberArray[0] %>.png></td>
      <td><img class="fadein img01"src=./slot_images/<%=numberArray[1] %>.png></td>
      <td><img class="fadein img03"src=./slot_images/<%=numberArray[2] %>.png></td>
    </tr>
    <tr>
      <td><img class="fadein img01"src=./slot_images/<%=numberArray[3] %>.png></td>
      <%if(reachflg == 1){%>
      <td><img class="fadein img04"src=./slot_images/<%=numberArray[4] %>.png></td>
      <%}else{%>
      <td><img class="fadein img03"src=./slot_images/<%=numberArray[4] %>.png></td>
      <%}%>
      <td><img class="fadein img01"src=./slot_images/<%=numberArray[5] %>.png></td>
    </tr>
    <tr>
      <td><img class="fadein img03"src=./slot_images/<%=numberArray[6] %>.png></td>
      <td><img class="fadein img01"src=./slot_images/<%=numberArray[7] %>.png></td>
      <td><img class="fadein img02"src=./slot_images/<%=numberArray[8] %>.png></td>
    </tr>
    <tr>
      <td colspan="3">
        <form name="sample" action="slot.jsp" method="post">
        <% if(reachflg == 1){%>
        	<span class="fadein img04">coin:<%=coin %></span>
        <% }else{%>
        	<span class="fadein img03">coin:<%=coin %></span>
        <% }%>
        <input type="number" name=sbet min="1" max=<%=coin %> value=<%= bet%>>BET
        <input type="hidden" name=scoin value=<%= coin %>>
        <input type="submit" name="submit_btn" value=<%= buttonName%>>
        </form>
      </td>
    </tr>
    </table>
      	<%if(hitcount>0){%>
        	<p class="fadein img04"><%=hitcount %> LINE BINGO Win:<%=win %></p>
        <%}else if(gameoverflg == 1){%>
        	<p class="fadein img04">GAME OVER</p>
        <%}else if(sbet != null){
			if(reachflg == 1){%>
           		<p class="fadein img05">sorry...</p>
			<%}else{ %>
				<p class="fadein img03">sorry...</p>
			<%}%>
        <%}%>
  </body>
</html>