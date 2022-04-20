<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>Customer | Create </title>
    <link rel="icon" type="image/x-icon" href="/favicon.ico">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
            crossorigin="anonymous"></script>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
          crossorigin="anonymous">
    <style>
        <%@include file="/WEB-INF/css/style.css" %>
    </style>
</head>
<body class="text-light">
<c:import url="../../components/header.jsp"/> <%--Header--%>
<c:import url="../../components/navbar_entity.jsp">
</c:import> <%--Navbar--%>
<div class="container-fluid h-100 px-0 bg-dark"
     style="margin-top: 144px; ">
    <div class="w-100 p-5">
        <a href="/customers" class="btn btn-light">Back to customer list</a>
        <div class="container px-1">
            <form method="post" class="bg-dark">
                <%-- customer_id, customer_name, date_of_birth, gender, identify_number, phone_number, email, address, customer_type_id --%>
                <div class="form-group row">
                    <div class="col-sm-3 control-label text-right"></div>
                    <div class="col-sm-9">
                        <h4 class="col-sm-9 control-label px-0 mx-0">Add Customer Information</h4>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="customer_name"
                           class="col-sm-3 col-form-label text-right">Name</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="customer_name"
                               name="customer_name">
                        <%--                        <small id="emailHelp" class="form-text text-muted">We'll never share your email--%>
                        <%--                            with anyone else.</small>--%>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="date_of_birth"
                           class="col-sm-3 col-form-label text-right">Birthday</label>
                    <div class="col-sm-9">
                        <input type="date" class="form-control" id="date_of_birth"
                               name="date_of_birth">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="male"
                           class="col-sm-3 col-form-label text-right">Gender</label>
                    <div class="col-sm-9 d-flex align-items-center">
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="gender" value="1"
                                   id="male" checked>
                            <label class="form-check-label" for="male">
                                Male&nbsp;
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="gender" value="0"
                                   id="flexRadioDefault2">
                            <label class="form-check-label" for="flexRadioDefault2">
                                Female
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="nation_id"
                           class="col-sm-3 col-form-label text-right">National ID Number</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="nation_id"
                               name="identify_number">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="phone_number"
                           class="col-sm-3 col-form-label text-right">Phone Number</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="phone_number"
                               name="phone_number">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="email"
                           class="col-sm-3 col-form-label text-right">Email</label>
                    <div class="col-sm-9">
                        <input type="email" class="form-control" id="email"
                               name="email">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="address"
                           class="col-sm-3 col-form-label text-right">Address</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="address"
                               name="address">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="address"
                           class="col-sm-3 col-form-label text-right">Customer Type</label>
                    <div class="col-sm-9">
                        <select name="customer_type_id" class="form-select"
                                aria-label="Default select example">
                            <option selected>Choose Customer Type</option>
                            <c:forEach items="${customerTypes}" var="type">
                                <option value="${type.customerTypeId}">${type.customerTypeName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-3 col-form-label text-right"></div>
                    <div class="col-sm-9">
                        <button type="submit" class="btn btn-primary">Submit</button>
                        <p class="d-inline">
                            <c:if test='${requestScope["message"] != null}'>
                                <span class="alert alert-success">${requestScope["message"]}</span>
                            </c:if>
                        </p>
                    </div>
                </div>

            </form>
        </div>
    </div>
</div>

<c:import url="../../components/footer.jsp"/> <%--Footer--%>
</body>

</html>
