<%@ page import="java.util.Base64" %>
<%@ page import="java.util.List" %>
<%@ page import="edu.school21.cinema.models.Movie" %>
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
<html>
<head>
    <title>Title</title>
    <%
        List<Movie> movies = (List<Movie>) request.getAttribute("movies");
        int index = 0;
    %>
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
                        <img src="data:image/jpeg;base64,<%=Base64.getEncoder().encodeToString(movies.get(index).getImageBytes())%>" style="height: 100px; width: 150px;">
                        <%
                            index++;
                        %>
                    </c:if>
                    <c:if test="${iterMovie.hasImage == false}">
                        <img src="${pageContext.request.contextPath}/img/image.png" style="height: 100px; width: 150px;">
                        <%
                            index++;
                        %>
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

</div>

<div class="addMovies">
    <form:form method="post" action="/admin/films" enctype="multipart/form-data" modelAttribute="movie">
        <form:label path="title">Название</form:label>
        <form:input path="title"></form:input>
        <form:label path="dateOfRelease">Дата выпуска</form:label>
        <input type="date" pattern="yyyy-MM-dd" name="releaseDate" required>
        <form:label path="restrictions">Ограничения по возрасту</form:label>
        <form:input path="restrictions"></form:input>
        <form:label path="description">Описание</form:label>
        <form:input path="description"></form:input>
        <input type="file" name="file" accept="image/*">
        <button type="submit">Добавить</button>
    </form:form>

<%--    <form method="post" action="/admin/films" enctype="multipart/form-data">--%>
<%--        --%>
<%--        <button type="submit">Добавить</button>--%>
<%--    </form>--%>
</div>
</body>
</html>
