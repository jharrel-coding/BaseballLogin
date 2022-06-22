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
    <div class="container">
    <form:form action="/players/create" method="POST" modelAttribute="newPlayer">
        <div class="row">
            <form:label path="jerseyNumber">Jersey Number</form:label>
            <form:input path="jerseyNumber" type="number" value="-" />
            <form:errors path="jerseyNumber"/>
        </div>

        <div class="row">
            <form:label path="firstName">First Name</form:label>
            <form:input path="firstName" type="text" />
            <form:errors path="firstName"/>
        </div>

        <div class="row">
            <form:label path="lastName">Last Nme</form:label>
            <form:input path="lastName" type="text" />
            <form:errors path="lastName"/>
        </div>

        <div class="row">
<%--            <form:select path="position">--%>
<%--                <form:option value="NONE" label="--- Position ---"/>--%>
<%--                <form:options items="${player.position}" />--%>
<%--            </form:select>--%>

<%--            <select id="position" name="position">--%>
<%--                <option value="NONE">--- Select ---</option>--%>
<%--                <option value="pitcher">Pitcher</option>--%>
<%--                <option value="infield">Infield</option>--%>
<%--                <option value="outfield">Outfield</option>--%>
<%--            </select>--%>
            <form:label path="position">Position</form:label>
            <form:select path="position" title="POSITION" multiple="false"
                         size="3">
                <form:option value="Pitcher" label="Pitcher" />
                <form:option value="Infield" label="Infielder" />
                <form:option value="Outfield" label="Outfielder" />
            </form:select>


        </div>

        <div class="row input-group">
            <form:label class="form-label" path="throwingHand">Throwing Hand</form:label>
            <div class="input-group-text">
                <form:radiobutton class="form-check-input" label="Left" path="throwingHand" value="yes" />
            </div>

            <div class="input-group-text">
                <form:radiobutton class="form-check-input" path="throwingHand" label="right" value="no" />
            </div>
        </div>

        <div class="row input-group">
            <form:label class="form-label" path="hittingHand">Hitting Hand</form:label>
            <div class="input-group-text">
                <form:radiobutton class="form-check-input" label="Left" path="hittingHand" value="yes" />
            </div>

            <div class="input-group-text">
                <form:radiobutton class="form-check-input" path="hittingHand" label="right" value="no" />
            </div>

            <div class="row input-group">
                <form:select path="team">
                    <c:forEach var="team" items="${ allTeams }">
                        <option value="${ team.id }">${ team.teamName }</option>
                    </c:forEach>
                </form:select>
            </div>
            <input class="btn btn-primary" type="submit" value="Submit">
        </div>
    </form:form>
    </div>
</body>
</html>