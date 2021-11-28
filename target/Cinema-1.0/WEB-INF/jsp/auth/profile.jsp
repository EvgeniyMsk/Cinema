<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Evgeniy
  Date: 28.11.2021
  Time: 14:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        .form-test {
            font: 14px Arial;
            alignment: right;
        }
        .form-test input {
            font: 14px Arial;
            border: none;
            padding: 0;
            background: #ffffff;
            color: #00f;
        }
    </style>
</head>
<body>
<%=request.getSession().getAttribute("user")%>
<form action="/auth/logout" method="POST">
    <input type="submit" value="Выйти">
</form>
</body>
</html>
