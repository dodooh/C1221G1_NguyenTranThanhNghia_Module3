<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<c:import url="../../components/head.jsp"/> <%--Header--%>


<body class="text-light">
<c:import url="../../components/header.jsp"/> <%--Header--%>
<c:import url="../../components/navbar_entity.jsp">

</c:import> <%--Navbar--%>
<div class="container-fluid px-0 bg-dark"
     style="margin-top: 144px; min-height: calc(100vh - 144px - 50px);">
    <div class="w-100 p-5 d-flex flex-wrap" style="overflow: auto;">
        <div class="w-100 d-flex flex-row justify-content-between">
            <a href="/${urlPath}?action=create" class="btn btn-success">Create New ${title}</a>
            <button type="button" class="btn btn-light">DELETE</button>
        </div>
        <div class="container-fluid mt-5 px-1">
            <table id="tableCustomer" class="table table-bordered table-dark">
                <thead class="thead-light">
                <th scope="col">#</th>
                <th scope="col">Name</th>
                <th scope="col">DOB</th>
                <th scope="col">National ID</th>
                <th scope="col">Salary</th>
                <th scope="col">Phone</th>
                <th scope="col">Email</th>
                <th scope="col">Address</th>
                <th scope="col">Position</th>
                <th scope="col">Degree</th>
                <th scope="col">Division</th>
                <th scope="col">Function</th>
                </thead>
                <tbody>
                <c:forEach var="employee" items="${employees}" varStatus="loop">
                    <tr>
                        <td>${loop.count}</td>
                        <td>${employee.getEmployeeName()}</td>
                        <td>${employee.getEmployeeDob()}</td>
                        <td>${employee.getEmployeeIdCard()}</td>
                        <td>
                            VND <fmt:formatNumber value="${employee.getEmployeeSalary()}"
                                                  type="number" maxFractionDigits="0"/>
                        </td>
                        <td>${employee.getEmployeePhone()}</td>
                        <td>${employee.getEmployeeMail()}</td>
                        <td>${employee.getEmployeeAddress()}</td>


                        <c:forEach var="position" items="${positions}">
                            <c:if test="${position.getPositionId() eq employee.getEmployeePositionId()}">
                                <td>${position.getPositionName()}</td>
                            </c:if>
                        </c:forEach>

                        <c:forEach var="educationDegree" items="${educationDegrees}">
                            <c:if test="${educationDegree.getEducationDegreeId() eq employee.getEmployeeEducationDegreeId()}">
                                <td>${educationDegree.getEducationDegreeName()}</td>
                            </c:if>
                        </c:forEach>

                        <c:forEach var="department" items="${departments}">
                            <c:if test="${department.getDepartmentId() eq employee.getEmployeeDivisionId()}">
                                <td>${department.getDepartmentName()}</td>
                            </c:if>
                        </c:forEach>




                        <td style="white-space: nowrap;">
                            <a role="button" class="btn btn-warning"
                               href="/${urlPath}?action=edit&id=${employee.getEmployeeId()}">
                                <img class="text-light" src="../../css/wrench.svg" alt="EDIT">
                            </a>
                            |
                            <button type="button" class="btn btn-danger"
                                    data-toggle="modal" data-target="#exampleModalCenter"
                                    onclick="infoDelete(
                                        <c:out value='${employee.getEmployeeId()}'/>,
                                        <c:out value='\"${employee.getEmployeeName()}\"'/>,
                                        <c:out value='\"${employee.getEmployeeDob()}\"'/>,
                                        <c:out value='\"${employee.getEmployeeIdCard()}\"'/>
                                            )"
                            >
                                <img class="text-light" src="../../css/trash3.svg" alt="DEL">
                            </button>

                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<c:import url="../../components/footer.jsp"/> <%--Footer--%>
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog"
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
            <form action="/${urlPath}" method="post">
                <div class="modal-body">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" id="id_delete" name="id">

                    <div id="name_delete"></div>
                    <div id="dob_delete"></div>
                    <div id="idcard_delete"></div>

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

  function infoDelete(id, name, dob, idCard) {
    document.getElementById("id_delete").value = id;
    document.getElementById("name_delete").innerText = "Name: " + name;
    document.getElementById("dob_delete").innerText = "DOB " + dob;
    document.getElementById("idcard_delete").innerText = "ID Card: " + idCard;
  }

</script>
</body>

</html>
