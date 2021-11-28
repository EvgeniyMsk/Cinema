<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: qsymond
  Date: 25.11.2021
  Time: 20:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Авторизация</title>
</head>
<body>
<a href="/">На главную</a>
<div>
    <p>
        Авторизация
    </p>
</div>
<div>
    <form:form action="/auth/signIn" method="post" modelAttribute="user">
        <form:label path="userName">Логин</form:label>
        <form:input path="userName"></form:input>
        <form:label path="password">Пароль</form:label>
        <form:input path="password" type="password"></form:input>
        <form:button type="submit">Войти</form:button>
    </form:form>
</div>
</body>
</html>
