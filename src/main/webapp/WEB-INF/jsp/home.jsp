<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-10-16
  Time: 오후 4:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Title</title>
    <style>
        h1 {
            text-align:center;
        }
        textarea {
            width:100%;
            border: 1px solid gainsboro;
        }
        form {
            width:60%;
            margin-left: 20%;
        }
        button {
            margin-top: 2%;
            margin-left: 50%;
            transform:translateX(-50%);
            background:none;
            border:1px solid black;
        }
        button:hover {
            background-color:black;
            color:white;
            transition:1s;
        }
        table {
            width:80%;
            margin-left: 10%;
            border-collapse: collapse;
        }
        th {
            background-color:floralwhite;
            font-weight: bold;
            padding:10px;
        }
        tr {
            border-bottom: 1px solid gainsboro;
            height:30px;
        }
        tr:hover {
            background-color:navajowhite;
            pointer:cursor;
            transition:0.5s;
        }
        td {
            text-align: center;
        }
        td:first-child, td:nth-child(2), td:nth-child(4) {
            width: 5%;
        }
        td:nth-child(3) {
            width:60%;
            text-align:left;
            text-indent: 3%;
        }
        td:last-child {
            width:25%;
        }
        .checked {
            text-decoration: line-through;
            background: #888;
            color: #fff;
        }
    </style>
</head>
<body>
<h1>Add Tasks</h1>
<form action="/add" method="post" enctype="multipart/form-data">
    <textarea name="todo" id="todo" cols="30" rows="10" placeholder="Add a task"></textarea>
    <br>
    Attachments <input type="file" name="files" multiple>
    <button>Add</button>
</form>
<h1>To Do List</h1>
<div>
    <table>
        <tr>
            <th>Check</th>
            <th>ID</th>
            <th>Todo</th>
            <th>Number of Attachments</th>
            <th>Created Date</th>
        </tr>
        <c:forEach items="${todoList}" var="todo">
            <tr>
                <td><input type="checkbox" class="todo-checkbox"></td>
                <td>${todo.id}</td>
                <td>${todo.todo}</td>
                <td>
                    <c:if test="${todo.numOfFiles > 0}">
                        <a href="/files?id=${todo.id}">
                            ${todo.numOfFiles}
                        </a>
                    </c:if>
                </td>
                <td>${todo.inserted}</td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
<script>
    const checkboxes = document.querySelectorAll('.todo-checkbox');
    checkboxes.forEach((checkbox) => {
        checkbox.addEventListener('click', () => {
            checkbox.closest('tr').classList.toggle('checked');
        })
    })
</script>
</html>
