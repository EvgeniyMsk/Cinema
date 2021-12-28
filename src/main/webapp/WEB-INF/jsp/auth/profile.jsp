<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        .form-test input {
            font: 14px Arial;
            border: none;
            padding: 0;
            background: #ffffff;
            color: #00f;
        }
    </style>
</head>
<body>
<div>
<a href="/">На главную</a>
<form action="/auth/logout" method="POST">
    <input type="submit" value="Выйти">
</form>
</div>
<div>
    <img src="${pageContext.request.contextPath}/img/image.png">
    <form method="post" action="/auth/profile/avatar" enctype="multipart/form-data">
        <input type="file" name="file" accept="image/*">
        <button type="submit">Загрузить</button>
    </form>
</div>
<h1>Информация о пользователе</h1>
<div>
    <table border="3">
        <tr>
            <th>
                ID
            </th>
            <th>
                Права доступа
            </th>
            <th>
                Логин
            </th>
            <th>
                Пароль
            </th>
        </tr>
        <tr>
            <td>
                ${user.id}
            </td>
            <td>
                ${user.role}
            </td>
            <td>
                ${user.userName}
            </td>
            <td>
                ${user.password}
            </td>
        </tr>
    </table>
</div>
<h1>История входов</h1>
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
        <c:forEach items="${user.authHistory}" var="iterAuth">
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
        </c:forEach>
    </table>
</div>

</body>
</html>
