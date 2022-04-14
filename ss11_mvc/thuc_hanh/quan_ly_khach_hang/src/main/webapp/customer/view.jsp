<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage="../error-404.jsp" %>

<html>
<head>

    <title>View customer</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
          crossorigin="anonymous">
</head>
<body>
<c:set var="title" value="Customer Info" scope="request"/>
<jsp:include page="../header.jsp">
    <jsp:param name="title" value="${title}"/>
</jsp:include>
<div class="shadow container table-responsive py-5">
    <h1 class="panel-title text-center">Customer details</h1>
    <p>
        <a role="button" class="btn btn-dark" href="/customers">Back to customer list</a>
    </p>
    <table class="table table-striped">
        <thead class="thead-dark">
        <tr>
            <th scope="col">Name</th>
            <th scope="col">Email</th>
            <th scope="col">Address</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>${requestScope["customer"].getName()}</td>
            <td>${requestScope["customer"].getEmail()}</td>
            <td>${requestScope["customer"].getAddress()}</td>

        </tr>
        </tbody>
    </table>
</div>
</body>
</html>