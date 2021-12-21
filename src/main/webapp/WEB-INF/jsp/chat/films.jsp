<%@ page import="java.util.Base64" %>
<%@ page import="java.util.List" %>
<%@ page import="edu.school21.cinema.models.Movie" %>
<%@ page import="org.apache.commons.io.FileUtils" %>
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
    <%
        List<String> images = (List<String>) request.getAttribute("images");
        int index = 0;
    %>
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
                        <img src="data:image/png;base64,<%=images.get(index)%>" style="height: 100px; width: 150px;">
                        <%
                            index++;
                        %>
                    </c:if>
                    <c:if test="${iterMovie.hasImage == false}">
                        <img src="${pageContext.request.contextPath}/img/image.png" style="height: 100px; width: 150px;">
                        <%
                            index++;
                        %>
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
</div>
</body>
</html>
