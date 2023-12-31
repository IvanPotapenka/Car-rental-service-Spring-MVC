<%--
  Created by IntelliJ IDEA.
  User: Professional
  Date: 07.04.2023
  Time: 18:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="shortcut icon" type="image/x-icon"
          href="https://e7.pngegg.com/pngimages/330/810/png-clipart-car-dealership-graphics-sports-car-computer-icons-car-blue-driving.png">

    <style>
        nav {
            position: fixed;
            width: 100%;
        }

        .topmenu {
            float: right;
            position: relative;
        }
        .submenu {
            position: absolute;
            left: 0;
            top: 100%;
            z-index: 5;
            width: 1px;
            opacity: 0;
            transform: scaleY(0);
            transform-origin: 0 0;
            transition: .5s ease-in-out;
        }
        li {
            list-style-type: none

        }
        .topmenu > li:hover .submenu {
            opacity: 1;
            transform: scaleY(1);
            color: gray;
        }

    </style>
</head>
<body>
<nav>
    <div class="w3-container w3-blue-grey">
        <button class="w3-text-blue" style="text-shadow:1px 1px 0 #444" onclick="location.href='/'">
            <h2>Car-rental-service</h2></button>
<sec:authorize access="!isAuthenticated()">
            <button class="w3-btn  w3-round-large w3-right  " style="text-shadow:1px 1px 0 #444"
                    onclick="location.href='/login'">Sing in
            </button>
</sec:authorize>
        <sec:authorize access="isAuthenticated()">
            <sec:authentication var="user" property="principal" />

            <ul class="topmenu">
                    <li><button class="w3-btn  w3-round-large w3-right" style="text-shadow:1px 1px 0 #444"onclick="location.href='/account/profile'">${user.username}</button>
                        <ul class="submenu"><br>
                            <li class="w3-padding"><a href="/account/profile">Profile</a></li><br>
                            <li class="w3-padding"><a href="/account/orders">Orders</a></li><br>
                            <li class="w3-padding"><a href="#">Message</a></li>
                            <li class="w3-padding"><a href="/logout">Sing out</a></li>
                        </ul>
                    </li>
                </ul>
        </sec:authorize>
        <button class="w3-btn w3-round-large w3-right" style="text-shadow:1px 1px 0 #444"
                onclick="location.href='/'">Contact
        </button>
        <button class="w3-btn  w3-round-large w3-right" style="text-shadow:1px 1px 0 #444"
                onclick="location.href='/catalog'">Catalog
        </button>
        <button class="w3-btn  w3-round-large w3-right " style="text-shadow:1px 1px 0 #444"
                onclick="location.href='/'">About
        </button>
        <button class="w3-btn  w3-round-large w3-right" style="text-shadow:1px 1px 0 #444"
                onclick="location.href='/'">Home
        </button>
    </div>
</nav>
</body>
</html>
