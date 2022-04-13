<%--
  Created by IntelliJ IDEA.
  User: King
  Date: 4/13/2022
  Time: 12:42 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
          crossorigin="anonymous">
    <title>Kết quả</title>
</head>
<div class="container" style="width: 50%; margin-top: 30vh;">
    <c:choose>
        <c:when test="${not empty  error_msg}">
            <div class="alert alert-danger" role="alert">
                <div class="display-4"><c:out value="${error_msg}"/></div>
            </div>
        </c:when>
        <c:otherwise>
            <div class="alert alert-success" role="alert">
                <div class="display-4"><c:out value="${result}"/></div>
            </div>
        </c:otherwise>
    </c:choose>
</div>
<body>

</body>
</html>
