<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%request.setCharacterEncoding("UTF-8");%>
<html>
<head>
    <title>Редактирование фильма</title>
</head>
<body>
<div class="updateCinemaSessions">
    <form method="post" action="/admin/sessions/${cinemaSession.id}/update">
        <label for="date">Дата сеанса</label>
        <input id="date" type="datetime-local" name="cinemaSessionDateTime"
               value="${cinemaSession.date.year}-<c:if test="${cinemaSession.date.monthValue > 9}">${cinemaSession.date.monthValue}</c:if><c:if test="${cinemaSession.date.monthValue < 10}">0${cinemaSession.date.monthValue}</c:if>-<c:if test="${cinemaSession.date.dayOfMonth > 9}">${cinemaSession.date.dayOfMonth}</c:if><c:if test="${cinemaSession.date.dayOfMonth < 10}">0${cinemaSession.date.dayOfMonth}</c:if>T${cinemaSession.date.toLocalTime()}" required>
        <label for="movieHall">Кинозал</label>
        <select id="movieHall" name="movieHallId">
            <c:forEach items="${movieHalls}" var="iterMovieHall">
                <option value="${iterMovieHall.id}">
                    Зал №${iterMovieHall.id}, ${iterMovieHall.seatsCount} посадочных мест</option>
            </c:forEach>
        </select>
        <label for="movie">Фильм</label>
        <select id="movie" name="movieId">
            <c:forEach items="${movies}" var="iterMovie">
                <option value="${iterMovie.id}">
                        ${iterMovie.title}</option>
            </c:forEach>
        </select>
        <label for="ticketCost">Цена билета</label>
        <input type="text" id="ticketCost" name="ticketCost" value="${cinemaSession.ticketCost}">
        <button type="submit">Обновить</button>
    </form>
</div>
</body>
</html>
