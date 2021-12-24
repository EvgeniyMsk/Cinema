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
</head>
<body>
Films
<a href="/">На главную</a>
<div class="movies">
    <h1>Список фильмов</h1>
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
                    <a href="/films/${iterMovie.id}/chat">${iterMovie.title}</a>
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
</div>
</body>
</html>
