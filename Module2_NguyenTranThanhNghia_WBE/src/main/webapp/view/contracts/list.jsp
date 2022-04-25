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
                    <th scope="col">Create Date</th>
                    <th scope="col">End Date</th>
                    <th scope="col">Deposit</th>
                    <th scope="col">Employee</th>
                    <th scope="col">Customer</th>
                    <th scope="col">Service</th>
                </thead>
                <tbody>
                    <c:forEach var="contract" items="${contractsDTO}" varStatus="loop">
                        <tr>
                            <td>${contract.contractId}</td>
                            <td>${contract.createDate}</td>
                            <td>${contract.endDate}</td>
                            <td>${contract.deposit}</td>
                            <td>${contract.employeeName}</td>
                            <td>${contract.customerName}</td>
                            <td>${contract.serviceName}</td>
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
