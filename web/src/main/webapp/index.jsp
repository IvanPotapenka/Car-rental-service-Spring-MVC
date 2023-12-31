<%--
  Created by IntelliJ IDEA.
  User: Professional
  Date: 11.04.2023
  Time: 16:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Car rental service</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="shortcut icon" type="image/x-icon"
          href="https://e7.pngegg.com/pngimages/330/810/png-clipart-car-dealership-graphics-sports-car-computer-icons-car-blue-driving.png">

    <style>
        section {
            height: 80vh;
        }
        .footer-distributed {
            padding: 45px 50px;
        }
        .footer-distributed .footer-left p {
            color: #8f9296;
            font-size: 14px;
            margin: 0;
        }
        .footer-distributed p.footer-links {
            font-size: 14px;
            font-weight: bold;
            color: #ffffff;
            margin: 0 0 10px;
            padding: 0;
            transition: ease .25s;
        }
        .footer-distributed p.footer-links a {
            display: inline-block;
            line-height: 1.8;
            text-decoration: none;
            color: inherit;
            transition: ease .25s;
        }
        .footer-distributed .footer-links a:before {
            content: "·";
            font-size: 10px;
            left: 0;
            color: #fff;
            display: inline-block;
            padding-right: 5px;
        }
        .footer-distributed .footer-links .link-1:before {
            content: none;
        }
        .footer-distributed .footer-right {
            float: right;
            margin-top: 6px;
            max-width: 180px;
        }
        .footer-distributed p.footer-links a:hover {
            text-decoration: underline;
        }
        nav {
            position: fixed;
            width: 100%;
        }

        .topmenu {
            top: -15px;
            float: right;
            position: relative;
        }
        .submenu {
            /*background: cadetblue;*/
            /*border-radius: 5px;*/
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
        <div>
 <img src="https://drivedrom.ru/wp-content/uploads/gde-vzyat-avtomobil-v-arendu-.jpg" >
        </div>
        <div class="w3-container w3-blue-grey  w3-padding">
            <footer class="footer-distributed">
                <div class="footer-right">
                    <a href="https://www.facebook.com"><i class="fa fa-facebook"></i></a>
                    <a href="https://twitter.com"><i class="fa fa-twitter"></i></a>
                    <a href="https://vk.com"><i class="fa fa-vk"></i></a>
                </div>
            <div class="footer-left">
                <p class="footer-links">
                <a class="link-1" href="/">Home</a>
                <a href="#">About</a>
                <a href="#">Faq</a>
                <a href="#">Contact</a></p>
                <p>Car rental service © 2023</p>
            </div>
        </footer>
    </div>
</body>
</html>
