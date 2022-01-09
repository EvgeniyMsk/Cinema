<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Редактирование фильма</title>
    <link rel="stylesheet" type="text/css" href="/css/main.css">
</head>
<body>
<header>
    <h1 class="header"><a class="header" href="/">На главную</a></h1>
</header>
<form:form method="post" action="/admin/films/${movie.id}/update" enctype="multipart/form-data" modelAttribute="movie" cssStyle="margin-top: 5%">
    <table border="3">
        <tr>
        <th>
            Постер
        </th>
        <th>
            Название
        </th>
        <th>
            Дата выпуска
        </th>
        <th>
            Ограничения
        </th>
        <th>
            Описание
        </th>
        </tr>
        <tr>
        <td>
            <div>
                <c:if test="${movie.hasImage == true}">
                    <img src='/films/${movie.id}/image' style="height: 100px; width: 150px;">
                </c:if>
                <c:if test="${movie.hasImage == false}">
                    <img src="${pageContext.request.contextPath}/img/image.png" style="height: 100px; width: 150px;">
                </c:if>
            </div>
            <input type="file" name="file" accept="image/*">
        </td>
        <td>
            <form:input path="title"></form:input>
        </td>
        <td>
            <input id="releaseDate" type="date" pattern="yyyy-MM-dd" name="releaseDate"
                   value="${movie.dateOfRelease.year + 1900}-<c:if test="${movie.dateOfRelease.month + 1 > 9}">${movie.dateOfRelease.month + 1}</c:if><c:if test="${movie.dateOfRelease.month + 1 < 10}">0${movie.dateOfRelease.month + 1}</c:if>-<c:if test="${movie.dateOfRelease.day > 9}">${movie.dateOfRelease.day}</c:if><c:if test="${movie.dateOfRelease.day < 10}">0${movie.dateOfRelease.day}</c:if>" required>
        </td>
        <td>
            <form:input path="restrictions"></form:input>
        </td>
        <td>
            <form:input path="description"></form:input>
        </td>
        </tr>
    </table>
    <button type="submit" style="width: 30%; height: 7%; font-size: xx-large">Обновить</button>
</form:form>
<footer>
    <h2 class="footer">Москва 2021</h2>
</footer>
</body>
</html>
