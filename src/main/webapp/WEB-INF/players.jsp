<%--
  Created by IntelliJ IDEA.
  User: jason
  Date: 6/21/22
  Time: 7:18 PM
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

    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css"/>

    <!-- <script type="text/javascript" src="/js/script.js"></script> -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>

<body>
    <div class="container">
    <h1>hello</h1>
        <a href="/players/new">Add A New Player</a>
        <table class="table table-hover table-striped">
            <thead>
            <tr>
                <th>Team Name</th>
                <th>Number</th>
                <th>Name</th>
<%--                <th>Last Name</th>--%>
                <th>Position</th>
                <th>Throwing Hand</th>
                <th>Hitting Hand</th>
            </tr>
            </thead>
            <tbody>
               <c:forEach items="${ allPlayers }" var="player">
                   <tr>
                       <td>${ player.team.teamName}</td>
                       <td>${ player.jerseyNumber }</td>
                       <td>${ player.fullName() }</td>
<%--                       <td>${ player.lastName }</td>--%>
                       <td>${ player.position }</td>
                       <td>
                           <c:choose>
                               <c:when test="${ player.throwingHand }">
                                   Left
                               </c:when>
                               <c:otherwise>
                                   Right
                               </c:otherwise>
                           </c:choose>
                       </td>
                       <td>
                           <c:choose>
                               <c:when test="${ player.throwingHand }">
                                   Left
                               </c:when>
                               <c:otherwise>
                                   Right
                               </c:otherwise>
                           </c:choose>
                       </td>
                       <td>
                           <a href="/players/${ player.id }">View</a>
                           | <a href="/players/${ player.id }/edit">Edit</a>
                           |
                           <form action="/players/${ player.id }/destroy" method="post">
                               <input type="hidden" name="_method" value="delete">
                               <input type="submit" value="delete" />
                           </form>
                       </td>
                   </tr>
               </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>