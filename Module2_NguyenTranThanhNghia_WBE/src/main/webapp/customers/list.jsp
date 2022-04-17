<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>Customer | List</title>
    <link rel="icon" type="image/x-icon" href="/favicon.ico">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <style>
        <%@include file="/WEB-INF/css/bootstrap.min.css" %>
        <%@include file="/WEB-INF/css/style.css" %>
    </style>
</head>

<body class="text-light">
<c:import url="../components/header.jsp"/> <%--Header--%>
<c:import url="../components/navbar.jsp">
</c:import> <%--Navbar--%>
<div class="container-fluid px-0 bg-dark" style="margin-top: 144px; min-height: calc(100vh - 144px - 50px);"">
    <div class="w-100 p-5 d-flex flex-wrap" style="overflow: auto;">
        <a href="/${urlPath}?action=create" class="btn btn-light">Create New ${title}</a>
        <div class="container-fluid mt-5 px-1">
            <table class="table table-bordered table-dark">
                <thead class="thead-light">
                <th scope="col">ID</th>
                <th scope="col">Name</th>
                <th scope="col">DOB</th>
                <th scope="col">Gender</th>
                <th scope="col">National ID</th>
                <th scope="col">Phone</th>
                <th scope="col">Email</th>
                <th scope="col">Address</th>
                <th scope="col">Type</th>
                <th scope="col">Function</th>
                </thead>
                <tbody>
                <c:forEach var="customer" items="${customers}">
                    <tr>
                        <td>${customer.getCustomerId()}</td>
                        <td>${customer.getCustomerName()}</td>
                        <td>${customer.getCustomerDob()}</td>
                        <td>${customer.getCustomerGender() == 1 ? "Male" : "Female"}</td>
                        <td>${customer.getCustomerIdCard()}</td>
                        <td>${customer.getCustomerPhone()}</td>
                        <td>${customer.getCustomerMail()}</td>
                        <td>${customer.getCustomerAddress()}</td>

                        <c:forEach var="customerType" items="${customerTypes}">
                            <c:if test="${customerType.getCustomerTypeId() eq customer.getCustomerTypeId()}">
                                <td>${customerType.getCustomerTypeName()}</td>
                            </c:if>
                        </c:forEach>

                        <td>
                            <a role="button" class="btn btn-warning" href="/customers?action=edit?id=${customer.getCustomerId()}"><i class="bi bi-tools"></i></a>
                            |
                            <a role="button" class="btn btn-danger" href="/customers?action=delete?id=${customer.getCustomerId()}"><i class="bi bi-trash3"></i></a>

                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<c:import url="../components/footer.jsp"/> <%--Footer--%>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/WEB-INF/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/WEB-INF/js/jquery-3.6.0.min.js"></script>
</body>

</html>
