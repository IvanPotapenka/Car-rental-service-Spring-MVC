<%--
  Created by IntelliJ IDEA.
  User: Professional
  Date: 07.04.2023
  Time: 18:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Car rental service</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="shortcut icon" type="image/x-icon"
          href="https://e7.pngegg.com/pngimages/330/810/png-clipart-car-dealership-graphics-sports-car-computer-icons-car-blue-driving.png">
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">

    <style>

        @import url(https://fonts.googleapis.com/css?family=Roboto:400,500,300,700);

        * {
            margin: 0;
            padding: 0;
        }

        * {
            font-family: Roboto;
        }

        .footer-distributed {

            padding: 45px 50px;
        }

        .footer-distributed .footer-left p {
            color: #8f9296;
            font-size: 12px;
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
            font-size: 20px;
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
            max-width: 100px;
        }

        .footer-distributed p.footer-links a:hover {
            text-decoration: underline;
        }

    </style>
</head>
<body>

<div style="height: 310px" class="w3-blue-grey w3-padding">
    <footer class="footer-distributed">
        <p style="font-size: 16px"><button class="w3-btn w3-round-large" onclick="history.go(-1);">Back</button></p><br></box>
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
