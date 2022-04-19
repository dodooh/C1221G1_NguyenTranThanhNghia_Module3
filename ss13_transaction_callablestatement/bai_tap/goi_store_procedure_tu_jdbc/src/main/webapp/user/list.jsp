<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Management Application</title>
</head>
<body>
<center>
    <h1>User Management</h1>
    <h2>
        <a href="/users?action=create">Add New User</a>
    </h2>
    <form method="get">
        <input type="hidden" name="action" value="search">
        <input type="text" name="keyword">
        <button type="submit">Search</button>
    </form>
    <form method="get">
        <input type="hidden" name="action" value="sort">
        By
        <div>
            <input checked type="radio" id="name" name="by" value="name">
            <label for="name">name</label><br>
            <input type="radio" id="email" name="by" value="email">
            <label for="email">email</label><br>
            <input type="radio" id="country" name="by" value="country">
            <label for="country">country</label>
        </div>
        CONDITION
        <div>
            <input checked type="radio" id="ASC" name="condition" value="1">
            <label for="ASC">Ascending</label><br>
            <input type="radio" id="DESC" name="condition" value="0">
            <label for="DESC">Descending</label>
        </div>
        <button type="submit">Sort</button>
    </form>
</center>
<div align="center">
    <table border="1" cellpadding="5">
        <caption><h2>List of Users</h2></caption>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="user" items="${listUser}">
            <tr>
                <td><c:out value="${user.id}"/></td>
                <td><c:out value="${user.name}"/></td>
                <td><c:out value="${user.email}"/></td>
                <td><c:out value="${user.country}"/></td>
                <td>
                    <a href="/users?action=edit&id=${user.id}">Edit</a>
                    <a href="/users?action=delete&id=${user.id}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>