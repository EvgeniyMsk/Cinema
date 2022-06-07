<#import "/spring.ftl" as spring/>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="/css/main.css">
</head>
<body>
<header>
    <table style="background-color: #181258">
        <td width="85%">
            <h1 class="header"><a class="header" href="/" style="margin-left: 10%">На главную</a></h1>
        </td>
        <td width="15%">
            <form action="/auth/logout" method="POST">
                <label for="logout" style="font-size: xx-large; color: white">Привет, ${user.username}!</label>
                <input id="logout" type="submit" style="background-color: #181258;
      border: none;
      color: white;
      text-align: center;
      text-decoration: none;
      display: inline-block;
      font-size: 20px;
      cursor: pointer;" value="Выйти">
            </form>
        </td>
    </table>


</header>
<main>
    <h1 class="main">Информация о пользователе</h1>
    <table border="3">
        <tr>
            <th>ID</th>
            <td>${user.id}</td>
        </tr>
        <tr>
            <th>Права доступа</th>
            <td>
                <#list user.roles as iterRole>
                    ${iterRole.name}
                </#list>
            </td>
        </tr>
        <tr>
            <th>Логин</th>
            <td>${user.username}</td>
        </tr>
        <tr>
            <th>Пароль</th>
            <td>${user.password}</td>
        </tr>
        <tr>
            <th>Фото</th>
            <td><img src="/auth/profile/avatar" style="height: 100px; width: 150px;" onerror="this.onerror=null;this.src='/img/image.png';">
                <form method="post" action="/auth/profile/avatar" enctype="multipart/form-data">
                    <input type="file" name="file" accept="image/*">
                    <div>
                    <button type="submit">Загрузить</button>
                    </div>
                </form>
            </td>
        </tr>
    </table>
<h1 class="main">История входов</h1>
<div>
    <table border="3">
        <tr>
            <th>
                Дата операции
            </th>
            <th>
                Тип
            </th>
            <th>
                Адрес
            </th>
        </tr>
        <#list user.authHistory as iterAuth>
            <tr>
                <td>
                        ${iterAuth.time}
                </td>
                <td>
                        ${iterAuth.type}
                </td>
                <td>
                        ${iterAuth.address}
                </td>
            </tr>
        </#list>
    </table>
</div>
<h1 class="main">Загруженные фото на аватар</h1>
<div>
    <table border="3">
        <tr>
            <th>
                Ссылка
            </th>
        </tr>
        <#list listFiles as filesIter>
            <tr>
                <td>
                    <a href="/auth/profile/photo/${filesIter}/show">${filesIter}</a>
                </td>
            </tr>
        </#list>
    </table>
</div>
</main>
<footer>
    <h2 class="footer">Москва 2022</h2>
</footer>
</body>
</html>
