<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List Customer</title>

    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
</head>

<body>

  <div id="wrapper">
      <div id="header">
          <h2>CRM - Customer Relationship Manager</h2>
      </div>
  </div>

  <div id="container">
      <div id="content">

          <p>
              User: <security:authentication property="principal.username" />, Role(s): <security:authentication property="principal.authorities" />
          </p>

          <security:authorize access="hasAnyRole('MANAGER', 'ADMIN')">

              <input type="button" value="Add Customer" onclick="window.location.href='showFormForAdd; return false;'"
                     class="add-button"/>

          </security:authorize>

          <form:form action="search" method="post">
              Search customer <input type="text" name="searchName"/>

              <input type="submit" value="Search" class="add-button"/>
          </form:form>

          <table>
              <tr>
                  <th>First Name</th>
                  <th>Last Name</th>
                  <th>Email</th>

                  <security:authorize access="hasAnyRole('MANAGER', 'ADMIN')">
                      <th>Action</th>
                  </security:authorize>
              </tr>

              <c:forEach var="customer" items="${customers}">

                  <c:url var="updateLink" value="/customer/showFormForUpdate">
                      <c:param name="customerId" value="${customer.id}"/>
                  </c:url>
                  <c:url var="deleteLink" value="/customer/delete">
                      <c:param name="customerId" value="${customer.id}"/>
                  </c:url>

                  <tr>
                      <td>${customer.firstName}</td>
                      <td>${customer.lastName}</td>
                      <td>${customer.email}</td>

                      <security:authorize access="hasAnyRole('MANAGER', 'ADMIN')">

                          <td>
                              <security:authorize access="hasAnyRole('MANAGER', 'ADMIN')">
                                  <a href="${updateLink}">Update</a>
                              </security:authorize>

                              <security:authorize access="hasAnyRole('ADMIN')">
                                  <a href="${deleteLink}"
                                     onclick="if (!(confirm('Are you sure you want to delete this customer?'))) return false">Delete</a>
                              </security:authorize>
                          </td>

                      </security:authorize>
                  </tr>
              </c:forEach>
          </table>

      </div>
  </div>

  <p></p>

  <form:form action="${pageContext.request.contextPath}/logout"
             method="POST">

      <input type="submit" value="Logout" class="add-button" />

  </form:form>

</body>
</html>
