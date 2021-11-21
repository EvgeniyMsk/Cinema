<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: qsymond
  Date: 19.11.2021
  Time: 16:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%request.setCharacterEncoding("UTF-8");%>
<html>
<head>
    <title>Title</title>
</head>
<body>
Films
<a href="/">На главную</a>
<div class="movies">
    <h1>Список фильмов</h1>
    <table border="3">
        <tr>
            <th>
                ID
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
                Сеансы
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
                        ${iterMovie.title}
                </td>
                <td>
                        ${iterMovie.dateOfRelease}
                </td>
                <td>
                        ${iterMovie.restrictions}
                </td>
                <td>
                        ${iterMovie.description}
                </td>
                <td>
                        ${iterMovie.sessions}
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

</div>

<div class="addMovies">
    <form:form method="post" action="/admin/films" modelAttribute="movie">
        <form:label path="title">Название</form:label>
        <form:input path="title"></form:input>
        <form:label path="dateOfRelease">Дата выпуска</form:label>
        <form:input path="dateOfRelease"></form:input>
        <form:label path="restrictions">Ограничения по возрасту</form:label>
        <form:input path="restrictions"></form:input>
        <form:label path="description">Описание</form:label>
        <form:input path="description"></form:input>
        <button type="submit">Добавить</button>
    </form:form>
</div>
</body>
</html>
