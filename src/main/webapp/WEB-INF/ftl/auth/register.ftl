<#import "/spring.ftl" as spring/>
<html>
<head>
    <title>Регистрация</title>
    <link rel="stylesheet" type="text/css" href="/css/login.css">
</head>
<body>
<header><h1 class="header"><a class="header" href="/">На главную</a></h1></header>
<main>
<a href="/">На главную</a>
<div>
    <h1 class="main">Регистрация</h1>
    <form action="/auth/register" method="post">
    <div>
        <label path="username">Логин</label>
        <input style="margin-left: 10px" name="username" type="text">
    </div>
    <div>
        <label path="password">Пароль</label>
        <input type="password" name="password">
    </div>
    <div>
        <button type="submit">Регистрация</button>
    </div>
    </form>
</div>
</main>
<footer>
    <h2 class="footer">Москва 2022</h2>
</footer>
</body>
</html>
