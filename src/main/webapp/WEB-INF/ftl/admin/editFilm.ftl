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
<form method="post" action="/admin/films/${movie.id}/update" enctype="multipart/form-data" style="margin-top: 5%">
    <table border="3">
        <tr>
            <th>
                Постер
            </th>
            <th>
                Название
            </th>
            <th>
                Дата выпуска
            </th>
            <th>
                Ограничения
            </th>
            <th>
                Описание
            </th>
        </tr>
        <tr>
            <td>
                <div>
                    <#if movie.hasImage == true>
                        <img src='/films/${movie.id}/image' style="height: 100px; width: 150px;">
                    </#if>
                    <#if movie.hasImage == false>
                        <img src="/img/image.png" style="height: 100px; width: 150px;">
                    </#if>
                </div>
                <input type="file" name="file" accept="image/*">
            </td>
            <td>
                <input name="title" value="${movie.title}" required>
            </td>
            <td>
                <input id="releaseDate" type="date" pattern="yyyy-MM-dd" name="releaseDate" value="${movie.formatDate()}" required>
            </td>
            <td>
                <input name="restrictions" value="${movie.restrictions}" required>
            </td>
            <td>
                <input name="description" value="${movie.description}" required>
            </td>
        </tr>
    </table>
    <button type="submit" style="width: 30%; height: 7%; font-size: xx-large">Обновить</button>
</form>
<footer>
    <h2 class="footer">Москва 2022</h2>
</footer>
</body>
</html>