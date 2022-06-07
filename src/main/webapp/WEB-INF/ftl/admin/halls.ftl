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
<div class="halls">
    <h1 class="main">Список кинозалов</h1>
    <table border="3" style="text-align: center; color: black; background-color: darkgrey">
        <tr>
            <th>
                ID
            </th>
            <th>
                Количество посадочных мест
            </th>
            <th>
                Редактировать
            </th>
        </tr>
        <#list movieHalls as moviehall>
            <tr>
                <td>
                    ${moviehall.id}
                </td>
                <td>
                    ${moviehall.seatsCount}
                </td>
                <td>
                    <a href="/admin/halls/${moviehall.id}">Редактировать</a>
                    <form method="post" action="/admin/halls/${moviehall.id}/delete">
                        <button type="submit">Удалить</button>
                    </form>
                </td>
            </tr>
        </#list>
    </table>

</div>
    <div class="addHalls">
        <form method="post" action="/admin/halls">
            <label for="seatsCount" style="background-color: darkgray">Количество мест</label>
            <input type="number" name="seatsCount" id="seatsCount" required>
            <button type="submit">Добавить</button>
        </form>
    </div>
</main>
<footer>
    <h2 class="footer">Москва 2022</h2>
</footer>
</body>
</html>
