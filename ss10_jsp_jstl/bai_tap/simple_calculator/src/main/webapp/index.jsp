<%--
  Created by IntelliJ IDEA.
  User: King
  Date: 4/13/2022
  Time: 11:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
          crossorigin="anonymous">
    <title>Simple Calculator</title>
</head>
<body>
<div class="container" style="width: 50%; margin-top: 15vh;">
    <h1 class="text-center">Simple Calculator</h1>
    <form action="/calculate" method="post">
        <div class="form-group">
            <label for="number1-input-id">First Operand</label>
            <input name="number1" type="number" class="form-control" id="number1-input-id"
                   placeholder="Number1">
        </div>
        <div class="form-group">
            <label for="exampleOperator">Operator</label>
            <select name="operator" class="form-control" id="exampleOperator">
                <option value="+">+</option>
                <option value="-">-</option>
                <option value="*">*</option>
                <option value="/">/</option>
            </select>
        </div>
        <div class="form-group">
            <label for="number2-input-id">Second Operand</label>
            <input name="number2" type="number" class="form-control" id="number2-input-id"
                   placeholder="Number 2">
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
    <c:choose>
        <c:when test="${not empty  error_msg}">
            <div class="alert alert-danger" role="alert">
                <div class="display-4"><c:out value="${error_msg}"/></div>
            </div>
        </c:when>
        <c:when test="${not empty  result}">
            <div class="alert alert-success" role="alert">
                <div class="display-4"><c:out value="${result}"/></div>
            </div>
        </c:when>
    </c:choose>

</div>
</body>
</html>
