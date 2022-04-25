<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage = "../error-404.jsp" %>

<html>
<head>

    <title>Customer List</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
          crossorigin="anonymous">
    <link rel="stylesheet"
          href="/datatables/css/dataTables.bootstrap4.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
            crossorigin="anonymous"></script>
</head>
<body>
<%--Set tieu de cho header--%>
<c:include page="../header.jsp"/>
<%----%>
<div class="shadow container table-responsive py-5">
    <h1 class="text-center">Customer List</h1>
    <p>
        <a role="button" class="btn btn-success" href="/customers?action=create"> + Create new
            customer</a>
    </p>
    <table id="tableCustomer" class="table table-striped">
        <thead class="thead-dark">
        <tr>
            <th scope="col">Name</th>
            <th scope="col">Email</th>
            <th scope="col">Address</th>
            <th scope="col">Edit</th>
            <th scope="col">Delete</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items='${requestScope["customers"]}' var="customer" varStatus="loop">
            <tr>
                <td>
                    <a class="font-weight-bold text-dark" href="/customers?action=view&id=${customer.getId()}">${customer.getName()}</a>
                </td>
                <td>${customer.getEmail()}</td>
                <td>${customer.getAddress()}</td>
                <td><a class="btn btn-info" href="/customers?action=edit&id=${customer.getId()}"
                       role="button">edit</a></td>
                    <%--                <td><a class="btn btn-danger" href="/customers?action=delete&id=${customer.getId()}">delete</a></td>--%>

                <td>
                    <button type="button" class="btn btn-danger"
                            data-toggle="modal" data-target="#exampleModalCenter"
                            onclick="infoDelete(
                                <c:out value='${customer.getId()}'/>,
                                <c:out value='\"${customer.getName()}\"'/>,
                                <c:out value='\"${customer.getEmail()}\"'/>,
                                <c:out value='\"${customer.getAddress()}\"'/>
                                    )"
                    >
                        Delete
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <select id="pageLenth">
        <option value="2">2</option>
        <option value="3">3</option>
    </select>
</div>
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog"
     aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Confirm Delete?</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
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

  // $('#pageLenth').change(function (){
  //   num = this.value;
  //   alert(num);
  //   reload(num);
  // })
  $(document).ready(function () {
    $('#tableCustomer').dataTable({
      "dom": 'lrtip',
      "lengthChange": false,
      "pageLength": 4
    })
  })

  function infoDelete(id, name, email, address) {
    document.getElementById("id_delete").value = id;
    document.getElementById("name_delete").innerText = "Name: " +  name;
    document.getElementById("email_delete").innerText = "Email " + email;
    document.getElementById("address_delete").innerText = "Address: " + address;
  }
</script>
</body>
</html>

<%--<td class="d-flex">--%>
<%--    <button type="button" class="btn btn-danger"--%>
<%--            data-toggle="modal" data-target="#exampleModalCenter${loop.count}">--%>
<%--        Delete--%>
<%--    </button>--%>
<%--    <div class="modal fade" id="exampleModalCenter${loop.count}" tabindex="-1"--%>
<%--         role="dialog" aria-labelledby="exampleModalCenterTitle${loop.count}"--%>
<%--         aria-hidden="true">--%>
<%--        <div class="modal-dialog modal-dialog-centered" role="document">--%>
<%--            <div class="modal-content">--%>
<%--                <div class="modal-header">--%>
<%--                    <h5 class="modal-title" id="exampleModalLongTitle${loop.count}">--%>
<%--                        Confirm Delete</h5>--%>
<%--                    <button type="button" class="close" data-dismiss="modal"--%>
<%--                            aria-label="Close">--%>
<%--                        <span aria-hidden="true">&times;</span>--%>
<%--                    </button>--%>
<%--                </div>--%>
<%--                <div class="modal-footer">--%>
<%--                    <button type="button" class="btn btn-secondary"--%>
<%--                            data-dismiss="modal">Close--%>
<%--                    </button>--%>
<%--                    <form id="formfield" method="post" action="/customers" class="inline">--%>
<%--                        <input type="hidden" name="id" value="${customer.getId()}">--%>
<%--                        <input type="hidden" name="action" value="delete">--%>
<%--                        <button id="submit-btn-${loop.count}" class="btn btn-danger" type="button">--%>
<%--                            Delete--%>
<%--                        </button>--%>
<%--                    </form>--%>

<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</td>--%>
