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
    <c:forEach var="employee" items="${requestScope.employeeList}">
        <tr>
            <th>${employee.getEmployee_id()}</th>
            <th>${employee.name}</th>
            <th>${employee.email}</th>
            <th>${employee.address}</th>
            <th>${employee.phoneNumber}</th>
            <th>${employee.salary}</th>
            <th>${employee.department}</th>
            <th><a href="home?choice=edit&employee_id=${employee.getEmployee_id()}">Sửa</a></th>
            <th><a href="home?choice=delete&employee_id=${employee.getEmployee_id()}">Xóa</a></th>
        </tr>
    </c:forEach>

    <form action="home" method="get">
        <input type="hidden" name="choice" value="create">
        <input type="submit" value="Thêm">
    </form>
</table>
</body>
</html>
