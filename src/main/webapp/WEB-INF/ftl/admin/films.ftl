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
    <h1 class="main">Список фильмов</h1>
    <table border="3">
        <tr>
            <th>
                ID
            </th>
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
            <th>
                Редактировать
            </th>
        </tr>
        <#list movies as iterMovie>
            <tr>
                <td>
                    ${iterMovie.id}
                </td>
                <td>
                    <#if iterMovie.hasImage == true>
                        <img src='/films/${iterMovie.id}/image' style="height: 100px; width: 150px;">
                    </#if>
                    <#if iterMovie.hasImage == false>
                        <img src="/img/image.png" style="height: 100px; width: 150px;">
                    </#if>
                </td>
                <td>
                    ${iterMovie.title}
                </td>
                <td>
                    ${iterMovie.formatDate()}
                </td>
                <td>
                    ${iterMovie.restrictions}
                </td>
                <td>
                    ${iterMovie.description}
                </td>
                <td>
                    <a href="/admin/films/${iterMovie.id}">Редактировать</a>
                    <form method="post" action="/admin/films/${iterMovie.id}/delete">
                        <button type="submit">Удалить</button>
                    </form>
                </td>
            </tr>
        </#list>
    </table>

    <div class="addMovies">
        <form method="post" action="/admin/films" enctype="multipart/form-data">
            <label for="title" style="background-color: darkgray">Название фильма</label>
            <input type="text" name="title" id="title" required>
            <label for="releaseDate" style="background-color: darkgray">Дата выпуска</label>
            <input type="date" pattern="yyyy-MM-dd" name="releaseDate" id="releaseDate" required>
            <label for="restrictions" style="background-color: darkgray">Ограничения</label>
            <input type="number" name="restrictions" id="restrictions" required>
            <label for="description" style="background-color: darkgray">Описание</label>
            <input type="text" name="description" id="description" required>
            <label for="files">Изменить фото</label>
            <input type="file" name="file" accept="image/*" style="background-color: darkgrey" id="files" hidden>
            <button type="submit">Добавить</button>
        </form>
    </div>
</main>
<footer>
    <h2 class="footer">Москва 2022</h2>
</footer>
</body>
</html>
