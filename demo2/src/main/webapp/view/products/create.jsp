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
            <h1 class="panel-title text-center">Create New Product</h1>
        </div>
        <div class="panel-body">
            <a role="button" class="btn btn-dark" href="/products">Back to Product List</a>
            <form class="form-horizontal" role="form" method="post">
                <fieldset>
                    <div class="form-group row">
                        <label for="name" class="col-sm-3 control-label text-right"></label>
                        <div class="col-sm-9">
                            <h4 class="col-sm-9 control-label px-0 mx-0">Product Information</h4>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="name" class="col-sm-3 control-label text-right">Name</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="name" id="name"
                                   placeholder="Please enter product name">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="price" class="col-sm-3 control-label text-right">Price</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" name="price" id="price"
                                   placeholder="Enter price">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="quantity"
                               class="col-sm-3 control-label text-right">Quantity</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" name="quantity"
                                   id="quantity"
                                   placeholder="Enter quantity">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="color"
                               class="col-sm-3 control-label text-right">Color</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" name="color"
                                   id="color"
                                   placeholder="Please enter color">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="category"
                               class="col-sm-3 control-label text-right">Category</label>
                        <div class="col-sm-6">
                            <select id="category" name="category" class="form-select"
                                    aria-label="Default select example">
                                <option>Choose Category</option>
                                <c:forEach items="${categories}" var="category">
                                    <c:choose>
                                        <c:when test="${category.categoryId eq customer.categoryId}">
                                            <option value="${category.categoryId}"
                                                    selected>${category.categoryName}</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${category.categoryId}">${category.categoryName}</option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select>
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
