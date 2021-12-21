<%@ page import="java.util.Base64" %>
<%@ page import="java.util.List" %>
<%@ page import="edu.school21.cinema.models.Movie" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: qsymond
  Date: 21.11.2021
  Time: 14:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Редактирование фильма</title>
</head>
<body>
<%
%>
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
                    <c:if test="${movie.hasImage == true}">
                        <img src="data:image/png;base64,<%=request.getAttribute("image")%>" style="height: 100px; width: 150px;">
                    </c:if>
                    <c:if test="${movie.hasImage == false}">
                        <img src="${pageContext.request.contextPath}/img/image.png" style="height: 100px; width: 150px;">
                    </c:if>
                </div>
            </td>
            <td>
                ${movie.title}
            </td>
            <td>
                ${movie.dateOfRelease.year + 1900}-<c:if test="${movie.dateOfRelease.month + 1 > 9}">${movie.dateOfRelease.month + 1}</c:if><c:if test="${movie.dateOfRelease.month + 1 < 10}">0${movie.dateOfRelease.month + 1}</c:if>-<c:if test="${movie.dateOfRelease.day > 9}">${movie.dateOfRelease.day}</c:if><c:if test="${movie.dateOfRelease.day < 10}">0${movie.dateOfRelease.day}</c:if>
            </td>
            <td>
                ${movie.restrictions}
            </td>
            <td>
                ${movie.description}
            </td>
        </tr>
    </table>
</body>
</html>
