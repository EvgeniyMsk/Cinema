<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Авторизация</title>
</head>
<body>
<sec:authorize access="isAuthenticated()">
    <% response.sendRedirect("/auth/profile"); %>
</sec:authorize>
<a href="/">На главную</a>
<div>
    <p>
        Авторизация
    </p>
</div>
<div>
    <form action="/auth/login" method="post">
        <label for="username">Логин</label>
        <input name="username" id="username">
        <label for="password">Пароль</label>
        <input name="password" type="password" id="password">
        <button type="submit">Войти</button>
    </form>
</div>
</body>
</html>
