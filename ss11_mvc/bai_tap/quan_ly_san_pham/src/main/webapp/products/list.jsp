<%--
  Created by IntelliJ IDEA.
  User: King
  Date: 4/14/2022
  Time: 4:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

<%--    <link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">--%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">

</head>
<body>
<div class="shadow container table-responsive py-2">
    <div class="display-4 text-center">Customer List</div>
    <div>
        <a role="button" class="btn btn-success" href="/products?action=create"> + Create New
            Product</a>
        <p class="d-inline">
            <c:if test='${requestScope["message"] != null}'>
                <span class="alert alert-success">${requestScope["message"]}</span>
            </c:if>
        </p>
    </div>

    <table class="table table-striped mt-2">
        <thead class="thead-dark">
        <tr>
            <th scope="col">Name</th>
            <th scope="col">Price</th>
            <th scope="col">Describe</th>
            <th scope="col">Manufactor</th>
            <th scope="col">Edit</th>
            <th scope="col">Delete</th>

        </tr>
        </thead>
        <tbody>
        <c:forEach items='${requestScope["products"]}' var="product" varStatus="loop">
            <tr>
                <td>
                    <a class="font-weight-bold text-dark"
                       href="/customers?action=view&id=${product.getId()}">${product.getName()}</a>
                </td>
                <td>${product.getPrice()}</td>
                <td>${product.getDescription()}</td>
                <td>${product.getManufactor()}</td>
                <td><a class="btn btn-info" href="/customers?action=edit&id=${product.getId()}"
                       role="button">edit</a></td>
<%--                <td><a class="btn btn-danger"--%>
<%--                       href="/customers?action=delete&id=${product.getId()}">delete</a></td>--%>
                <td>
                    <button type="button" class="btn btn-danger"
                            data-toggle="modal" data-target="#exampleModalCenter"
                            onclick="infoDelete(
                                <c:out value='${product.getId()}'/>,
                                <c:out value='\"${product.getName()}\"'/>,
                                <c:out value='\"${product.getPrice()}\"'/>,
                                <c:out value='\"${product.getDescription()}\"'/>,
                                <c:out value='\"${product.getManufactor()}\"'/>
                                    )"
                    >
                        Delete
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
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
                    <div id="price_delete"></div>
                    <div id="describe_delete"></div>
                    <div id="manufacture_delete"></div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">NO</button>
                    <button type="submit" class="btn btn-danger">YES</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
<script>
  function infoDelete(id, name, price, describe, manufacture) {
    document.getElementById("id_delete").value = id;
    document.getElementById("name_delete").innerText = "Name: " +  name;
    document.getElementById("price_delete").innerText = "Price " + price;
    document.getElementById("describe_delete").innerText = "Describe: " + describe;
    document.getElementById("manufacture_delete").innerText = "Manufacture: " + manufacture;
  }
</script>
</body>
</html>
