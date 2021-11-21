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
<form:form method="post" action="/admin/films/${movie.id}/update" modelAttribute="movie">
    <form:label path="title">Название</form:label>
    <form:input path="title"></form:input>
    <form:label path="dateOfRelease">Дата выпуска</form:label>
    <form:input path="dateOfRelease"></form:input>
    <form:label path="restrictions">Ограничения по возрасту</form:label>
    <form:input path="restrictions"></form:input>
    <form:label path="description">Описание</form:label>
    <form:input path="description"></form:input>
    <button type="submit">Обновить</button>
</form:form>
</body>
</html>
