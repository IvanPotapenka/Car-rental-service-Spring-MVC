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
    <link rel="stylesheet" href=
            "https://unpkg.com/@primer/css@^18.0.0/dist/primer.css"/>
    <title>Rentals</title>
    <style>
        table {
            border-collapse: collapse;
            margin-left: 200px;
            margin-right: auto;
        }

        td {
            padding: 12px;
            border: 1px solid white;
        }

        th {
            padding: 14px;
            border: 1px solid white;
        }
        box {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 20px;
        }

        box1 {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 1%;
            margin-bottom: 1%;
        }
        div {
            padding-top: 80px;
            padding-left: 20px;
        }
        flex {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 5%;
            margin-bottom: 10%;
        }

        nav1 {
            position: fixed;
            margin-left: 5%;
            width: 15%;
        }
    </style>
</head>
<body>
<%@include file="header.jsp" %>
<div><a href="/admin">Home </a>/ profile</div>
<nav1>
    <flex class="w3-btn w3-border w3-round-large w3-padding" style="width: 100%"
          onclick="location.href='/account/profile'">
        <p style="font-size: 16px">
        <h4>&#128104;</h4>
        <h6>${user.login} </h6>
    </flex>
    <flex class="w3-btn w3-border w3-round-large w3-padding" style="width: 100%"
          onclick="location.href='/account/orders'">
        <p style="font-size: 16px">
            <h4> &#128188;</h4>
        <h6>Orders </h6>
    </flex>
    <flex class="w3-btn w3-border w3-round-large w3-padding" style="width: 100%">
        <p style="font-size: 16px">
            <h4> &#128140;</h4>
        <h6>Message </h6>
    </flex>

</nav1>
<box class="w3-container ">
    <div class="w3-card-4 w3-round-large w3-padding" style="width: 50%"><br>
        <h4> ${user.role}:</h4><h4 class="w3-text-blue"> ${user.login} </h4><br>
        <h6>Email:</h6><h6 class="w3-text-blue"> ${user. email}</h6><br>
        <h6>Phone: </h6> <h6 class="w3-text-blue"> ${user.phone}</h6><br>
    </div> <br><br>
</box><br>
<%@include file="footer.jsp" %>
</body>
</html>