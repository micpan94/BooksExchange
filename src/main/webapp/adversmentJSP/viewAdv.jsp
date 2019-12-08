<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: PanczoPC
  Date: 29.11.2019
  Time: 21:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ogłoszenie</title>

    <style>
        body{
            background-image: url("adversmentJSP/img/lib1.jpg");
            background-size: inherit;
        }
    </style>
</head>
<body>
<div id="advList">

    <c:forEach items="${advList}" var="element">

        <div><h4><a href="http://localhost:3000/advertisement-details/<c:out value="${element.id}"/>"> <c:out
                value="${element.title}"></c:out>
            <c:out value="${element.price}"></c:out> zł</a></h4>
<%--            //img src jest tutaj wyznaczikime od katalohu webapp--%>
            <img src="adversmentJSP/img/logo.jpg" width="50" height="70">
        </div>


    </c:forEach>

</div>


</body>
</html>
