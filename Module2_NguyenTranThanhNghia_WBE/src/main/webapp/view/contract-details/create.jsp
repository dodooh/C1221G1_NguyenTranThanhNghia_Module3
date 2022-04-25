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
                        <label for="contract_id"
                               class="col-sm-3 col-form-label text-right">Choose Contract ID</label>
                        <div class="col-sm-9">
                            <select name="contract_id" class="form-select"
                                    aria-label="Default select example" id="contract_id">
                                <option selected>Choose Contract ID</option>
                                <c:forEach items="${contractList}" var="contract">
                                    <option value="${contract.contractId}">${contract.contractId}</option>
                                </c:forEach>
                            </select>
                            <small class="text-danger">${errors.get("contract_id")}</small>
                        </div>
                    </div>

                <div class="form-group row">
                    <label for="quantity"
                           class="col-sm-3 col-form-label text-right">Quantity</label>
                    <div class="col-sm-3">
                        <input type="number" class="form-control" id="quantity"
                               name="quantity">
                        <small class="text-danger">${errors.get("quantity")}</small>

                    </div>
                </div>

                <div class="form-group row">
                    <label for="as_id"
                           class="col-sm-3 col-form-label text-right">Choose Accompanied Service</label>
                    <div class="col-sm-9">
                        <select name="as_id" class="form-select"
                                aria-label="Default select example" id="as_id">
                            <option selected>Choose Accompanied Service</option>
                            <c:forEach items="${ass}" var="as">
                                <option value="${as.accId}">${as.accName}</option>
                            </c:forEach>
                        </select>
                        <small class="text-danger">${errors.get("as_id")}</small>

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
