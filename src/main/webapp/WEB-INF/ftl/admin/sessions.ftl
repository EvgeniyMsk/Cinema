<#import "/spring.ftl" as spring/>
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
            <#list cinemaSessions as iterCinemaSession>
                <tr>
                    <td>
                        ${iterCinemaSession.id}
                    </td>
                    <td>
                        ${iterCinemaSession.getDateHtml()}
                    </td>
                    <td>
                        Кинозал №${iterCinemaSession.movieHall.id}, ${iterCinemaSession.movieHall.seatsCount} посадочных мест
                    </td>
                    <td>
                        ${iterCinemaSession.movie.title}
                    </td>
                    <td>
                        ${iterCinemaSession.ticketCost}
                    </td>
                    <td>
                        <a href="/admin/sessions/${iterCinemaSession.id}">Редактировать</a>
                        <form method="post" action="/admin/sessions/${iterCinemaSession.id}/delete">
                            <button type="submit">Удалить</button>
                        </form>
                    </td>
                </tr>
            </#list>
        </table>

    </div>
    <div class="addCinemaSessions">
        <form method="post" action="/admin/sessions">
            <label style="background-color: darkgray" for="date">Дата</label>
            <input id="date" type="datetime-local" pattern="yyyy-MM-dd, HH:mm" name="sessionDateTime" required>
            <label style="background-color: darkgray" for="movieHall">Кинозал</label>
            <select id="movieHall" name="movieHallId">
                <#list movieHalls as iterMovieHall>
                    <option value="${iterMovieHall.id}"><@spring.messageText "cinemaHallforSession" "Cinema hall"></@spring.messageText> №${iterMovieHall.id}, ${iterMovieHall.seatsCount} <@spring.messageText "seatsCount" "Count of seats"></@spring.messageText></option>
                </#list>
            </select>
            <label style="background-color: darkgray" for="movie">Фильм</label>
            <select id="movie" name="movieId">
                <#list movies as iterMovie>
                    <option value="${iterMovie.id}">${iterMovie.title}</option>
                </#list>
            </select>
            <label style="background-color: darkgray" for="ticketCost">Цена билета</label>
            <input type="text" id="ticketCost" name="ticketCost" required>
            <button type="submit">Добавить</button>
        </form>
    </div>
</main>
<footer>
    <h2 class="footer">Москва 2022</h2>
</footer>
</body>
</html>
