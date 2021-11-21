<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: qsymond
  Date: 21.11.2021
  Time: 14:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%request.setCharacterEncoding("UTF-8");%>
<html>
<head>
    <title>Редактирование фильма</title>
</head>
<body>
<form:form method="post" action="/admin/sessions/${cinemaSession.id}/update" modelAttribute="cinemaSession">
    <form:label path="date">Дата</form:label>
    <form:input path="date"></form:input>
    <form:label path="movieHall">Кинозал</form:label>
    <form:input path="movieHall"></form:input>
    <form:label path="movie">Название фильма</form:label>
    <form:input path="movie"></form:input>
    <form:label path="ticketCost">Цена билета</form:label>
    <form:input path="ticketCost"></form:input>
    <button type="submit">Обновить</button>
</form:form>
</body>
</html>
