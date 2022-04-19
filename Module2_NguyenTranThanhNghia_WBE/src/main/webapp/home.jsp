<%--
  Created by IntelliJ IDEA.
  User: King
  Date: 4/16/2022
  Time: 12:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>Furama Resort Management</title>
    <link rel="icon" type="image/x-icon" href="/favicon.ico">
    <style>
        <%@include file="/WEB-INF/css/bootstrap.min.css" %>
        <%@include file="/WEB-INF/css/style.css" %>
    </style>
</head>

<body class="text-light">
<c:import url="components/header.jsp"/> <%--Header--%>
<c:import url="components/navbar.jsp"/> <%--Navbar--%>
<div class="container-fluid px-0 bg-dark " style="margin-top: 144px;min-height: calc(100vh - 144px - 50px);">
    <div class="d-flex text-light w-100 h-100 justify-content-center" >
        <div class="display-4" style="margin-top: 100px;">Welcome to Furama Resort Management System</div>
    </div>
</div>


<c:import url="components/footer.jsp"/> <%--Footer--%>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/WEB-INF/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/WEB-INF/js/jquery-3.6.0.min.js"></script>
</body>

</html>
