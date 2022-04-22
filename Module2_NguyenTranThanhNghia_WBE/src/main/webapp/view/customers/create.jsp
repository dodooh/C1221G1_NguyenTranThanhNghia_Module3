<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<c:import url="../../components/head.jsp"/> <%--Header--%>
<body class="text-light">
<c:import url="../../components/header.jsp"/> <%--Header--%>
<c:import url="../../components/navbar_customer.jsp">
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
                        <h4 class="col-sm-9 control-label px-0 mx-0">Add ${title} Information</h4>
                    </div>
                </div>
                    <div class="form-group row">
                        <label for="customer_code"
                               class="col-sm-3 col-form-label text-right">Customer Code</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="customer_code"
                                   name="customer_code" value="${customer.customerCode}">
                            <small class="text-danger">${errors.get("customer_code")}</small>
                        </div>
                    </div>
                <div class="form-group row">
                    <label for="customer_name"
                           class="col-sm-3 col-form-label text-right" >Name</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="customer_name"
                               name="customer_name" value="${customer.customerName}">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="date_of_birth"
                           class="col-sm-3 col-form-label text-right">Birthday</label>
                    <div class="col-sm-9">
                        <input type="date" class="form-control" id="date_of_birth"
                               name="date_of_birth"
                               value="${customer.customerDob}">
                        <small class="text-danger">${errors.get("date_of_birth")}</small>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="male"
                           class="col-sm-3 col-form-label text-right">Gender</label>
                    <c:if test="${customer.customerGender eq 1}">
                        <c:set scope="page" var="isMale" value="checked"/>
                    </c:if>
                    <c:if test="${customer.customerGender eq 0}">
                        <c:set scope="page" var="isFemale" value="checked"/>
                    </c:if>
                    <div class="col-sm-9 d-flex align-items-center">
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="gender" value="1"
                                   id="male" ${isMale}>
                            <label class="form-check-label" for="male">
                                Male&nbsp;
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="gender" value="0"
                                   id="flexRadioDefault2" ${isFemale}>
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
                               name="identify_number"  value="${customer.customerIdCard}">
                        <small class="text-danger">${errors.get("identify_number")}</small>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="phone_number"
                           class="col-sm-3 col-form-label text-right">Phone Number</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="phone_number"
                               name="phone_number" value="${customer.customerPhone}">
                        <small class="text-danger">${errors.get("phone_number")}</small>

                    </div>
                </div>
                <div class="form-group row">
                    <label for="email"
                           class="col-sm-3 col-form-label text-right">Email</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="email"
                               name="email" value="${customer.customerMail}">
                        <small class="text-danger">${errors.get("email")}</small>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="address"
                           class="col-sm-3 col-form-label text-right">Address</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="address"
                               name="address" value="${customer.customerAddress}">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="address"
                           class="col-sm-3 col-form-label text-right">Customer Type</label>
                    <div class="col-sm-9">
                        <select name="customer_type_id" class="form-select"
                                aria-label="Default select example">
                            <option>Choose Customer Type</option>
                            <c:forEach items="${customerTypes}" var="type">
                                <c:choose>
                                    <c:when test="${type.customerTypeId eq customer.customerTypeId}">
                                        <option value="${type.customerTypeId}"
                                                selected>${type.customerTypeName}</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${type.customerTypeId}">${type.customerTypeName}</option>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </select>
                        <small class="text-danger">${errors.get("customer_type_id")}</small>

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
