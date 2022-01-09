<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%request.setCharacterEncoding("UTF-8");%>
<html>
<head>
    <title>Редактирование фильма</title>
    <link rel="stylesheet" type="text/css" href="/css/main.css">
</head>
<body>
<header>
    <h1 class="header"><a class="header" href="/">На главную</a></h1>
</header>
<main>
    <form method="post" action="/admin/sessions/${cinemaSession.id}/update" style="margin-top: 10%">
        <label style="background-color: darkgray" for="date">Дата сеанса</label>
        <input id="date" type="datetime-local" name="cinemaSessionDateTime"
               value="${cinemaSession.date.year}-<c:if test="${cinemaSession.date.monthValue > 9}">${cinemaSession.date.monthValue}</c:if><c:if test="${cinemaSession.date.monthValue < 10}">0${cinemaSession.date.monthValue}</c:if>-<c:if test="${cinemaSession.date.dayOfMonth > 9}">${cinemaSession.date.dayOfMonth}</c:if><c:if test="${cinemaSession.date.dayOfMonth < 10}">0${cinemaSession.date.dayOfMonth}</c:if>T${cinemaSession.date.toLocalTime()}" required>
        <label style="background-color: darkgray" for="movieHall">Кинозал</label>
        <select id="movieHall" name="movieHallId">
            <c:forEach items="${movieHalls}" var="iterMovieHall">
                <option value="${iterMovieHall.id}">
                    Зал №${iterMovieHall.id}, ${iterMovieHall.seatsCount} посадочных мест</option>
            </c:forEach>
        </select>
        <label style="background-color: darkgray" for="movie">Фильм</label>
        <select id="movie" name="movieId">
            <c:forEach items="${movies}" var="iterMovie">
                <option value="${iterMovie.id}">
                        ${iterMovie.title}</option>
            </c:forEach>
        </select>
        <label style="background-color: darkgray" for="ticketCost">Цена билета</label>
        <input type="text" id="ticketCost" name="ticketCost" value="${cinemaSession.ticketCost}">
        <div>
        <button type="submit" style="width: 30%; height: 7%; font-size: xx-large">Обновить</button>
        </div>
    </form>
</main>
<footer>
    <h2 class="footer">Москва 2021</h2>
</footer>
</body>
</html>
