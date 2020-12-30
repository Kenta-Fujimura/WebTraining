<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/main.css">
    <title>SLOT</title>
  </head>
  <body>
    <hr/>
    <%
    String buttonName = "START！";
    int numberArray[] = new int[9];

    String sbet = request.getParameter("sbet");
    String scoin = request.getParameter("scoin");
    int bet = 0,coin = 0;
    if(sbet != null){
	    bet = Integer.parseInt(sbet);
	    coin = Integer.parseInt(scoin);
	    coin = coin - bet;
    }else{
    	coin = 100;
    }

    for(int i=0;i<9;i++){
      numberArray[i] = (int)(Math.random() * 9) + 1;
    }

    int hitcount = 0;
    if(numberArray[0]==numberArray[1] && numberArray[0]==numberArray[2]){hitcount ++;}
    if(numberArray[3]==numberArray[4] && numberArray[3]==numberArray[5]){hitcount ++;}
    if(numberArray[6]==numberArray[7] && numberArray[6]==numberArray[8]){hitcount ++;}
    if(numberArray[0]==numberArray[3] && numberArray[0]==numberArray[6]){hitcount ++;}
    if(numberArray[1]==numberArray[4] && numberArray[1]==numberArray[7]){hitcount ++;}
    if(numberArray[2]==numberArray[5] && numberArray[2]==numberArray[8]){hitcount ++;}
    if(numberArray[0]==numberArray[4] && numberArray[0]==numberArray[8]){hitcount ++;}
    if(numberArray[2]==numberArray[4] && numberArray[2]==numberArray[6]){hitcount ++;}
    if(hitcount>0){
  	  int win = bet * 10 * hitcount;
  	  coin = coin + win;
    }
  %>

  <table>
    <tr>
      <td><img src=./slot_images/<%=numberArray[0] %>.png></td>
      <td><img src=./slot_images/<%=numberArray[1] %>.png></td>
      <td><img src=./slot_images/<%=numberArray[2] %>.png></td>
    </tr>
    <tr>
      <td><img src=./slot_images/<%=numberArray[3] %>.png></td>
      <td><img src=./slot_images/<%=numberArray[4] %>.png></td>
      <td><img src=./slot_images/<%=numberArray[5] %>.png></td>
    </tr>
    <tr>
      <td><img src=./slot_images/<%=numberArray[6] %>.png></td>
      <td><img src=./slot_images/<%=numberArray[7] %>.png></td>
      <td><img src=./slot_images/<%=numberArray[8] %>.png></td>
    </tr>

    <tr>
      <td colspan="3">
        <form name="sample" action="slot.jsp" method="post">
        <input type="number" name=sbet value=<%= bet%>>BET
        <input type="hidden" name=scoin value=<%= coin %>>
        <input type="submit" name="submit_btn" value=<%= buttonName%>>
        </form>
      </td>
    </tr>
    <tr>
      <td colspan="3">
      	<%
		if(hitcount>0){
			int win = bet * 10 * hitcount;
		%>
        	<img src=./slot_images/hit.png> coin:<%=coin %>
        	<p><%=hitcount %> LINE BINGO Win:<%=win %><p>
        <%
          }else{
        %>
            <img src=./slot_images/nohit.png> coin:<%=coin %>
        <%
          }
        %>
      </td>
    </tr>
  </table>
  </body>
</html>