<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%request.setCharacterEncoding("UTF-8");%>
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
    <div class="cinemaSessions">
        <h1 class="main">Список сеансов</h1>
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
                            ${iterCinemaSession.date.toLocalDate()} ${iterCinemaSession.date.toLocalTime()}
                    </td>
                    <td>
                        Зал №${iterCinemaSession.movieHall.id}, ${iterCinemaSession.movieHall.seatsCount} посадочных мест
                    </td>
                    <td>
                            ${iterCinemaSession.movie.title}
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
        <form method="post" action="/admin/sessions">
            <label style="background-color: darkgray" for="date">Дата</label>
            <input id="date" type="datetime-local" pattern="yyyy-MM-dd, HH:mm" name="sessionDateTime" required>
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
            <input type="text" id="ticketCost" name="ticketCost" required>
            <button type="submit">Добавить</button>
        </form>
    </div>
</main>
<footer>
    <h2 class="footer">Москва 2021</h2>
</footer>
</body>
</html>
