<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%request.setCharacterEncoding("UTF-8");%>
<html>
<head>
    <title>Title</title>
</head>
<body>
Halls
<a href="/">На главную</a>
<div class="halls">
    <h1>Список кинозалов</h1>
    <table border="3">
        <tr>
        <th>
            ID
        </th>
        <th>
            Количество посадочных мест
        </th>
        <th>
            Редактировать
        </th>
        </tr>
        <c:forEach items="${movieHalls}" var="iterMovieHall">
            <tr>
            <td>
                ${iterMovieHall.id}
            </td>
            <td>
                ${iterMovieHall.seatsCount}
            </td>
            <td>
                <a href="/admin/halls/${iterMovieHall.id}">Редактировать</a>
                <form:form method="post" action="/admin/halls/${iterMovieHall.id}/delete">
                    <input type="submit" value="Удалить">
                </form:form>
            </td>
            </tr>
        </c:forEach>
    </table>

</div>

<div class="addHalls">
    <form:form method="post" action="/admin/halls" modelAttribute="movieHall">
        <form:label path="seatsCount">Количество мест</form:label>
        <form:input path="seatsCount"></form:input>
        <button type="submit">Добавить</button>
    </form:form>
</div>

</body>
</html>
