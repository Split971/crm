<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register New User Form</title>

    <style>
        .error{
            color: red;
        }
    </style>
</head>

<body>

<h3>Register New User</h3>

<form:form action="${pageContext.request.contextPath}/register/processRegistrationForm"  modelAttribute="crmUser">

    <c:if test="${registrationError != null}">

        <i class="error">${registrationError}</i>

    </c:if>

    <!-- User name -->
    <form:errors path="userName" cssClass="error" />
    <form:input path="userName" placeholder="username (*)" />

    <br><br>

    <!-- Password -->
    <form:errors path="password" cssClass="error" />
    <form:password path="password" placeholder="password (*)" />

    <form:select path="formRule" items="${roles}" />

    <br><br>

    <button type="submit">Register</button>

</form:form>

</body>
</html>

