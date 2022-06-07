<#import "/spring.ftl" as spring/>
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
        <input id="date" type="datetime-local" name="cinemaSessionDateTime" value="${cinemaSession.getDateToEdit()}" required>
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
        <input type="text" id="ticketCost" name="ticketCost" value="${cinemaSession.ticketCost}">
        <div>
        <button type="submit" style="width: 30%; height: 7%; font-size: xx-large">Обновить</button>
        </div>
    </form>
</main>
<footer>
    <h2 class="footer">Москва 2022</h2>
</footer>
</body>
</html>
