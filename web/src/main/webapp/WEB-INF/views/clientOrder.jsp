<%--@elvariable id="car" type=""--%>
<%@ page import="by.potapenko.database.entity.CarEntity" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Professional
  Date: 31.03.2023
  Time: 23:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Booking</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="shortcut icon" type="image/x-icon"
          href="https://e7.pngegg.com/pngimages/330/810/png-clipart-car-dealership-graphics-sports-car-computer-icons-car-blue-driving.png">
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
            align-items: flex-start;
            margin-left: 10px;
        }
    </style>
</head>

<body>
<%@include file="header.jsp" %>
<div><a href="/">Home </a><a href="${pageContext.request.contextPath}/cars">/ cars</a><a href="/order">/ order</a><a
        href="/booking">/ booking</a></div>

<p class="w3-container w3-padding w3-margin"></p>
<box>
    <p style="font-size: 60px" class="w3-text-red">Order No.${rental.id}</p>
    <box class="w3-card-4 w3-round-large w3-padding" style="width: 50%">
        <flex>
            <c:if test="${create_rental == true}">
                <h5 class="w3-padding w3-text-black w3-opacity">Client: </h5><h5
                    class="w3-padding ">${rental.clientDto.firstName} ${rental.clientDto.lastName} </h5>
                <h5 class="w3-padding w3-text-black w3-opacity">Phone No.</h5><h5
                    class="w3-padding ">${rental.clientDto.phone} </h5>
                <h5 class="w3-padding w3-text-black w3-opacity">Car:</h5><h5
                    class="w3-padding ">${rental.carDto.brand} ${rental.carDto.model} ${rental.carDto.year}</h5>
                <h5 class="w3-padding w3-text-black w3-opacity">Car No. </h5><h5
                    class="w3-padding "> ${rental.carDto.number} </h5>

                <h5 class="w3-padding w3-text-black w3-opacity">Rental date:</h5><h5 class="w3-padding">${rental.rentalDate} at
                12.00 PM</h5>
                <h5 class="w3-padding w3-text-black w3-opacity">Return date:</h5><h5 class="w3-padding"> ${rental.returnDate} at
                12.00 PM</h5>
                <h5 class="w3-padding w3-text-black w3-opacity"> Rental: </h5><h5 class="w3-padding"> ${rental.rentalDays}
                days</h5>
                <h5 class="w3-padding w3-text-black"> Where to pick up the car? 100 New Bridge Street, London, EC4V 6JA</h5>
                <h3 class="w3-padding w3-text-red"> Amount to be paid ${rental.price}$</h3>
            </c:if>
            <c:if test="${create_rental == false}">
                <p style="font-size: 20px" class="w3-text-red"> Sorry! Creating doesn't possible now, please try
                    again letter </p>
            </c:if><br>
        </flex>
    </box>
    </br>
</box>
<%@include file="footer.jsp" %>
</body>
</html>