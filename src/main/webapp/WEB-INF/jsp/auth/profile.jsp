<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
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
<a href="/">На главную</a>
<%=request.getSession().getAttribute("user")%>
<form action="/auth/logout" method="POST">
    <input type="submit" value="Выйти">
</form>
</body>
</html>
