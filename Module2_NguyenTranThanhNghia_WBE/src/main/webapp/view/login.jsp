<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<c:import url="../components/head.jsp"/> <%--Header--%>

<body class="text-light">
<c:import url="../components/header.jsp"/> <%--Header--%>
<c:import url="../components/navbar.jsp"/> <%--Navbar--%>
<div class="container-fluid px-0 bg-dark "
     style="margin-top: 144px;min-height: calc(100vh - 144px - 50px);">
    <div class="d-flex text-light w-100 h-100 justify-content-center">
        <div style="margin-top: 100px;">
            <form action="${pageContext.request.contextPath}/login" method="post">
                <!-- Email input -->
                <div class="form-outline mb-4">
                    <input type="text" id="form2Example1" class="form-control" name="username"/>
                    <label class="form-label" for="form2Example1">Username</label>
                </div>

                <!-- Password input -->
                <div class="form-outline mb-4">
                    <input type="password" id="form2Example2" class="form-control" name="password" />
                    <label class="form-label" for="form2Example2">Password</label>
                </div>
                <small class="text-danger">${message}</small>
                <!-- 2 column grid layout for inline styling -->
                <div class="row mb-4">
                    <div class="col d-flex justify-content-center">
                        <!-- Checkbox -->
                        <div class="form-check">
                            <input name="remember" class="form-check-input" type="checkbox" id="form2Example31"/>
                            <label class="form-check-label" for="form2Example31"> Remember me </label>
                        </div>
                    </div>
                </div>

                <!-- Submit button -->
                <button type="submit" class="btn btn-light btn-block mb-4">Sign in</button>

            </form>
        </div>
    </div>
</div>


<c:import url="../components/footer.jsp"/> <%--Footer--%>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/WEB-INF/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/WEB-INF/js/jquery-3.6.0.min.js"></script>
</body>

</html>
