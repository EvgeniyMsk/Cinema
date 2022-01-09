<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="/css/main.css">
</head>
<body>
<header>
    <h1 class="header"><a class="header" href="/">На главную</a></h1>
</header>
<main>
    <h1 class="main">Список фильмов</h1>
    <table border="3">
        <tr>
            <th>
                ID
            </th>
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
            <th>
                Редактировать
            </th>
        </tr>
        <c:forEach items="${movies}" var="iterMovie">
            <tr>
                <td>
                        ${iterMovie.id}
                </td>
                <td>
                    <c:if test="${iterMovie.hasImage == true}">
                        <img src='/films/${iterMovie.id}/image' style="height: 100px; width: 150px;">
                    </c:if>
                    <c:if test="${iterMovie.hasImage == false}">
                        <img src="${pageContext.request.contextPath}/img/image.png" style="height: 100px; width: 150px;">
                    </c:if>
                </td>
                <td>
                        ${iterMovie.title}
                </td>
                <td>
                        ${iterMovie.dateOfRelease.toLocaleString().split(" ")[0]}
                </td>
                <td>
                        ${iterMovie.restrictions}
                </td>
                <td>
                        ${iterMovie.description}
                </td>
                <td>
                    <a href="/admin/films/${iterMovie.id}">Редактировать</a>
                    <form:form method="post" action="/admin/films/${iterMovie.id}/delete">
                        <input type="submit" value="Удалить">
                    </form:form>
                </td>
            </tr>
        </c:forEach>
    </table>

    <div class="addMovies">
        <form:form method="post" action="/admin/films" enctype="multipart/form-data" modelAttribute="movie">
            <form:label cssStyle="background-color: darkgray" path="title">Название</form:label>
            <form:input path="title"></form:input>
            <form:label cssStyle="background-color: darkgray" path="dateOfRelease">Дата выпуска</form:label>
            <input type="date" pattern="yyyy-MM-dd" name="releaseDate" required>
            <form:label cssStyle="background-color: darkgray" path="restrictions">Ограничения по возрасту</form:label>
            <form:input path="restrictions"></form:input>
            <form:label cssStyle="background-color: darkgray" path="description">Описание</form:label>
            <form:input path="description"></form:input>
            <input type="file" name="file" accept="image/*" style="background-color: darkgrey">
            <button type="submit">Добавить</button>
        </form:form>
    </div>
</main>
<footer>
    <h2 class="footer">Москва 2021</h2>
</footer>
</body>
</html>
