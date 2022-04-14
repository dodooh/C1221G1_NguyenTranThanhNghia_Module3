<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage = "../error-404.jsp" %>

<html>
<head>
    <title>Create new customer</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
          crossorigin="anonymous">
</head>
<body>
<jsp:include page="../header.jsp">
    <jsp:param name="title" value="${1}"/>
</jsp:include>
<div class="container shadow  table-responsive py-5">
    <section class="panel panel-default">
        <div class="panel-heading">
            <h1 class="panel-title text-center">Create new customer</h1>
        </div>
        <div class="panel-body">

            <p>
                <a role="button" class="btn btn-dark" href="/customers">Back to customer list</a>
            </p>
            <form class="form-horizontal" role="form" method="post">
                <fieldset>
                    <div class="form-group row">
                        <label for="name" class="col-sm-3 control-label text-right"></label>
                        <div class="col-sm-9">
                            <h4 class="col-sm-9 control-label px-0 mx-0">Customer Information</h4>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="name" class="col-sm-3 control-label text-right">Name</label>
                        <div class="col-sm-9">
                            <input required type="text" class="form-control" name="name" id="name"
                                   placeholder="Please enter name">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="email" class="col-sm-3 control-label text-right">Email</label>
                        <div class="col-sm-9">
                            <input required type="text" class="form-control" name="email" id="email"
                                   placeholder="Please enter email">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="address"
                               class="col-sm-3 control-label text-right">Address</label>
                        <div class="col-sm-9">
                            <input required type="text" class="form-control" name="address" id="address"
                                   placeholder="Please enter address">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="address" class="col-sm-3 control-label text-right"></label>
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