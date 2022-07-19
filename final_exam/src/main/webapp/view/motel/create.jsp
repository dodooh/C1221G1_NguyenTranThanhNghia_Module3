<%--
  Created by IntelliJ IDEA.
  User: King
  Date: 4/24/2022
  Time: 2:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <c:import url="../../components/head.jsp"/> <%--Header--%>
    <title>CREATE</title>
</head>
<body>
<div class="container shadow table-responsive py-3">
    <section class="panel panel-default">
        <div class="panel-heading">
            <h1 class="panel-title text-center">Create New Motel</h1>
        </div>
        <div class="panel-body">
            <a role="button" class="btn btn-dark" href="/motel">Back to Motel List</a>
            <form class="form-horizontal" role="form" method="post">
                <fieldset>
                    <div class="form-group row">
                        <label for="name" class="col-sm-3 control-label text-right"></label>
                        <div class="col-sm-9">
                            <h4 class="col-sm-9 control-label px-0 mx-0">Motel Information</h4>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="name" class="col-sm-3 control-label text-right">Motel ID</label>
                        <div class="col-sm-3">
                            <input disabled type="text" class="form-control" name="name" id="name">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="customer_name" class="col-sm-3 control-label text-right">Customer Name</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="customer_name" id="customer_name"
                                   placeholder="Enter Customer Name">
                            <small class="text-danger">${error.get("customer_name")}</small>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="phone"
                               class="col-sm-3 control-label text-right">Phone</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" name="phone"
                                   id="phone"
                                   placeholder="Enter Phone">
                            <small class="text-danger">${error.get("phone")}</small>

                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="rent_date"
                               class="col-sm-3 control-label text-right">Rent Date</label>
                        <div class="col-sm-3">
                            <input type="date" class="form-control" name="rent_date"
                                   id="rent_date">
                            <small class="text-danger">${error.get("rent_date")}</small>

                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="rent_type"
                               class="col-sm-3 control-label text-right">Rent Type</label>
                        <div class="col-sm-6">
                            <select id="rent_type" name="rent_type" class="form-select"
                                    aria-label="Default select example">
                                <option value="0">Choose Rent Type</option>
                                <c:forEach items="${rentTypes}" var="rentType">
                                    <c:choose>
                                        <c:when test="${rentType.rentTypeId eq motel.rentTypeId}">
                                            <option value="${rentType.rentTypeId}"
                                                    selected>${rentType.rentTypeName}</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${rentType.rentTypeId}">${rentType.rentTypeName}</option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select>
                            <small class="text-danger">${error.get("rent_type")}</small>

                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="note"
                               class="col-sm-3 control-label text-right">Note</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="note"
                                   id="note"
                                   placeholder="Enter Note">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 control-label text-right"></label>
                        <div class="col-sm-9">
                            <button class="btn btn-primary" type="submit">Add New Product</button>
                            <span class="text-success">${msg_success}</span>
                            <span class="text-danger">${msg_error}</span>
                        </div>

                    </div>
                </fieldset>
            </form>
        </div>
    </section>
</div>
</body>
</html>
