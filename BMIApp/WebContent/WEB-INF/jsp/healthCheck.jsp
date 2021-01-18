<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>スッキリ健康診断</title>
</head>
<body>
<h1>スッキリ健康診断</h1>
<form action="/BMIApp/HealthCheck" method="post">
身長(cm):<input type="number" name="height" step="0.1" required><br>
体重(kg):<input type="number" name="weight" step="0.1" required><br>
<input type="submit" value="診断">
</form>
</body>
</html>