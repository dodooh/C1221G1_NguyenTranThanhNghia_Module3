<%--
  Created by IntelliJ IDEA.
  User: King
  Date: 4/14/2022
  Time: 10:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create New Product</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
          crossorigin="anonymous">
</head>
<body>
<div class="container shadow table-responsive py-5">
    <section class="panel panel-default">
        <div class="panel-heading">
            <h1 class="panel-title text-center">Create new product</h1>
        </div>
        <div class="panel-body">
            <p>
                <a role="button" class="btn btn-dark" href="/customers">Back to product list</a>
            </p>
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
                            <input <%--required--%> type="text" class="form-control" name="name" id="name"
                                   placeholder="Please enter name" value="${name}">
                            <small class="text-danger">${error.get("name")}</small>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="price" class="col-sm-3 control-label text-right">Price</label>
                        <div class="col-sm-9">
                            <input <%--required--%> type="text" class="form-control" name="price" id="price"
                                   placeholder="Please enter price" value="${price}">
                            <small class="text-danger">${error.get("price")}</small>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="describe"
                               class="col-sm-3 control-label text-right">Describe</label>
                        <div class="col-sm-9">
                            <input <%--required--%> type="text" class="form-control" name="describe" id="describe"
                                   placeholder="Please enter describe" value="${describe}">
                            <small  class="text-danger">${error.get("describe")}</small>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="manufacture"
                               class="col-sm-3 control-label text-right">Manufacture</label>
                        <div class="col-sm-9">
                            <input <%--required--%> type="text" class="form-control" name="manufacture" id="manufacture"
                                   placeholder="Please enter manufacture" value="${manufacture}">
                            <small class="text-danger">${error.get("manufacture")}</small>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 control-label text-right"></label>
                        <div class="col-sm-9">
                            <button class="btn btn-primary" type="submit">Add New Customer</button>
                            <p class="d-inline">
                                <c:if test='${requestScope["message"] != null}'>
                                    <span class="alert alert-success">${requestScope["message"]}</span>
                                </c:if>
                            </p>
                        </div>

                    </div>

                </fieldset>

            </form>
    </section>
</div>
</body>
</html>
