<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Custom Login Page</title>

    <style>
        .failed{
            color: red;
        }
        .logout{
            color: green;
        }
    </style>
</head>

<body>

    <h3>Custom Login Page</h3>

    <form:form action="${pageContext.request.contextPath}/authenticateTheUser" method="post">

        <c:if test="${param.error != null}">
            <i class="failed">Sorry! You entered invalid username/password.</i>
        </c:if>

        <c:if test="${param.logout != null}">
            <i class="logout">You have been logged out</i>
        </c:if>

        <p>
            User name: <input type="text" name="username" />
        </p>

        <p>
            Password: <input type="password" name="password" />
        </p>

        <input type="submit" value="Login" />

    </form:form>

    <a href="${pageContext.request.contextPath}/register/showRegistrationForm">Register New User</a>

</body>

</html>
