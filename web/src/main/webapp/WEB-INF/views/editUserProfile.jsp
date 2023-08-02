<%--
  Created by IntelliJ IDEA.
  User: Professional
  Date: 12.04.2023
  Time: 0:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
        input{
            border: none;
            color: blue;
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


        div1 {
            padding-left: 80%;
        }

        div2 {
            width: 100%;
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
<sec:authorize access="hasAnyAuthority('ADMIN','MANAGER')">
<%@include file="headerAdmin.jsp" %>
</sec:authorize>
<sec:authorize access="hasAnyAuthority('USER')">
<%@include file="header.jsp" %>
</sec:authorize>
<div><a href="/admin">Home </a>/ profile</div>
<nav1>
    <flex class="w3-btn w3-border w3-round-large w3-padding" style="width: 100%"
          onclick="location.href='/account/profile'">
        <p style="font-size: 16px">
        <h4>&#128104;</h4>
        <h6>${uzer.fullName} </h6>
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

    <div class="w3-card-4 w3-round-large w3-padding" style="width: 40%"><br>
        <form method="post">
            <div style="float: left; width: 300px; height: 300px; margin-top: 10px; padding-top: 10px">

                <h6> ${uzer.role}:</h6><h6 class="w3-text-blue">
                <input required
                       name="fullName"
                       value="${uzer.fullName}"></h6>
                <h6>Email:</h6><h6 class="w3-text-blue">

                <input required
                       name="email"
                       value="${uzer. email}">

            </h6>
                <h6>Phone: </h6><h6 class="w3-text-blue">
                <input required
                       name="phone"
                       value="${uzer.phone}"></h6>
                <h6>Address: </h6> <h6 class="w3-text-blue">
                <input name="address"
                       value="${uzer.address}"></h6><br>

            </div>
            <div style="float: right; width: 250px; height: 250px;margin-bottom: 20%">
                <img src="https://www.w3schools.com/howto/img_avatar.png" alt="Avatar"
                     style="width:100%;opacity:0.85">
            </div>
            <div2>
                <div1>
                    <input hidden name="userId" value="${uzer.id}">
                    <button class="w3-btn w3-round-large w3-light-gray" type="submit">Save profile</button>
                </div1>
            </div2>
        </form>
    </div>
    <br><br>

</box>
<br>
<%@include file="footer.jsp" %>
</body>
</html>