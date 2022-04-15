<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Product</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
          crossorigin="anonymous">
</head>
<body>
<div class="shadow container table-responsive py-5">
    <div class="panel-heading">
        <h1 class="panel-title text-center">Edit Product</h1>
    </div>
    <div class="panel-body">
        <a role="button" class="btn btn-dark" href="/products">Back to Product list</a>

        <form class="form-horizontal mt-3" role="form" method="post">
            <fieldset>

                <div class="form-group row">
                    <label for="name" class="col-sm-3 control-label text-right"></label>
                    <div class="col-sm-9">
                        <h4>Product Details</h4>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="name" class="col-sm-3 control-label text-right">Name</label>
                    <div class="col-sm-9">
                        <input  type="text" class="form-control" name="name" id="name"
                               value="${requestScope["product"].getName()}">
                        <small class="text-danger">${error.get("name")}</small>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="price" class="col-sm-3 control-label text-right">Price</label>
                    <div class="col-sm-9">
                        <input  type="text" class="form-control" name="price" id="price"
                               value="${requestScope["product"].getPrice()}">
                        <small class="text-danger">${error.get("price")}</small>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="describe" class="col-sm-3 control-label text-right">Describe</label>
                    <div class="col-sm-9">
                        <input  type="text" class="form-control" name="describe" id="describe"
                               value="${requestScope["product"].getDescription()}">
                        <small  class="text-danger">${error.get("describe")}</small>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="manufacture" class="col-sm-3 control-label text-right">Manufacture</label>
                    <div class="col-sm-9">
                        <input  type="text" class="form-control" name="manufacture" id="manufacture"
                               value="${requestScope["product"].getManufactor()}">
                        <small class="text-danger">${error.get("manufacture")}</small>

                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-3 control-label text-right"></label>
                    <div class="col-sm-9">
                        <button class="btn btn-primary" type="submit">Confirm Edit</button>
                        <p class="d-inline">
                            <c:if test='${requestScope["message"] != null}'>
                                <span class="alert alert-success">${requestScope["message"]}</span>
                            </c:if>
                        </p>
                    </div>
                </div>
            </fieldset>
        </form>
    </div>
</div>
</body>
</html>
