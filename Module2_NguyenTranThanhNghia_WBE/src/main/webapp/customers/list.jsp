<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>Customer | List</title>
    <link rel="icon" type="image/x-icon" href="/favicon.ico">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="/bootstrap413/css/bootstrap.min.css">
    <link rel="stylesheet" href="/datatables/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
          crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
            crossorigin="anonymous"></script>

    <style>
<%--        <%@include file="/WEB-INF/css/bootstrap.min.css" %>--%>
        <%@include file="/WEB-INF/css/style.css" %>
<%--        <%@include file="/datatables/css/dataTables.bootstrap4.min.css" %>--%>
    </style>
</head>

<body class="text-light">
<c:import url="../components/header.jsp"/> <%--Header--%>
<c:import url="../components/navbar.jsp">
</c:import> <%--Navbar--%>
<div class="container-fluid px-0 bg-dark"
     style="margin-top: 144px; min-height: calc(100vh - 144px - 50px);">
    <div class="w-100 p-5 d-flex flex-wrap" style="overflow: auto;">
        <a href="/${urlPath}?action=create" class="btn btn-light">Create New ${title}</a>
        <div class="container-fluid mt-5 px-1">
            <table id="tableCustomer" class="table table-bordered table-dark">
                <thead class="thead-light">
                <th scope="col">ID</th>
                <th scope="col">Name</th>
                <th scope="col">DOB</th>
                <th scope="col">Gender</th>
                <th scope="col">National ID</th>
                <th scope="col">Phone</th>
                <th scope="col">Email</th>
                <th scope="col">Address</th>
                <th scope="col">Type</th>
                <th scope="col">Function</th>
                </thead>
                <tbody>
                <c:forEach var="customer" items="${customers}" varStatus="loop">
                    <tr>
                        <td>${loop.count}</td>
                        <td>${customer.getCustomerName()}</td>
                        <td>${customer.getCustomerDob()}</td>
                        <td>${customer.getCustomerGender() == 1 ? "Male" : "Female"}</td>
                        <td>${customer.getCustomerIdCard()}</td>
                        <td>${customer.getCustomerPhone()}</td>
                        <td>${customer.getCustomerMail()}</td>
                        <td>${customer.getCustomerAddress()}</td>

                        <c:forEach var="customerType" items="${customerTypes}">
                            <c:if test="${customerType.getCustomerTypeId() eq customer.getCustomerTypeId()}">
                                <td>${customerType.getCustomerTypeName()}</td>
                            </c:if>
                        </c:forEach>

                        <td>
                            <a role="button" class="btn btn-warning"
                               href="/customers?action=edit&id=${customer.getCustomerId()}"><i
                                    class="bi bi-tools"></i></a>
                            |
                            <button type="button" class="btn btn-danger"
                                    data-toggle="modal" data-target="#exampleModalCenter"
                                    onclick="infoDelete(
                                        <c:out value='${customer.getCustomerId()}'/>,
                                        <c:out value='\"${customer.getCustomerName()}\"'/>,
                                        <c:out value='\"${customer.getCustomerDob()}\"'/>,
                                        <c:out value='\"${customer.getCustomerGender() == 1 ? "Male" : "Female"}\"'/>
                                            )"
                            >
                                <i class="bi bi-trash3"></i>
                            </button>

                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<c:import url="../components/footer.jsp"/> <%--Footer--%>
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog"
     aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Confirm Delete?</h5>
                <button type="button" class="close text-light" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="/customers" method="post">
                <div class="modal-body">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" id="id_delete" name="id">

                    <div id="name_delete"></div>
                    <div id="email_delete"></div>
                    <div id="address_delete"></div>

                    <div class="text-danger">WARNING: YOU CAN NOT ROLLBACK AFTER DELETE!!!</div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">NO</button>
                    <button type="submit" class="btn btn-danger">YES</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="/datatables/js/jquery.dataTables.min.js"></script>
<script src="/datatables/js/dataTables.bootstrap4.min.js"></script>
<script>
  $(document).ready(function () {
    $('#tableCustomer').dataTable({
      "dom": 'lrtip',
      "lengthChange": false,
      "pageLength": 10
    })
  })

  function infoDelete(id, name, email, address) {
    document.getElementById("id_delete").value = id;
    document.getElementById("name_delete").innerText = "Name: " + name;
    document.getElementById("email_delete").innerText = "Email " + email;
    document.getElementById("address_delete").innerText = "Address: " + address;
  }

</script>
</body>

</html>
