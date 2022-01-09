<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%request.setCharacterEncoding("UTF-8");%>
<html>
<head>
    <title>Редактирование кинозала</title>
    <link rel="stylesheet" type="text/css" href="/css/main.css">
</head>
<body>
<header>
    <h1 class="header"><a class="header" href="/">На главную</a></h1>
</header>
<main>
<form:form method="post" action="/admin/halls/${movieHall.id}/update" modelAttribute="movieHall" cssStyle="margin-top: 10%">
    <form:label cssStyle="background-color: darkgray" path="seatsCount">Количество мест</form:label>
    <form:input path="seatsCount"></form:input>
    <button type="submit">Обновить</button>
</form:form>
</main>
<footer>
    <h2 class="footer">Москва 2021</h2>
</footer>
</body>
</html>
