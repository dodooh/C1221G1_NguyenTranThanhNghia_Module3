<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<c:import url="../../components/head.jsp"/> <%--Header--%>

<body class="text-light">
<c:import url="../../components/header.jsp"/> <%--Header--%>
<c:import url="../../components/navbar_entity.jsp"/> <%--Navbar--%>
<div class="container-fluid px-0 bg-dark"
     style="margin-top: 144px; min-height: calc(100vh - 144px - 50px);">
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
                    <label for="service_code"
                           class="col-sm-3 col-form-label text-right">Code</label>
                    <div class="col-sm-5">
                        <input type="text" class="form-control" id="service_code"
                               name="service_code">
                        <small class="text-danger">${errors.get("service_code")}</small>

                    </div>
                </div>
                <div class="form-group row">
                    <label for="service_name"
                           class="col-sm-3 col-form-label text-right">Name</label>
                    <div class="col-sm-5">
                        <input type="text" class="form-control" id="service_name"
                               name="service_name">
                        <small class="text-danger">${errors.get("service_name")}</small>

                    </div>
                </div>
                <div class="form-group row">
                    <label for="area"
                           class="col-sm-3 col-form-label text-right">Area</label>
                    <div class="col-sm-3">
                        <input type="number" class="form-control" id="area"
                               name="area">
                        <small class="text-danger">${errors.get("area")}</small>

                    </div>
                </div>
                <div class="form-group row">
                    <label for="price"
                           class="col-sm-3 col-form-label text-right">Price</label>
                    <div class="col-sm-3">
                        <input type="number" step="0.01" class="form-control" id="price"
                               name="price">
                        <small class="text-danger">${errors.get("price")}</small>

                    </div>
                </div>
                <div class="form-group row">
                    <label for="people_allowed"
                           class="col-sm-3 col-form-label text-right">People Allowed</label>
                    <div class="col-sm-3">
                        <input type="number" class="form-control" id="people_allowed"
                               name="people_allowed">
                        <small class="text-danger">${errors.get("people_allowed")}</small>

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
                        <small class="text-danger">${errors.get("rent_type_id")}</small>

                    </div>
                </div>
                <div class="form-group row">
                    <label for="service_type_id"
                           class="col-sm-3 col-form-label text-right">Service Type</label>
                    <div class="col-sm-9">
                        <select name="service_type_id" class="form-select"
                                aria-label="Default select example" id="service_type_id">
                            <c:forEach items="${serviceTypes}" var="serviceType">
                                <c:if test="${serviceType.serviceTypeId == 1}">
                                    <option value="${serviceType.serviceTypeId}"
                                            selected>${serviceType.serviceTypeName}</option>
                                </c:if>
                                <c:if test="${serviceType.serviceTypeId != 1}">
                                    <option value="${serviceType.serviceTypeId}">${serviceType.serviceTypeName}</option>
                                </c:if>
                            </c:forEach>
                        </select>
                        <small class="text-danger">${errors.get("service_type_id")}</small>

                    </div>
                </div>
                <div class="form-group row">
                    <label for="standard_room"
                           class="col-sm-3 col-form-label text-right">Standard Room</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="standard_room"
                               name="standard_room">
                        <small class="text-danger">${errors.get("standard_room")}</small>

                    </div>
                </div>
                <div class="form-group row">
                    <label for="describe"
                           class="col-sm-3 col-form-label text-right">Convenient
                        Describe</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="describe"
                               name="describe">
                        <small class="text-danger">${errors.get("describe")}</small>

                    </div>
                </div>
                <div class="form-group row">
                    <label for="pool_area"
                           class="col-sm-3 col-form-label text-right">Pool Area</label>
                    <div class="col-sm-3">
                        <input type="number" step="0.1" class="form-control" id="pool_area"
                               name="pool_area">
                        <small class="text-danger">${errors.get("pool_area")}</small>

                    </div>
                </div>
                <div class="form-group row">
                    <label for="floors"
                           class="col-sm-3 col-form-label text-right">Floors</label>
                    <div class="col-sm-3">
                        <input type="number" class="form-control" id="floors"
                               name="floors">
                        <small class="text-danger">${errors.get("floors")}</small>

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
<%--<script type="text/javascript"--%>
<%--        src="${pageContext.request.contextPath}/WEB-INF/js/bootstrap.bundle.min.js"></script>--%>
<%--<script type="text/javascript"--%>
<%--        src="${pageContext.request.contextPath}/WEB-INF/js/jquery-3.6.0.min.js"></script>--%>
</body>
<script>
  $.fn.hasAttr = function(name) {
    return this.attr(name) !== undefined;
  };
  $.fn.freezeInp = function() {
    this.val('').attr('disabled','disabled').addClass('bg-secondary');
  };
  $.fn.openInp = function(inpObject) {
    this.val('').removeAttr('disabled').removeClass('bg-secondary');
  };
  $(document).ready(function () {

    const standard_room_inp = $("input[name='standard_room']");
    const describe_inp = $("input[name='describe']");
    const pool_area_inp = $("input[name='pool_area']");
    const floors_inp = $("input[name='floors']");

    (function() {
      standard_room_inp.openInp();
      describe_inp.openInp();
      pool_area_inp.openInp();
      floors_inp.freezeInp();
    })()

    $('#service_type_id').change(function () {
      if (this.value == 1) {
        standard_room_inp.openInp();
        describe_inp.openInp();
        pool_area_inp.openInp();
        floors_inp.freezeInp();
      } else if (this.value == 2) {
        standard_room_inp.openInp();
        describe_inp.freezeInp();
        pool_area_inp.freezeInp();
        floors_inp.openInp();
      } else {
        standard_room_inp.freezeInp();
        describe_inp.openInp();
        pool_area_inp.freezeInp();
        floors_inp.freezeInp();
      }
      // console.log(standard_room_inp.hasAttr('disabled'));
      // console.log(describe_inp.hasAttr('disabled'));
      // console.log(pool_area_inp.hasAttr('disabled'));
      // console.log(floors_inp.hasAttr('disabled'));
    })
  })
</script>
</html>
