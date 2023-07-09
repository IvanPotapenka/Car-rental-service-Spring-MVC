<%--
  Created by IntelliJ IDEA.
  User: Professional
  Date: 07.04.2023
  Time: 18:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    </style>
</head>
<body>
<nav>
    <div class="w3-container w3-blue-grey">
        <button class="w3-text-blue" style="text-shadow:1px 1px 0 #444" onclick="location.href='/admin'">
            <h2>Car rental service</h2></button>

        <c:if test="${sessionScope.admin == null}">
            <button class="w3-btn  w3-round-large w3-right  " style="text-shadow:1px 1px 0 #444"
                    onclick="location.href='/login'">Sing in
            </button>
        </c:if>
        <c:if test="${sessionScope.admin != null}">
            <button class="w3-btn  w3-round-large w3-right  " style="text-shadow:1px 1px 0 #444"
                    onclick="location.href='/logout'">Sing out
            </button>
        </c:if>
        <button class="w3-btn w3-front-arial w3-round-large w3-right " style="text-shadow:1px 1px 0 #444"
                onclick="location.href='/admin/rentals'">Rentals
        </button>
        <button class="w3-btn w3-front-arial w3-round-large w3-right " style="text-shadow:1px 1px 0 #444"
                onclick="location.href='/admin/users'">Users
        </button>
        <button class="w3-btn w3-front-arial w3-round-large w3-right " style="text-shadow:1px 1px 0 #444"
                onclick="location.href='/admin/clients'">Clients
        </button>
        <button class="w3-btn  w3-round-large w3-right" style="text-shadow:1px 1px 0 #444"
                onclick="location.href='/admin/managers'">Managers
        </button>
        <button class="w3-btn  w3-round-large w3-right" style="text-shadow:1px 1px 0 #444"
                onclick="location.href='/admin/cars'">Cars
        </button>
    </div>
</nav>
</body>
</html>
