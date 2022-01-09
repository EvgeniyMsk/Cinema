<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Авторизация</title>
    <link rel="stylesheet" type="text/css" href="/css/login.css">
    <sec:authorize access="isAuthenticated()">
        <% response.sendRedirect("/auth/profile"); %>
    </sec:authorize>
</head>
<body>
<header>
    <h1 class="header"><a class="header" href="/">На главную</a></h1>
</header>

<main>
<div>
    <h1 class="main">Авторизация</h1>
    <form action="/auth/login" method="post">
        <div>
        <label for="username">Логин</label>
        <input style="margin-left: 10px" name="username" id="username">
        </div>
        <div>
        <label for="password">Пароль</label>
        <input name="password" type="password" id="password">
        </div>
        <div>
        <button type="submit">Войти</button>
        </div>
    </form>
</div>

</main>
<footer>
    <h2 class="footer">Москва 2021</h2>
</footer>
</body>
</html>
