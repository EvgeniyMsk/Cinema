<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: qsymond
  Date: 21.11.2021
  Time: 13:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%request.setCharacterEncoding("UTF-8");%>
<html>
<head>
    <title>Редактирование кинозала</title>
</head>
<body>
<form:form method="post" action="/admin/halls/${movieHall.id}/update" modelAttribute="movieHall">
    <form:label path="seatsCount">Количество мест</form:label>
    <form:input path="seatsCount"></form:input>
    <button type="submit">Обновить</button>
</form:form>
</body>
</html>
