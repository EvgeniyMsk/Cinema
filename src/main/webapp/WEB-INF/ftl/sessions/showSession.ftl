<#import "/spring.ftl" as spring/>
<html>
<head>
    <title>Информация о сеансе</title>
    <link rel="stylesheet" type="text/css" href="/css/main.css">
</head>
<body>
<header>
    <h1 class="header"><a class="header" href="/">На главную</a></h1>
</header>
<main>
<div class="cinemaSessions">
    <h1 class="main">Просмотр сеанса</h1>
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
                        <#if cinemaSession.movie.hasImage == true>
                            <img src='/films/${cinemaSession.movie.id}/image' style="height: 100px; width: 150px;">
                        </#if>
                        <#if cinemaSession.movie.hasImage == false>
                            <img src="${pageContext.request.contextPath}/img/image.png" style="height: 100px; width: 150px;">
                        </#if>
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
</main>
<footer>
    <h2 class="footer">Москва 2022</h2>
</footer>
</body>
</html>
