<%--
  Created by IntelliJ IDEA.
  User: King
  Date: 4/24/2022
  Time: 1:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>PRODUCT</title>
    <c:import url="../../components/head.jsp"/> <%--Header--%>
</head>
<body>
<div class="container shadow table-responsive py-3">
    <h1 class="text-center text-info">Product List</h1>
    <c:if test="${param.sc eq 1}">
        <p class="text-center alert alert-success">Add Successfully</p>
    </c:if>
    <button type="button" class="my-3 btn btn-success" data-toggle="modal"
            data-target="#modalCreate">
        CREATE NEW PRODUCT
    </button>
    <div class="w-100 mb-3 d-flex align-items-center justify-content-end">
        <form class="form-inline my-2 my-lg-0" action="/${urlPath}" method="get">
            <input type="hidden" name="action" value="search">
            <input name="nameSearch" class="form-control mr-sm-2 bg-light btn-outline-dark"
                   style="width: 125px;" type="search" placeholder="by Name" aria-label="Search">
            <input name="phoneSearch" class="form-control mr-sm-2 bg-light btn-outline-dark"
                   style="width: 125px;" type="search" placeholder="by Phone" aria-label="Search">
            <select name="customerTypeSearch"
                    class="form-control mr-sm-2 bg-light btn-outline-dark form-select"
                    aria-label="Default select example">
                <option value="%">Choose Customer Type</option>
            </select>
            <button class="btn btn-info my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>

    <table id="product" class="table pb-3 table-bordered">
        <thead class="thead-dark">
        <tr>
            <th scope="col">ID</th>
            <th scope="col">NameProduct</th>
            <th scope="col">Price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Color</th>
            <th scope="col">Category</th>
            <th scope="col">Function</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="product" items="${productList}">
            <tr>
                <td>${product.productId}</td>
                <td>${product.productName}</td>
                <td>${product.price}</td>
                <td>${product.quantity}</td>
                <td>${product.color}</td>
                <td>
                    <c:forEach var="category" items="${categories}">
                        <c:if test="${category.categoryId eq product.categoryId}">
                            ${category.categoryName}
                        </c:if>
                    </c:forEach>
                </td>
                <td>
                    <a href="/product?action=edit&id=${product.productId}"
                       class="btn btn-primary">Edit</a>
                    <button onclick="infoDelete(${product.productId},'${product.productName}')"
                            type="button" class="btn btn-danger" data-toggle="modal"
                            data-target="#modalDelete">
                        Delete
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
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
            <form action="/products?action=delete" method="post">
                <div class="modal-body">
                    <input type="hidden" id="id_delete" name="id">
                    <div id="name_delete"></div>
                    <div class="text-danger">WARNING: YOU CAN NOT ROLL BACK AFTER DELETE!!!</div>
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
  function infoDelete(id, name) {
    document.getElementById("id_delete").value = id;
    document.getElementById("name_delete").innerText = "Name: " + name;
  }
  $(document).ready(function(){
    $('#create-form').on('submit', function(e){
      e.preventDefault();
      var len = $('#create-form #price').val();
      if (len == '' || isNaN(len) || parseFloat(len) <= 0 | parseFloat(len) > 10000000 ) {
        alert('NO OK')
      } else {
        this.submit();
      }
    });
  });
</script>
</body>
</html>
