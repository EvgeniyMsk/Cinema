<%--
  Created by IntelliJ IDEA.
  User: qsymond
  Date: 19.11.2021
  Time: 12:22
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html lang="ru">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="/css/main.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
          crossorigin="anonymous">
</head>
<body>
<header>
    <h1 class="header"><a class="header" href="https://projects.intra.42.fr/projects/cinema">Cinema.</a> Школа 21, Московский кампус.</h1>
    <h2 class="header">Авторы: <a class="header" href="https://profile.intra.42.fr/users/qsymond">Qsymond</a> и <a class="header" href="https://profile.intra.42.fr/users/pcharlot">Pcharlot</a></h2>
</header>
<main>
    <a class="main" href="/admin/halls">[Для администратора] Редактировать Кинозалы</a>
    <br>
    <a class="main" href="/admin/films">[Для администратора] Редактировать Фильмы</a>
    <br>
    <a class="main" href="/admin/sessions">[Для администратора] Редактировать Сеансы</a>
    <br>
    <a class="main" href="/sessions">Поиск по киносеансам</a>
    <br>
    <a class="main" href="/auth/login">Авторизация</a>
    <br>
    <a class="main" href="/auth/register">Регистрация</a>
    <br>
    <a class="main" href="/films">Все фильмы</a>
</main>
<footer>
    <h2 class="footer">Москва 2021</h2>
</footer>
</body>
</html>
