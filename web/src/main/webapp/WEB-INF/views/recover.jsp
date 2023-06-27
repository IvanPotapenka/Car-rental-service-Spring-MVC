<%--
  Created by IntelliJ IDEA.
  User: Professional
  Date: 12.04.2023
  Time: 0:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Recover</title>
    <style>
        box {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 100px;
        }

        flex {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        div {
            padding-top: 80px;
            padding-left: 20px;
        }
    </style>
</head>
<body>
<%@include file="header.jsp" %>
<div><a href="/">Home </a><a href="${pageContext.request.contextPath}/login">/ login</a>/ recover</div>
<box>
    <form method="post" class="w3-card-4 w3-blue-grey w3-round-large w3-padding" style="width: 30%">
        <flex>
            <p style="font-size: 16px">
            <h5>Recover password</h5><br>
            <c:if test="${param.email == true}">
                <p class="w3-text-green"> Your password has been sent to your email!</p></br>
                <p><a href="${pageContext.request.contextPath}/login">Sing in</a></p></br>

            </c:if><br>
            <label for="email"></label>
            <c:if test="${param.email == false}">
                <p class="w3-text-red"> There is no user with this address or <a href="/recover" class="w3-text-blue">try
                    again</a></p>
                <p><a href="${pageContext.request.contextPath}/registration">Registration</a></p>
            </c:if>
            <c:if test="${param.email == null}">
                <input class="w3-round-large"
                       type="email"
                       maxlength="20"
                       placeholder="Enter your email"
                       name="email"
                       id="email"
                       required/></p>
                <button class="w3-btn w3-white w3-round-large" type="submit">Recover</button>
                </br>
                <p style="font-size: 12px"><a href="/login">Back</a></p>
            </c:if>
        </flex>
    </form>
</box>
</body>
</html>
