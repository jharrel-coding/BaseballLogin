<%--suppress XmlDuplicatedId --%>
<%--
  Created by IntelliJ IDEA.
  User: jason
  Date: 6/22/22
  Time: 11:16 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book Club - Add Book</title>

    <!-- <link rel="stylesheet" type="text/css" href="/css/style.css"> -->
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css"/>

    <!-- <script type="text/javascript" src="/js/script.js"></script> -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>

<body>

<div class="container">
    <div class="row">
        <div class="col-6">
            <h1>Register</h1>
            <form:form action="/register" method="POST"
                       modelAttribute="newUser">

                <form:label path="firstName">First Name</form:label>
                <form:input type="text" class="input" path="firstName" />
                <form:errors path="firstName" class="text-danger" />

                <form:label path="lastName">Last Name</form:label>
                <form:input class="input" path="lastName" />
                <form:errors type="text" path="lastName" class="text-danger" />


                <form:label path="email">Email</form:label>
                <form:input type="email" class="input" path="email" />
                <form:errors path="email" class="text-danger" />

                <form:label path="password">Password</form:label>
                <form:input type="password" class="input" path="password" />
                <form:errors path="password" class="text-danger" />

                <form:label path="confirm">Confirm Password</form:label>
                <form:input type="password" class="input" path="confirm" />
                <form:errors path="confirm" class="text-danger" />

                <input type="submit" value="Register" />
            </form:form>

        </div>
        <div class="col-6">
            <h1>Log in</h1>

            <form:form action="/login" method="POST"
                       modelAttribute="newLogin">
                <form:label path="email">Email</form:label>
                <form:input type="email" class="input" path="email" />
                <form:errors path="email" class="text-danger" />

                <form:label path="password">Password</form:label>
                <form:input type="password" class="input" path="password" />
                <form:errors path="password" class="text-danger" />
                <input type="submit" value="Login" />
            </form:form>

        </div>
    </div>
</div>

</body>
</html>