<%--
  Created by IntelliJ IDEA.
  User: jason
  Date: 6/21/22
  Time: 7:20 PM
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
    <h1># ${ player.jerseyNumber}</h1>
    <h3>${ player.firstName} ${ player.lastName }</h3>

    <p>Position: ${ player.position}</p>
    <p>Hitting: ${ player.hittingHand} | Throwing: ${ player.throwingHand}</p>
</body>
</html>