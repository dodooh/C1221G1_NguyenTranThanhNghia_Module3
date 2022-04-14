<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit customer</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
          crossorigin="anonymous">
</head>
<body>
<c:set var="title" value="Editing Mode" scope="request"/>
<jsp:include page="../header.jsp">
    <jsp:param name="title" value="${title}"/>
</jsp:include>
<div class="shadow container table-responsive py-5">
    <div class="panel-heading">
        <h1 class="panel-title text-center">Edit customer</h1>
    </div>
    <div class="panel-body">
        <a role="button" class="btn btn-dark" href="/customers">Back to customer list</a>

        <form class="form-horizontal mt-3" role="form" method="post">
            <fieldset>

                <div class="form-group row">
                    <label for="name" class="col-sm-3 control-label text-right"></label>
                    <div class="col-sm-9">
                        <h4>Customer information</h4>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="name" class="col-sm-3 control-label text-right">Name</label>
                    <div class="col-sm-9">
                        <input required type="text" class="form-control" name="name" id="name"
                               value="${requestScope["customer"].getName()}">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="email" class="col-sm-3 control-label text-right">Email</label>
                    <div class="col-sm-9">
                        <input required type="text" class="form-control" name="email" id="email"
                               value="${requestScope["customer"].getEmail()}">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="address" class="col-sm-3 control-label text-right">Address</label>
                    <div class="col-sm-9">
                        <input required type="text" class="form-control" name="address" id="address"
                               value="${requestScope["customer"].getAddress()}">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="address" class="col-sm-3 control-label text-right"></label>
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