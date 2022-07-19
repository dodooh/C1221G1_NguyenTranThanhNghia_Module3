<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Motel Managerment</title>
    <c:import url="../../components/head.jsp"/> <%--Header--%>
</head>
<body>
<div class="container shadow table-responsive py-3">
    <h1 class="text-center text-info">Motel Management</h1>
    <c:if test="${param.sc eq 1}">
        <p class="text-center alert alert-success">Add Successfully</p>
    </c:if>
    <form action="/${urlPath}?action=delete" method="post">

        <a role="button" class="btn btn-success" href="/motel?action=create"> + Create new
            customer</a>
        <button type="submit" class="btn btn-light">DELETE</button>
        <div class="w-100 mb-3 d-flex align-items-center justify-content-end">
            <form class="form-inline my-2 my-lg-0" action="/${urlPath}" method="get">
                <input type="hidden" name="action" value="search">
                <input name="motel_id"
                       class="form-control mr-sm-2 text-dark bg-light btn-outline-dark"
                       style="width: 125px;" type="search" placeholder="by Motel ID"
                       aria-label="Search">
                <input name="customer_name"
                       class="form-control text-dark mr-sm-2 bg-light btn-outline-dark"
                       style="width: 125px;" type="search" placeholder="by Customer Name"
                       aria-label="Search">
                <input name="phone" class="form-control text-dark mr-sm-2 bg-light btn-outline-dark"
                       style="width: 125px;" type="search" placeholder="by Phone"
                       aria-label="Search">
                <%--            <select name="customerTypeSearch"--%>
                <%--                    class="form-control mr-sm-2 text-dark bg-light btn-outline-dark form-select"--%>
                <%--                    aria-label="Default select example">--%>
                <%--                <option value="%">Choose Customer Type</option>--%>
                <%--            </select>--%>
                <button class="btn btn-info my-2 my-sm-0" type="submit">
                    <img width="24" class="text-light" src="../../css/search-heart.svg"
                         alt="SEARCH">
                </button>
            </form>
        </div>

        <table id="product" class="table table-bordered">
            <thead class="thead-dark">
            <tr>
                <th scope="col">STT</th>
                <th scope="col">Motel ID</th>
                <th scope="col">Customer</th>
                <th scope="col">Phone</th>
                <th scope="col">Rent Date</th>
                <th scope="col">Rent Type</th>
                <th scope="col">Note</th>
                <th scope="col">Select</th>
                <th scope="col">Function</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="motel" items="${motels}" varStatus="loop">
                <tr>
                    <td>${loop.count}</td>
                    <td>${motel.motelId}</td>
                    <td>${motel.customerName}</td>
                    <td>${motel.phoneNumber}</td>
                    <td>${motel.dayRent}</td>
                    <td>${motel.note}</td>
                    <td>
                        <c:forEach var="rentType" items="${rentTypes}">
                            <c:if test="${rentType.rentTypeId eq motel.rentTypeId}">
                                ${rentType.rentTypeName}
                            </c:if>
                        </c:forEach>
                    </td>
                    <td>
                        <input type="checkbox" class="chkCheckBoxToDelete"
                               value="${customer.getCustomerId()}" name="idToDelete">
                    </td>
                    <td>
                        <button onclick="infoDelete('${motel.motelId}')"
                                type="button" class="btn btn-danger" data-toggle="modal"
                                data-target="#modalDelete">
                            Delete
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </form>
</div>
<%--// MODAL DELETE--%>
<div class="modal fade" id="modalDelete" tabindex="-1" role="dialog"
     aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Confirm Delete?</h5>
                <button type="button" class="close text-light" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="/motel?action=delete" method="post">
                <div class="modal-body">
                    <input type="hidden" id="id_delete_hidden" name="id">
                    <div class="text-danger">Do You Want To Delete Motel With ID: <p
                            id="id_to_delete"></p></div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">NO</button>
                    <button type="submit" class="btn btn-danger">YES</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="../../datatables/js/jquery.dataTables.min.js"></script>
<script src="../../datatables/js/dataTables.bootstrap4.min.js"></script>
<script>
  $(document).ready(function () {
    $('#product').dataTable({
      "dom": 'lrtip',
      "lengthChange": false,
      "pageLength": 10
    })
  })
</script>
<script>
  function infoDelete(id) {
    document.getElementById("id_delete_hidden").value = id;
    document.getElementById("id_to_delete").innerHTML = id;
    console.log(id);
  }
</script>
</body>
</html>
