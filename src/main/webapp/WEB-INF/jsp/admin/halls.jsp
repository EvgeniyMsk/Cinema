<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%request.setCharacterEncoding("UTF-8");%>
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
        <c:forEach items="${movieHalls}" var="iterMovieHall">
            <tr>
                <td>
                        ${iterMovieHall.id}
                </td>
                <td>
                        ${iterMovieHall.seatsCount}
                </td>
                <td>
                    <a href="/admin/halls/${iterMovieHall.id}">Редактировать</a>
                    <form:form method="post" action="/admin/halls/${iterMovieHall.id}/delete">
                        <input type="submit" value="Удалить">
                    </form:form>
                </td>
            </tr>
        </c:forEach>
    </table>

</div>
    <div class="addHalls">
        <form:form method="post" action="/admin/halls" modelAttribute="movieHall">
            <form:label cssStyle="background-color: darkgray" path="seatsCount">Количество мест</form:label>
            <form:input path="seatsCount"></form:input>
            <button type="submit">Добавить</button>
        </form:form>
    </div>
</main>
<footer>
    <h2 class="footer">Москва 2021</h2>
</footer>
</body>
</html>
