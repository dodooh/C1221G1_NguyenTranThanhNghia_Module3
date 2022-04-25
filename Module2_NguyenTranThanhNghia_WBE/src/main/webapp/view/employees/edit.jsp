<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>${title} | Edit </title>
    <link rel="icon" type="image/x-icon" href="/favicon.ico">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
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
        <a href="/${urlPath}" class="btn btn-light">Back to ${title} list</a>
        <div class="container px-1">
            <form method="post" class="bg-dark">
                <%-- customer_id, customer_name, date_of_birth, gender, identify_number, phone_number, email, address, customer_type_id --%>
                <div class="form-group row">
                    <div class="col-sm-3 control-label text-right"></div>
                    <div class="col-sm-9">
                        <h4 class="col-sm-9 control-label px-0 mx-0">Edit Employee Data</h4>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="employee_name"
                           class="col-sm-3 col-form-label text-right">Name</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="employee_name"
                               name="employee_name" value="${employee.employeeName}">
                        <%--                        <small id="emailHelp" class="form-text text-muted">We'll never share your email--%>
                        <%--                            with anyone else.</small>--%>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="date_of_birth"
                           class="col-sm-3 col-form-label text-right">Birthday</label>
                    <div class="col-sm-9">
                        <input type="date" class="form-control" id="date_of_birth"
                               name="date_of_birth" value="${employee.employeeDob}">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="nation_id"
                           class="col-sm-3 col-form-label text-right">National ID Number</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="nation_id"
                               name="identify_number" value="${employee.employeeIdCard}">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="salary"
                           class="col-sm-3 col-form-label text-right">Salary</label>
                    <div class="col-sm-9">
                        <fmt:formatNumber var="salary" value="${employee.getEmployeeSalary()}"
                                         type="number" pattern="0"/>
                        <input type="number" step="0.01" class="form-control" id="salary"
                               name="salary" value="${salary}">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="phone_number"
                           class="col-sm-3 col-form-label text-right">Phone Number</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="phone_number"
                               name="phone_number" value="${employee.employeePhone}">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="email"
                           class="col-sm-3 col-form-label text-right">Email</label>
                    <div class="col-sm-9">
                        <input type="email" class="form-control" id="email"
                               name="email" value="${employee.employeeMail}">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="address"
                           class="col-sm-3 col-form-label text-right">Address</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="address"
                               name="address" value="${employee.employeeAddress}">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="position-id"
                           class="col-sm-3 col-form-label text-right">Position</label>
                    <div class="col-sm-9">
                        <select name="position_id" class="form-select"
                                aria-label="Default select example" id="position-id">
                            <option selected>Choose Position</option>
                            <c:forEach items="${positions}" var="position">
                                <c:choose>
                                    <c:when test="${position.positionId eq employee.employeePositionId}">
                                        <option value="${position.positionId}"
                                                selected>${position.positionName}</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${position.positionId}">${position.positionName}</option>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="education-degree-id"
                           class="col-sm-3 col-form-label text-right">Education Degree</label>
                    <div class="col-sm-9">
                        <select name="education_degree_id" class="form-select"
                                aria-label="Default select example" id="education-degree-id">
                            <option selected>Choose Education Degree</option>
                            <c:forEach items="${educationDegrees}" var="educationDegree">
                                <c:choose>
                                    <c:when test="${educationDegree.educationDegreeId eq employee.employeeEducationDegreeId}">
                                        <option value="${educationDegree.educationDegreeId}"
                                                selected>${educationDegree.educationDegreeName}</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${educationDegree.educationDegreeId}">${educationDegree.educationDegreeName}</option>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="division-id"
                           class="col-sm-3 col-form-label text-right">Division</label>
                    <div class="col-sm-9">
                        <select name="division_id" class="form-select"
                                aria-label="Default select example" id="division-id">
                            <option selected>Choose Division</option>
                            <c:forEach items="${departments}" var="department">
                                <c:choose>
                                    <c:when test="${department.departmentId eq employee.employeeDivisionId}">
                                        <option value="${department.departmentId}"
                                                selected>${department.departmentName}</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${department.departmentId}">${department.departmentName}</option>
                                    </c:otherwise>
                                </c:choose>
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
<script type="text/javascript"
        src="${pageContext.request.contextPath}/WEB-INF/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/WEB-INF/js/jquery-3.6.0.min.js"></script>
</body>

</html>
