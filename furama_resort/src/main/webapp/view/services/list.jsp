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
                <th scope="col">#</th>
                <th scope="col">CODE</th>
                <th scope="col">Name</th>
                <th scope="col">Area</th>
                <th scope="col">Price</th>
                <th scope="col">People Allowed</th>
                <th scope="col">Standard Room</th>
                <th scope="col">Describe</th>
                <th scope="col">Pool Area</th>
                <th scope="col">Floors</th>
                <th scope="col">Rent Type</th>
                <th scope="col">Service Type</th>
                </thead>
                <tbody>
                <c:forEach var="serviceData" items="${serviceDatas}" varStatus="loop">
                    <tr>
                        <td>${loop.count}</td>
                        <td>${serviceData.getServiceCode()}</td>
                        <td>${serviceData.getServiceName()}</td>
                        <td>${serviceData.getArea()}</td>
                        <td>
                            VND <fmt:formatNumber value="${serviceData.getPrice()}"
                                                  type="number" maxFractionDigits="0"/></td>
                        <td>${serviceData.getMaxPeopleAllowed()}</td>
                        <td>${serviceData.getStandardRoom()}</td>
                        <td>${serviceData.getConvenientDescribe()}</td>
                        <td>${serviceData.getPoolArea()}</td>
                        <td>${serviceData.getNumFloors()}</td>

                        <c:forEach var="rentType" items="${rentTypes}">
                            <c:if test="${rentType.rentTypeId eq serviceData.rentTypeId}">
                                <td>${rentType.rentTypeName}</td>
                            </c:if>
                        </c:forEach>

                        <c:forEach var="serviceType" items="${serviceTypes}">
                            <c:if test="${serviceType.serviceTypeId eq serviceData.serviceTypeId}">
                                <td>${serviceType.serviceTypeName}</td>
                            </c:if>
                        </c:forEach>
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
