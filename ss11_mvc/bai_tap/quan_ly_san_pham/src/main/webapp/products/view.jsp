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
<div class="shadow container table-responsive py-5">
    <h1 class="panel-title text-center">Product details</h1>
    <p>
        <a role="button" class="btn btn-dark" href="/products">Back to Product list</a>
    </p>
    <table class="table table-striped">
        <thead class="thead-dark">
        <tr>
            <th scope="col">Name</th>
            <th scope="col">Price</th>
            <th scope="col">Describe</th>
            <th scope="col">Manufacture</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>${requestScope["product"].getName()}</td>
            <td>${requestScope["product"].getPrice()}</td>
            <td>${requestScope["product"].getDescription()}</td>
            <td>${requestScope["product"].getManufactor()}</td>
        </tr>
        </tbody>
    </table>
</div>
</body>
</html>