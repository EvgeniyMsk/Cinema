<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
