<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-10-16
  Time: 오후 4:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Enter Todo</h1>
<form action="/add" method="post">
    <input type="text" name="todo">
    <button>SUBMIT</button>
</form>
<h1>To Do List</h1>
<div>
    <table>
        <tr>
            <th>id</th>
            <th>todo</th>
            <th>Created Date</th>
        </tr>
        <c:forEach items="todoList" var="todo">
            <tr>
                <td>${todo.id}</td>
                <td>${todo.todo}</td>
                <td>${todo.inserted}</td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
