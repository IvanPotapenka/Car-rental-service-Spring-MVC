<%--
  Created by IntelliJ IDEA.
  User: Professional
  Date: 12.04.2023
  Time: 0:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Registration</title>
    <style>
        box {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 50px;
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
<div><a href="/">Home </a><a href="${pageContext.request.contextPath}/login">/ login</a>/ registration</div>
<box>
    <form method="post" class="w3-card-4 w3-blue-grey w3-round-large w3-padding" style="width: 30%">
        <flex>
            <p style="font-size: 16px">

                <c:if test="${create_user == null}">
            <h1>Registration</h1><br>
            <label for="login_id">Login</label>
            <input class="w3-round-large"
                   type="text"
                   maxlength="20"
                   placeholder="Enter your login"
                   name="login"
                   id="login_id"
                   required/><br>

            <c:if test="${email_error == true}">
                <p class="w3-text-red"> User with this email already exists!</p>
            </c:if>
            <label for="email">Email</label>
            <input class="w3-round-large"
                   type="email"
                   maxlength="20"
                   placeholder="Enter your email"
                   name="email"
                   id="email"
                   required/><br>

            <label for="phone_id">Phone</label>
            <input class="w3-round-large"
                   maxlength="13"
                   type="phone"
                   placeholder="Enter your phone"
                   name="phone"
                   id="phone_id"
                   required/></p><br>

            <label for="pwd">Password</label>
            <input class="w3-round-large"
                   maxlength="20"
                   type="password"
                   placeholder="Enter your password"
                   name="password"
                   id="pwd"
                   required/></p><br>
            <button class="w3-btn w3-white w3-round-large" type="submit">Registration</button>
            </br>
            <p style="font-size: 12px">If you are already registered,</p>
            <p style="font-size: 16px"><a href="/login">Sing in</a></p>
            </c:if>
            <c:if test="${create_user == true}">
                <p style="font-size: 20px" class="w3-text-green"> The user is registered successfully!</p>
                <a href="/login" class="w3-text-blue">Sing in</a><br>
            </c:if>
            <c:if test="${create_user == false}">
                <p style="font-size: 20px" class="w3-text-red"> Sorry! Registration doesn't possible now, please try
                    later </p>
                <a href="/registration" class="w3-text-blue">Registration</a><br>
            </c:if>
        </flex>
    </form>
    <p style="font-size: 16px"><a href="/login">Back</a></p><br>
</box>
</body>
</html>


