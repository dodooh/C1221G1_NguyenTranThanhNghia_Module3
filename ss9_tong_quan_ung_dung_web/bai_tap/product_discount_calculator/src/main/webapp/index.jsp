<%--
  Created by IntelliJ IDEA.
  User: King
  Date: 4/12/2022
  Time: 10:30 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <title>Product Discount Calculator </title>
  </head>
  <body>
  <h1 class="text-center"> Product Discount Calculator </h1>
  <div class="container">
    <form method="post" action="/display-discount">
      <div class="form-group">
        <label for="exampleProductDescription1">Product Description</label>
        <input name="productDescription" type="text" class="form-control" id="exampleProductDescription1">
        <small id="emailHelp" class="form-text text-muted">Mô tả của sản phẩm.</small>
      </div>
      <div class="form-group">
        <label for="exampleListPrice1">List Price</label>
        <input name="listPrice" type="number" class="form-control" id="exampleListPrice1">
      </div>
      <div class="form-group">
        <label for="exampleDiscount1">Discount Percent (%)</label>
        <input name="discountPercent" type="number" class="form-control" id="exampleDiscount1">
      </div>

      <button type="submit" class="btn btn-primary"> Calculate Discount </button>
    </form>
  </div>
  </body>
</html>
