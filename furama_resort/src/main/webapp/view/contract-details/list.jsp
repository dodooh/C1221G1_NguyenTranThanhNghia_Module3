<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<c:import url="../../components/head.jsp"/>

<body class="text-light">
<c:import url="../../components/header.jsp"/> <%--Header--%>
<c:import url="../../components/navbar.jsp">

</c:import> <%--Navbar--%>
<div class="container-fluid px-0 bg-dark"
     style="margin-top: 144px; min-height: calc(100vh - 144px - 50px);">
    <div class="w-100 p-5 d-flex flex-wrap" style="overflow: auto;">
        <a href="/${urlPath}?action=create" class="btn btn-success">Create New ${title}</a>
        <div class="container-fluid mt-5 px-1">
            <table id="tableCustomer" class="table table-bordered table-dark">
                <thead class="thead-light">
                <th scope="col">ID</th>
                <th scope="col">Quantity</th>
                <th scope="col">Contract ID</th>
                <th scope="col">Create Date</th>
                <th scope="col">End Date</th>
                <th scope="col">Deposit</th>
                <th scope="col">Employee</th>
                <th scope="col">Customer</th>
                <th scope="col">Service Name</th>
                <th scope="col">Accompanied Service Name</th>

                </thead>
                <tbody>
                <c:forEach var="contractDetailDTO" items="${contractDetailsDTO}" varStatus="loop">
                    <tr>
                        <td>${contractDetailDTO.contractDetailId}</td>
                        <td>${contractDetailDTO.quantity}</td>
                        <td>${contractDetailDTO.contractId}</td>
                        <td>${contractDetailDTO.createDate}</td>
                        <td>${contractDetailDTO.endDate}</td>
                        <td>${contractDetailDTO.deposit}</td>
                        <td>${contractDetailDTO.employeeName}</td>
                        <td>${contractDetailDTO.customerName}</td>
                        <td>${contractDetailDTO.serviceName}</td>
                        <td>${contractDetailDTO.asName}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<c:import url="../../components/footer.jsp"/> <%--Footer--%>
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

</script>
</body>

</html>
