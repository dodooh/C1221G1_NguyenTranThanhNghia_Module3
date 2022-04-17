<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>Customer | Create </title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <style>
        <%@include file="/WEB-INF/css/bootstrap.min.css" %>
        <%@include file="/WEB-INF/css/style.css" %>
    </style>
</head>
<body class="text-light">
<c:import url="../components/header.jsp"/> <%--Header--%>
<c:import url="../components/navbar.jsp">
</c:import> <%--Navbar--%>
<div class="container-fluid px-0 bg-dark"
     style="margin-top: 144px;min-height: calc(100vh - 144px - 50px);">
    <div class="w-100 p-5">
        <a href="/customers" class="btn btn-light">Back to customer list</a>
        <div class="container px-1">
            <form method="post" class="bg-dark">
<%-- customer_id, customer_name, date_of_birth, gender, identify_number, phone_number, email, address, customer_type_id --%>
                <div class="form-group row">
                    <label class="col-sm-3 control-label text-right"></label>
                    <div class="col-sm-9">
                        <h4 class="col-sm-9 control-label px-0 mx-0">Add Customer Information</h4>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="customer_name" class="col-sm-3 col-form-label text-right">Name</label>
                    <div class="col-sm-9">
                        <input type="email" class="form-control" id="customer_name"
                               name="name">
<%--                        <small id="emailHelp" class="form-text text-muted">We'll never share your email--%>
<%--                            with anyone else.</small>--%>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="customer_dob" class="col-sm-3 col-form-label text-right">Birthday</label>
                    <div class="col-sm-9">
                        <input type="date" class="form-control" id="customer_dob" name="dob">
                        <%--                        <small id="emailHelp" class="form-text text-muted">We'll never share your email--%>
                        <%--                            with anyone else.</small>--%>
                    </div>
                </div>
                <div class="form-group form-check">
                    <input type="checkbox" class="form-check-input" id="exampleCheck1">
                    <label class="form-check-label" for="exampleCheck1">Check me out</label>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
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
