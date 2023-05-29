<%--
  Created by IntelliJ IDEA.
  User: Hải Sơn
  Date: 5/29/2023
  Time: 9:19 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1> Xóa </h1>
<form action="home" method="post">
    <input type="hidden" name="employee_id" value="${requestScope.employee_id}">
    <input type="hidden" name="choice" value="delete">
    <input type="submit" value="Xóa">
</form>
<form action="home" method="get">
    <input type="hidden" name="employee_id" value="${requestScope.employee_id}">
    <input type="hidden" name="choice" value="">
    <input type="submit" value="Không">
</form>
</body>
</html>
