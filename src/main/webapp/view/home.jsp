<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<h1> Trang chủ </h1>
<form action="home" method="get">
    <input type="hidden" name="choice" value="create">
    <input type="submit" value="Thêm">
</form>
<table>
    <tr>
        <th>#</th>
        <th>Name</th>
        <th>Email</th>
        <th>Address</th>
        <th>PhoneNumber</th>
        <th>Salary</th>
        <th>Department</th>
        <th>Action</th>
    </tr>
    <c:forEach var="resultEmployee" items="${requestScope.employeeList}">
        <tr>
            <th>${resultEmployee.getEmployee_id()}</th>
            <th>${resultEmployee.name}</th>
            <th>${resultEmployee.email}</th>
            <th>${resultEmployee.address}</th>
            <th>${resultEmployee.phoneNumber}</th>
            <th>${resultEmployee.salary}</th>
            <th>${resultEmployee.department}</th>
            <th><a href="home?choice=edit&employee_id=${resultEmployee.getEmployee_id()}">Sửa</a></th>
            <th><a href="home?choice=delete&employee_id=${resultEmployee.getEmployee_id()}">Xóa</a></th>
        </tr>
    </c:forEach>
</table>

<form action="home" method="get">
    <input type="text" name="searchKey" placeholder="search here">
    <input type="submit" name="choice" value="search">
</form>
</body>
</html>
