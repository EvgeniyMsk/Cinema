<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Регистрация</title>
    <link rel="stylesheet" type="text/css" href="/css/login.css">
</head>
<body>
<header><h1 class="header"><a class="header" href="/">На главную</a></h1></header>
<main>
<a href="/">На главную</a>
<sec:authorize access="isAuthenticated()">
    <% response.sendRedirect("/auth/profile"); %>
</sec:authorize>
<div>
    <h1 class="main">Регистрация</h1>
    <form:form action="/auth/register" method="post" modelAttribute="user">
    <div>
        <form:label path="username">Логин</form:label>
        <form:input style="margin-left: 10px" path="username"></form:input>
    </div>
    <div>
        <form:label path="password">Пароль</form:label>
        <form:input path="password" type="password"></form:input>
    </div>
    <div>
        <form:button type="submit">Регистрация</form:button>
    </div>
    </form:form>
</div>
</main>
<footer>
    <h2 class="footer">Москва 2021</h2>
</footer>
</body>
</html>
