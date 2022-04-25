<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
          crossorigin="anonymous">
    <title>Title</title>
    <style>
      th {
        font-weight: bold;
      }
    </style>
</head>
<body>
<h1 class="text-center">Customer List</h1>
<div class="container">
    <table class="table">
        <tr>
            <th scope="col">Tên</th>
            <th scope="col">Giới Tính</th>
            <th scope="col">Ngày Sinh</th>
            <th scope="col">Địa chỉ</th>
            <th scope="col">Điểm</th>
            <th scope="col">Xếp Loại</th>
            <th scope="col">Hình Ảnh</th>
            <th scope="col">Loại Khách Hàng</th>
        </tr>
        <c:forEach var="customer" items="${cusList}">
            <tr>
                <td>${customer.getName()}</td>

                <c:set var="gender" value="${customer.getGender()}"/>
                <td><c:out value="${gender eq 1 ? 'Nam': 'Nữ'}"/></td>

                <td>${customer.getDob()}</td>
                <td>${customer.getAddress()}</td>

                <c:set var="score" value="${customer.getScore()}"/>
                <td>${score}</td>

                <c:choose>
                    <c:when test="${score >= 8.0}">
                        <td><c:out value="Giỏi"/></td>
                    </c:when>
                    <c:when test="${score >= 6.5}">
                        <td><c:out value="Khá"/></td>
                    </c:when>
                    <c:when test="${score >= 5.0}">
                        <td><c:out value="Trung Bình"/></td>
                    </c:when>

                    <c:when test="${score >= 3.5}">
                        <td><c:out value="Yếu"/></td>
                    </c:when>
                    <c:otherwise>
                        <td><c:out value="No Hope"/></td>
                    </c:otherwise>
                </c:choose>

                <td><img width="240" src="${customer.getImgSrc()}" alt=""></td>


                <c:forEach var="type" items="${cusTypeList}">
                    <c:if test="${type.getId() eq customer.getCustomerTypeID()}">
                        <td>${type.getType()}</td>
                    </c:if>
                </c:forEach>
            </tr>
        </c:forEach>
    </table>
</div>

</body>
</html>
