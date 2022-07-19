<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<c:import url="../../components/head.jsp"/> <%--Header--%>

<body class="text-light">
<c:import url="../../components/header.jsp"/> <%--Header--%>
<c:import url="../../components/navbar.jsp"/> <%--Navbar--%>
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
                    <label for="create_date"
                           class="col-sm-3 col-form-label text-right">Create Date</label>
                    <div class="col-sm-5">
                        <input type="date" class="form-control" id="create_date"
                               name="create_date">
                        <small class="text-danger">${errors.get("create_date")}</small>

                    </div>
                </div>
                <div class="form-group row">
                    <label for="end_date"
                           class="col-sm-3 col-form-label text-right">End Date</label>
                    <div class="col-sm-5">
                        <input type="date" class="form-control" id="end_date"
                               name="end_date">
                        <small class="text-danger">${errors.get("end_date")}</small>

                    </div>
                </div>
                <div class="form-group row">
                    <label for="deposit"
                           class="col-sm-3 col-form-label text-right">Deposit</label>
                    <div class="col-sm-3">
                        <input type="number" step="0.01" class="form-control" id="deposit"
                               name="deposit">
                        <small class="text-danger">${errors.get("deposit")}</small>

                    </div>
                </div>

                <div class="form-group row">
                    <label for="employee_id"
                           class="col-sm-3 col-form-label text-right">Choose Employee</label>
                    <div class="col-sm-9">
                        <select name="employee_id" class="form-select"
                                aria-label="Default select example" id="employee_id">
                            <option selected>Choose Employee</option>
                            <c:forEach items="${employeeList}" var="employee">
                                <option value="${employee.employeeId}">${employee.employeeName}</option>
                            </c:forEach>
                        </select>
                        <small class="text-danger">${errors.get("employee_id")}</small>

                    </div>
                </div>
                <div class="form-group row">
                    <label for="customer_id"
                           class="col-sm-3 col-form-label text-right">Choose Customer</label>
                    <div class="col-sm-9">
                        <select name="customer_id" class="form-select"
                                aria-label="Default select example" id="customer_id">
                            <option selected>Choose Customer</option>
                            <c:forEach items="${customerList}" var="customer">
                                <option value="${customer.customerId}">${customer.customerName}</option>
                            </c:forEach>
                        </select>
                        <small class="text-danger">${errors.get("customer_id")}</small>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="service_id"
                           class="col-sm-3 col-form-label text-right">Choose Service</label>
                    <div class="col-sm-9">
                        <select name="service_id" class="form-select"
                                aria-label="Default select example" id="service_id">
                            <option selected>Choose Service</option>
                            <c:forEach items="${serviceList}" var="service">
                                <option value="${service.serviceId}">${service.serviceName}</option>
                            </c:forEach>
                        </select>
                        <small class="text-danger">${errors.get("service_id")}</small>
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
  $.fn.hasAttr = function (name) {
    return this.attr(name) !== undefined;
  };
  $.fn.freezeInp = function () {
    this.val('').attr('disabled', 'disabled').addClass('bg-secondary');
  };
  $.fn.openInp = function (inpObject) {
    this.val('').removeAttr('disabled').removeClass('bg-secondary');
  };
  $(document).ready(function () {

    const standard_room_inp = $("input[name='standard_room']");
    const describe_inp = $("input[name='describe']");
    const pool_area_inp = $("input[name='pool_area']");
    const floors_inp = $("input[name='floors']");

    (function () {
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
