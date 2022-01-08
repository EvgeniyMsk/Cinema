<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Обсуждение фильма</title>
</head>
<body>
<h1>Обсуждение фильма</h1>
<script>
    let movieId = ${movie.id};
    let cinemausername = '${cinemausername}';
</script>
<div>
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
                        <img src='/films/${movie.id}/image' style="height: 100px; width: 150px;">
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
</div>
<%--<div id="username-page">--%>
<%--    <div class="username-page-container">--%>
<%--        <h1 class="title">Type your username</h1>--%>
<%--        <form id="usernameForm" name="usernameForm">--%>
<%--            <div class="form-group">--%>
<%--                <input type="text" id="name" placeholder="Username" autocomplete="off" class="form-control" />--%>
<%--            </div>--%>
<%--            <div class="form-group">--%>
<%--                <button type="submit" class="accent username-submit">Start Chatting</button>--%>
<%--            </div>--%>
<%--        </form>--%>
<%--    </div>--%>
<%--</div>--%>
<div id="chat-page" class="hidden">
    <div class="chat-container">
        <div class="chat-header">
            <h2>Spring WebSocket Chat Demo</h2>
        </div>
<%--        <div class="connecting">--%>
<%--            Connecting...--%>
<%--        </div>--%>
        <ul id="messageArea">
        </ul>
        <form id="messageForm" name="messageForm">
            <div class="form-group">
                <div class="input-group clearfix">
                    <input type="text" id="message" placeholder="Type a message..." autocomplete="off" class="form-control"/>
                    <button type="submit" class="primary">Send</button>
                </div>
            </div>
        </form>
    </div>
</div>


<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script src="/js/main.js"></script>
</body>
</html>
