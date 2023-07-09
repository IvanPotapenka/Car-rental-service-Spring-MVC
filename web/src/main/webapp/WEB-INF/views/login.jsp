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
<div><a href="/">Home </a>/ login</div>
<box>
    <form method="post" class="w3-card-4 w3-blue-grey w3-round-large w3-padding" style="width: 20%">
        <flex>
            <p style="font-size: 16px">
            <h1>Sing in</h1>
            <c:if test="${find_user_error == true}">
                <p class="w3-text-red"> Incorrect email or password!</p>
            </c:if>
            <label for="email"></label>
            <input class="w3-round-large"
                   type="email"
                   maxlength="20"
                   placeholder="Enter your email"
                   name="email"
                   id="email"
                   required/><br>
            <label for="pwd"></label>
            <input class="w3-round-large"
                   maxlength="20"
                   type="password"
                   placeholder="Enter your password"
                   name="password"
                   id="pwd"
                   required/></p>
            <button class="w3-btn w3-white w3-round-large" type="submit">Sing in</button>
            </br>
            <p style="font-size: 12px">Forgot password? <a href="${pageContext.request.contextPath}/recover">Recover
                password</a></p>
            <p style="font-size: 12px">Don't have an account? <a href="${pageContext.request.contextPath}/registration">Registration</a>
            </p>
            <p style="font-size: 12px">Enter for admin <a
                    href="${pageContext.request.contextPath}/login_admin">login</a></p>
        </flex>
    </form>
</box>
</body>
</html>

