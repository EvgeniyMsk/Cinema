<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<div>
    <form:form action="/auth/signUp" method="post" modelAttribute="user">
        <form:label path="userName">Логин</form:label>
        <form:input path="userName"></form:input>
        <form:label path="password">Пароль</form:label>
        <form:input path="password" type="password"></form:input>
        <form:button type="submit">Регистация</form:button>
    </form:form>
</div>
</body>
</html>
