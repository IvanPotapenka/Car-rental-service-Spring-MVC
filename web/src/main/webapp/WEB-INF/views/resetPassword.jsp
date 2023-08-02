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
  <title>Reset password</title>
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
<%--  <script>--%>
<%--    function checkPasswordMatch(fieldConfirmPassword) {--%>
<%--      if (fieldConfirmPassword.value != $("#password").val()) {--%>
<%--        fieldConfirmPassword.setCustomValidity("Passwords do not match!");--%>
<%--      } else {--%>
<%--        fieldConfirmPassword.setCustomValidity("");--%>
<%--      }--%>
<%--    }--%>
<%--  </script>--%>
</head>
<body>
<%@include file="header.jsp" %>
<div><a href="/">Home </a><a href="${pageContext.request.contextPath}/reset_password">/ reset_password</div>
<box>
  <form method="post"  action="/reset_password" class="w3-card-4 w3-blue-grey w3-round-large w3-padding" style="width: 30%; margin-left: 35%; align-items: center">
    <flex>
      <p style="font-size: 16px">

<c:if test="${change_password == true}">
      <p class="w3-text-green" > You have successfully changed your password.</p>
      <p><a href="${pageContext.request.contextPath}/login">Sing in</a></p>
        </c:if>

      <c:if test="${change_password == false}">
        <p class="w3-text-red" > There is no user with this token <a href="/recover" class="w3-text-blue">try
          again</a></p>
        <p><a href="${pageContext.request.contextPath}/registration">Registration</a></p>
      </c:if>

<c:if test="${change_password == null}">

      <h5>Reset your password</h5><br>
      <c:if test="${user_token_found == true}">

        <input type="hidden" name="resetPasswordToken" value="${token}" />

        <label >Password</label>
        <input class="w3-round-large"
               maxlength="20"
               type="password"
               placeholder="Enter your new password"
               name="password"
               id="password"
               required/>

        <label >Confirm new password</label>
        <input class="w3-round-large"
               maxlength="20"
               minlength="8"
               type="password"
               required/><br>
      </c:if><br>

      <c:if test="${user_token_found == false}">
        <p class="w3-text-red" > There is no user with this token <a href="/recover" class="w3-text-blue">try
          again</a></p>
        <p><a href="${pageContext.request.contextPath}/registration">Registration</a></p>
      </c:if>

        <button class="w3-btn w3-white w3-round-large" type="submit">Reset</button>
        </br>
        <p style="font-size: 12px"><a href="/login">Back</a></p>
      </c:if>

    </flex>
  </form>
</box>
</body>
</html>
