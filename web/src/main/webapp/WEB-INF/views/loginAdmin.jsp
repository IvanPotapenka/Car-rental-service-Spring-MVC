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
    <title>Login</title>
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
<div><a href="/">Home </a><a href="${pageContext.request.contextPath}/login_admin">/ admin</a></div>
<box>
    <form method="post" class="w3-card-4 w3-blue-grey w3-round-large w3-padding" style="width: 20%">
        <flex>
            <p style="font-size: 16px">
            <h1>Admin</h1>

            <c:if test="${find_admin_error==true}">
                <p class="w3-text-red"> Incorrect login or password!</p>
                <p><a href="/login_admin" class="w3-text-blue">try again</a></p>
            </c:if>
            <label for="login"></label>
            <input class="w3-round-large"
                   type="text"
                   maxlength="20"
                   placeholder="Enter your login"
                   name="login"
                   id="login"
                   required/><br>
            <label for="pwd"></label>
            <input class="w3-round-large"
                   maxlength="20"
                   type="password"
                   placeholder="Enter your password"
                   name="password"
                   id="pwd"
                   required/></p>
            <button class="w3-btn w3-white w3-round-large" type="submit">Log in</button>
            </br>
            <p style="font-size: 12px">Forgot password? <a href="${pageContext.request.contextPath}/recover">Recover
                password</a></p>

        </flex>
    </form>
    <p style="font-size: 16px"><a href="/login">Back</a></p><br>
</box>
</body>
</html>

