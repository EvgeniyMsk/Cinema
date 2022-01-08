<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Регистрация</title>
</head>
<body>
<a href="/">На главную</a>
<div>
    <p>
        Регистрация
    </p>
</div>
<sec:authorize access="isAuthenticated()">
    <% response.sendRedirect("/auth/profile"); %>
</sec:authorize>
<div>
    <form:form action="/auth/register" method="post" modelAttribute="user">
        <form:label path="username">Логин</form:label>
        <form:input path="username"></form:input>
        <form:label path="password">Пароль</form:label>
        <form:input path="password" type="password"></form:input>
        <form:button type="submit">Регистация</form:button>
    </form:form>
</div>
</body>
</html>
