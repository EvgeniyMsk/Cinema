<#import "/spring.ftl" as spring/>
<html>
<head>
    <title>Редактирование кинозала</title>
    <link rel="stylesheet" type="text/css" href="/css/main.css">
</head>
<body>
<header>
    <h1 class="header"><a class="header" href="/">На главную</a></h1>
</header>
<main>
<form method="post" action="/admin/halls/${movieHall.id}/update" modelAttribute="movieHall" cssStyle="margin-top: 10%">
    <label cssStyle="background-color: darkgray" path="seatsCount">Количество мест</label>
    <input type="text" name="seatsCount">
    <button type="submit">Обновить</button>
</form>
</main>
<footer>
    <h2 class="footer">Москва 2022</h2>
</footer>
</body>
</html>
