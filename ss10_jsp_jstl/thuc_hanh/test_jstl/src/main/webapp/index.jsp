<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: King
  Date: 4/12/2022
  Time: 10:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Core Tag Example</title>
</head>
<body>
<%--<c:set var="Income" scope="session" value="${4000*4}"/>--%>
<%--<c:out value="${Income}"/>--%>

<%--<c:set var="income" scope="session" value="${4000*4}"/>--%>
<%--<p>Before Remove Value is: <c:out value="${income}"/></p>--%>
<%--<c:remove var="income"/>--%>
<%--<p>After Remove Value is: <c:out value="${income}"/></p>--%>

<%--<c:catch var ="catchtheException">--%>
<%--  <% int x = 2/0;%>--%>
<%--</c:catch>--%>

<%--<c:if test = "${catchtheException != null}">--%>
<%--  <p>The type of exception is : ${catchtheException} <br />--%>
<%--    There is an exception: ${catchtheException.message}</p>--%>
<%--</c:if>--%>

<%--<c:set var="income" scope="session" value="${4000*4}"/>
<c:if test="${income > 8000}">
<p>My income is: <c:out value="${income}"/><p>
  </c:if>--%>

<%--<c:set var="income" scope="session" value="${4000*4}"/>--%>
<%--<p>Your income is : <c:out value="${income}"/></p>--%>
<%--<c:choose>--%>
<%--  <c:when test="${income <= 1000}">--%>
<%--    Income is not good.--%>
<%--  </c:when>--%>
<%--  <c:when test="${income > 10000}">--%>
<%--    Income is very good.--%>
<%--  </c:when>--%>
<%--  <c:otherwise>--%>
<%--    Income is undetermined...--%>
<%--  </c:otherwise>--%>
<%--</c:choose>--%>

<c:set value="10" var="num"/>
<c:choose>
  <c:when test="${num%2==0}">
    <c:out value="${num} is even number"/>
  </c:when>
  <c:otherwise>
    <c:out value="${num} is odd number"/>
  </c:otherwise>
</c:choose>
</body>
</html>
