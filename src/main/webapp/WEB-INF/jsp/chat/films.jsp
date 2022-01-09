<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: qsymond
  Date: 19.11.2021
  Time: 16:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        </tr>
        <c:forEach items="${movies}" var="iterMovie">
            <tr>
                <td>
                        ${iterMovie.id}
                </td>
                <td>
                    <c:if test="${iterMovie.hasImage == true}">
                        <img src='/films/${iterMovie.id}/image' style="height: 100px; width: 150px;">
                    </c:if>
                    <c:if test="${iterMovie.hasImage == false}">
                        <img src="${pageContext.request.contextPath}/img/image.png" style="height: 100px; width: 150px;">
                    </c:if>
                </td>
                <td>
                    <p>${iterMovie.title}</p>
                    <a style="text-decoration: darkorange; color: darkred" href="/films/${iterMovie.id}/chat">Обсудить</a>
                </td>
                <td>
                        ${iterMovie.dateOfRelease.toLocaleString().split(" ")[0]}
                </td>
                <td>
                        ${iterMovie.restrictions}
                </td>
                <td>
                        ${iterMovie.description}
                </td>
            </tr>
        </c:forEach>
    </table>
</main>
<footer>
    <h2 class="footer">Москва 2021</h2>
</footer>
</body>
</html>
