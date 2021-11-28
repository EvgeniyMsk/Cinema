<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Base64" %>
<%@ page import="edu.school21.cinema.models.CinemaSession" %>
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
    <title>Информация о сеансе</title>
</head>
<body>
<%
    CinemaSession cinemaSession = (CinemaSession) request.getAttribute("cinemaSession");
%>
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
        </tr>
            <tr>
                <td>
                        ${cinemaSession.id}
                </td>
                <td>
                        ${cinemaSession.date.toLocalDate()} ${cinemaSession.date.toLocalTime()}
                </td>
                <td>
                    Зал №${cinemaSession.movieHall.id}, ${cinemaSession.movieHall.seatsCount} посадочных мест
                </td>
                <td>
                    <div>
                        ${cinemaSession.movie.title}
                    </div>
                    <div>
                        <img src="data:image/jpeg;base64,<%=Base64.getEncoder().encodeToString(cinemaSession.getMovie().getImageBytes())%>" style="height: 100px; width: 150px;">
                    </div>
                    <div>
                        ${cinemaSession.movie.description}
                    </div>
                </td>
                <td>
                        ${cinemaSession.ticketCost}
                </td>
            </tr>
    </table>

</div>
</body>
</html>
