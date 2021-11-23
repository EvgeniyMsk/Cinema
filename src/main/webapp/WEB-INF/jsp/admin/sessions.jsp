<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
Sessions
<a href="/">На главную</a>
<div class="cinemaSessions">
    <h1>Список сеансов</h1>
    <table border="3">
        <tr>
            <th>
                ID
            </th>
            <th>
                Дата/Время
            </th>
            <th>
                Кинозал
            </th>
            <th>
                Фильм
            </th>
            <th>
                Цена билета
            </th>
            <th>
                Редактировать
            </th>
        </tr>
        <c:forEach items="${cinemaSessions}" var="iterCinemaSession">
            <tr>
                <td>
                        ${iterCinemaSession.id}
                </td>
                <td>
                        ${iterCinemaSession.date}
                </td>
                <td>
                        ${iterCinemaSession.movieHall}
                </td>
                <td>
                        ${iterCinemaSession.movie}
                </td>
                <td>
                        ${iterCinemaSession.ticketCost}
                </td>
                <td>
                    <a href="/admin/sessions/${iterCinemaSession.id}">Редактировать</a>
                    <form:form method="post" action="/admin/sessions/${iterCinemaSession.id}/delete">
                        <input type="submit" value="Удалить">
                    </form:form>
                </td>
            </tr>
        </c:forEach>
    </table>

</div>

<div class="addCinemaSessions">
    <form:form method="post" action="/admin/sessions" modelAttribute="cinemaSession">
        <form:label path="date">Дата</form:label>
        <form:input path="date"></form:input>
        <form:label path="movieHall">Кинозал</form:label>
        <form:select path="movieHall">
            <c:forEach items="${movieHalls}" var="iterMovieHall">
                <form:option value="Зал №${iterMovieHall.id}, ${iterMovieHall.seatsCount} посадочных мест"></form:option>
            </c:forEach>
        </form:select>
        <form:label path="movie">Название фильма</form:label>
        <form:input path="movie"></form:input>
        <form:label path="ticketCost">Цена билета</form:label>
        <form:input path="ticketCost"></form:input>
        <button type="submit">Добавить</button>
    </form:form>
</div>
</body>
</html>
