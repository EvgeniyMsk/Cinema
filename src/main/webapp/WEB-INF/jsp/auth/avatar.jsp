<%--
  Created by IntelliJ IDEA.
  User: qsymond
  Date: 09.01.2022
  Time: 10:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Фото</title>
</head>
<body>
<img src="/auth/profile/photo/${filename}" onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/img/image.png';">
</body>
</html>
