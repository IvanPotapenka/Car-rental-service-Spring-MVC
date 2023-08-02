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
            width: 120px;
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
<sec:authorize access="hasAnyAuthority('ADMIN', 'MANAGER')">
    <nav>
        <div class="w3-container w3-blue-grey";  style="height: 65px;">
            <p style="font-size: 24px;color: white;position: absolute; font-weight: bold">Car rental service</p>


            <sec:authorize access="!isAuthenticated()">
                <button class="w3-btn  w3-round-large w3-right  " style="text-shadow:1px 1px 0 #444"
                        onclick="location.href='/login'">Sing in
                </button>
            </sec:authorize>
            <sec:authorize access="isAuthenticated()">
                <sec:authorize access="hasAnyAuthority('ADMIN', 'MANAGER')">
                        <sec:authentication var="user" property="principal" />

                        <ul class="topmenu">
                            <li><button class="w3-btn  w3-round-large w3-right" style="text-shadow:1px 1px 0 #444"onclick="location.href='/admin/profile'">${user.username}</button>
                                <ul class="submenu"><br>
                                    <li class="w3-padding"><a href="/admin/profile">Profile</a></li><br>
                                    <li class="w3-padding"><a href="/admin/orders">Orders</a></li><br>
                                    <li class="w3-padding"><a href="#">Message</a></li>
                                    <li class="w3-padding"><a href="/logout">Sing out</a></li>
                                </ul>
                            </li>
                        </ul>
                </sec:authorize>
            </sec:authorize>

            <button class="w3-btn w3-front-arial w3-round-large w3-right " style="text-shadow:1px 1px 0 #444"
                    onclick="location.href='/admin/rentals'">Rentals
            </button>
            <button class="w3-btn  w3-round-large w3-right" style="text-shadow:1px 1px 0 #444"
                    onclick="location.href='/admin/requests'">Requests
            </button>
            <button class="w3-btn w3-front-arial w3-round-large w3-right " style="text-shadow:1px 1px 0 #444"
                    onclick="location.href='/admin/users'">Users
            </button>
            </button>
            <button class="w3-btn  w3-round-large w3-right" style="text-shadow:1px 1px 0 #444"
                    onclick="location.href='/admin/managers'">Managers
            </button>
            <button class="w3-btn  w3-round-large w3-right" style="text-shadow:1px 1px 0 #444"
                    onclick="location.href='/admin/cars'">Cars
            </button>

        </div>
    </nav>
</sec:authorize>
</body>
</html>
