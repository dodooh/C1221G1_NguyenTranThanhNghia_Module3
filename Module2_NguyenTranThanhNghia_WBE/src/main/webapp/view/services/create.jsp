<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<c:import url="../../components/head.jsp"/> <%--Header--%>

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
                        <h4 class="col-sm-9 control-label px-0 mx-0">Add ${title} Information</h4>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="service_name"
                           class="col-sm-3 col-form-label text-right">Name</label>
                    <div class="col-sm-5">
                        <input type="text" class="form-control" id="service_name"
                               name="service_name">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="area"
                           class="col-sm-3 col-form-label text-right">Area</label>
                    <div class="col-sm-3">
                        <input type="number" class="form-control" id="area"
                               name="area">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="price"
                           class="col-sm-3 col-form-label text-right">Price</label>
                    <div class="col-sm-3">
                        <input type="number" step="0.01" class="form-control" id="price"
                               name="price">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="people_allowed"
                           class="col-sm-3 col-form-label text-right">People Allowed</label>
                    <div class="col-sm-3">
                        <input type="number" class="form-control" id="people_allowed"
                               name="people_allowed">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="rent_type_id"
                           class="col-sm-3 col-form-label text-right">Rent Type</label>
                    <div class="col-sm-9">
                        <select name="rent_type_id" class="form-select"
                                aria-label="Default select example" id="rent_type_id">
                            <option selected>Choose Rent Type</option>
                            <c:forEach items="${rentTypes}" var="rentType">
                                <option value="${rentType.rentTypeId}">${rentType.rentTypeName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="service_type_id"
                           class="col-sm-3 col-form-label text-right">Service Type</label>
                    <div class="col-sm-9">
                        <select name="service_type_id" class="form-select"
                                aria-label="Default select example" id="service_type_id">
                            <option selected>Choose Service Type</option>
                            <c:forEach items="${serviceTypes}" var="serviceType">
                                <option value="${serviceType.serviceTypeId}">${serviceType.serviceTypeName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div id="villa_facility" style="display: none">
                    <div class="form-group row">
                        <label for="standard_room"
                               class="col-sm-3 col-form-label text-right">Standard Room</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="standard_room"
                                   name="standard_room">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="describe"
                               class="col-sm-3 col-form-label text-right">Convenient
                            Describe</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="describe"
                                   name="describe">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="pool_area"
                               class="col-sm-3 col-form-label text-right">Pool Area</label>
                        <div class="col-sm-3">
                            <input type="number" step="0.1" class="form-control" id="pool_area"
                                   name="pool_area">
                        </div>
                    </div>
                </div>
                <div id="house_facility" style="display: none">
                    <div class="form-group row">
                        <label for="standard_roo2m"
                               class="col-sm-3 col-form-label text-right">Standard Room</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="standard_roo2m"
                                   name="standard_room">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="floors"
                               class="col-sm-3 col-form-label text-right">Floors</label>
                        <div class="col-sm-3">
                            <input type="number" class="form-control" id="floors"
                                   name="floors">
                        </div>
                    </div>
                </div>
                <div id="room_facility" style="display: none">
                    <div class="form-group row">
                        <label for="describe1"
                               class="col-sm-3 col-form-label text-right">Convenient
                            Describe</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="describe1"
                                   name="describe">
                        </div>
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
<script>
    $(document).ready(function() {
        $('#service_type_id').change(function() {
          if (this.value == 1) {
            $('#villa_facility').css({"display": "block"});
            $('#house_facility').css({"display": "none"});
            $('#room_facility').css({"display": "none"});
          } else if (this.value == 2) {
            $('#villa_facility').css({"display": "none"});
            $('#house_facility').css({"display": "block"});
            $('#room_facility').css({"display": "none"});
          } else {
            $('#villa_facility').css({"display": "none"});
            $('#house_facility').css({"display": "none"});
            $('#room_facility').css({"display": "block"});
          }
        })
    })
</script>
</html>
