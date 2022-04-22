<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header id="header" class="border-bottom-grey fixed-top d-flex align-items-center bg-dark" style="height: 80px">
    <div class="container-fluid d-flex justify-content-between align-items-center" style="width: 90%">

        <h1 class="logo me-auto"><a href="/home" class="nav-link" >Furama <span style="color:  #d1342f;">Resort</span></a></h1>
        <c:choose>
        <c:when test="${sessionScope['name_session'] == null}">
            <h5 class="logo me-auto"><a href="/login" class="nav-link">Log In</a></h5>
        </c:when>
        <c:otherwise>
            <div class="me-auto row">
                <h5 class="logo"><a href="/home" class="nav-link">${sessionScope['name_session']}</a></h5>
                <p><a href="/logout" class="nav-link">(log out)</a></p>
            </div>
        </c:otherwise>
        </c:choose>
    </div>
</header>


