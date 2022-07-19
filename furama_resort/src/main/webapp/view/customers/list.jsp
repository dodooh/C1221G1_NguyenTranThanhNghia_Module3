<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<c:import url="../../components/head.jsp"/> <%--Header--%>

<body class="text-light">
<c:import url="../../components/header.jsp"/> <%--Header--%>
<c:import url="../../components/navbar_customer.jsp">
</c:import> <%--Navbar--%>
<div class="container-fluid px-0 bg-dark"
     style="margin-top: 144px; min-height: calc(100vh - 144px - 50px);">
    <%--    <form action="/${urlPath}?action=delete" method="post">--%>
    <div class="w-100 p-5 d-flex flex-wrap" style="overflow: auto;">
        <div class="w-100 d-flex flex-row justify-content-between">
            <a href="/${urlPath}?action=create" class="btn btn-success">Create New ${title}</a>
            <%--            <button type="submit" class="btn btn-light">DELETE</button>--%>
        </div>
        <div class="container-fluid mt-5 px-1">
            <table id="tableCustomer" class="table table-bordered table-dark">
                <thead class="thead-light">
                <th><input type="checkbox" id="checkboxAll"></th>
                <th scope="col">#</th>
                <th scope="col">Code</th>
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
                        <form id="form-${customer.getCustomerId()}"
                              action="/customers?action=edit&id=${customer.getCustomerId()}"
                              method="post">
                            <td>
                                <input type="checkbox" class="chkCheckBoxToDelete"
                                       value="${customer.getCustomerId()}" name="idToDelete">
                            </td>
                            <td>${loop.count}</td>
                            <td class="editable">
                                <p>${customer.getCustomerCode()}</p>
                                <input data-name="customer_code" class="editor d-none"
                                       type="text"
                                       value="${customer.getCustomerCode()}">
                            </td>
                            <td class="editable">
                                <p>${customer.getCustomerName()}</p>
                                <input data-name="customer_name" class="editor d-none"
                                       type="text"
                                       value="${customer.getCustomerName()}">
                            </td>
                            <td class="editable">
                                <p>${customer.getCustomerDob()}</p>
                                <input data-name="date_of_birth" class="editor d-none"
                                       type="date"
                                       value="${customer.getCustomerDob()}">
                            </td>
                            <td class="editable">
                                <p>${customer.getCustomerGender() == 1 ? "Male" : "Female"}</p>
                                <div class="editor d-none align-items-center">
                                    <div class="form-check">
                                        <input class="editor form-check-input" type="radio"
                                               data-name="gender" value="1"
                                               id="male" ${customer.getCustomerGender() eq 1 ? "checked" : ""}>
                                        <label class="form-check-label" for="male">
                                            Male&nbsp;
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="editor form-check-input" type="radio"
                                               data-name="gender" value="0"
                                               id="flexRadioDefault2" ${customer.getCustomerGender() eq 0 ? "checked" : ""}>
                                        <label class="form-check-label" for="flexRadioDefault2">
                                            Female
                                        </label>
                                    </div>
                                </div>
                            </td>
                            <td class="editable">
                                <p>${customer.getCustomerIdCard()}</p>
                                <input data-name="identify_number" class="editor d-none"
                                       type="text"
                                       value="${customer.getCustomerIdCard()}">
                            </td>
                            <td class="editable">
                                <p>${customer.getCustomerPhone()}</p>
                                <input data-name="phone_number" class="editor d-none"
                                       type="text"
                                       value="${customer.getCustomerPhone()}">
                            </td>
                            <td class="editable">
                                <p>${customer.getCustomerMail()}</p>
                                <input data-name="email" class="editor d-none"
                                       type="text"
                                       value="${customer.getCustomerMail()}">
                            </td>
                            <td class="editable">
                                <p>${customer.getCustomerAddress()}</p>
                                <input data-name="address" class="editor d-none"
                                       type="text"
                                       value="${customer.getCustomerAddress()}">
                            </td>
                            <td class="editable">

                                <c:forEach var="customerType" items="${customerTypes}">
                                    <c:if test="${customerType.getCustomerTypeId() eq customer.getCustomerTypeId()}">
                                        <p>${customerType.getCustomerTypeName()}</p>
                                    </c:if>
                                </c:forEach>
                                <select data-name="customer_type_id"
                                        class="editor d-none form-select"
                                        aria-label="Default select example">
                                    <option>Choose Customer Type</option>
                                    <c:forEach items="${customerTypes}" var="type">
                                        <c:choose>
                                            <c:when test="${type.customerTypeId eq customer.customerTypeId}">
                                                <option value="${type.customerTypeId}"
                                                        selected>${type.customerTypeName}</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="${type.customerTypeId}">${type.customerTypeName}</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </select>
                            </td>
                            <td style="white-space: nowrap;">
                                <a id="E${customer.getCustomerId()}" role="button"
                                   class="btn btn-warning"
                                   onclick="infoEdit(${loop.count},${customer.getCustomerId()})">
                                    E
                                </a>
                                <button style="display: none;" id="S${customer.getCustomerId()}"
                                        class="btn btn-success"
                                        type="submit">
                                    S
                                </button>
                                |
                                <a role="button" class="btn btn-warning"
                                   href="/customers?action=edit&id=${customer.getCustomerId()}">
                                    <img class="text-light" src="../../css/wrench.svg"
                                         alt="EDIT">
                                </a>
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
                                    <img class="text-light" src="../../css/trash3.svg"
                                         alt="DEL">
                                </button>
                            </td>
                        </form>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <%--    </form>--%>
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

  $(document).ready(function () {
    $('#checkboxAll').click(function () {
      if ($(this).is(':checked'))
        $('.chkCheckBoxToDelete').prop('checked', true)
      else
        $('.chkCheckBoxToDelete').prop('checked', false)
    })

  })

  function infoEdit(row, id) {
    $('#E' + id).hide()
    $('#S' + id).show()
    const trs = $("#tableCustomer tbody>tr:nth-child(" + row + ")")
    $("#tableCustomer tbody>tr:nth-child(" + row + ") .editable p").each(function () {
      $(this).hide()
    })
    $("#tableCustomer tbody>tr:nth-child(" + row + ") .editable .editor").each(function () {
      $(this).removeClass('d-none').attr('name', $(this).attr('data-name'))
    })
    trs.find('.editable').css({'border': '1px solid blue'});
  }

  // function submit(row, id) {
  //   $('#E' + id).show()
  //   $('#S' + id).hide()
  //   const trs = $("#tableCustomer").find("tbody>tr:nth-child(" + row + ")");
  //   trs.find('.editable').attr('contenteditable', 'false').css(
  //       {'border': '1px solid #454d55', 'border-bottom-width:': '0', 'border-left-width': '0'});
  // }

  function infoDelete(id, name, email, address) {
    document.getElementById("id_delete").value = id;
    document.getElementById("name_delete").innerText = "Name: " + name;
    document.getElementById("email_delete").innerText = "Email " + email;
    document.getElementById("address_delete").innerText = "Address: " + address;
  }

</script>
</body>

</html>
