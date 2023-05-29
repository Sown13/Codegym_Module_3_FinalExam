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
<h1> Sửa </h1>
<form action="home" method="post">
    <input type="hidden" name="choice" value="edit">
    <input type="hidden" name="employee_id" value="${requestScope.employee_id}">
    <input type="text" name="name" placeholder="name">
    <input type="text" name="email" placeholder="email">
    <input type="text" name="address" placeholder="address">
    <input type="text" name="phone_number" placeholder="phone_number">
    <input type="text" name="salary" placeholder="salary">
    <input type="text" name="department_id" placeholder="1 nếu là nhân viên R&D, 2 nếu là HR">
    <input type="submit" value="Sửa">
</form>
</body>
</html>
