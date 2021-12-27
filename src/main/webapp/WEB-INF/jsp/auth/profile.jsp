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
<a href="/">На главную</a>
<table>
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
<form action="/auth/logout" method="POST">
    <input type="submit" value="Выйти">
</form>
</body>
</html>
