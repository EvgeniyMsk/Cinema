<%@ page import="edu.school21.cinema.models.Movie" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: qsymond
  Date: 21.11.2021
  Time: 14:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Редактирование фильма</title>
</head>
<body>
<form:form method="post" action="/admin/films/${movie.id}/update" modelAttribute="movie">
    <form:label path="title">Название</form:label>
    <form:input path="title"></form:input>
    <form:label path="dateOfRelease">Дата выпуска</form:label>
    <input type="date" pattern="yyyy-MM-dd" name="releaseDate" value="${movie.dateOfRelease.year + 1900}-${movie.dateOfRelease.month}-${movie.dateOfRelease.date}" required>
    <form:label path="restrictions">Ограничения по возрасту</form:label>
    <form:input path="restrictions"></form:input>
    <form:label path="description">Описание</form:label>
    <form:input path="description"></form:input>
    <button type="submit">Обновить</button>
</form:form>
</body>
</html>
