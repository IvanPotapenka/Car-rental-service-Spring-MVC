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
<%@page import="java.time.LocalDate"%>

<html>
<head>
    <title>Order</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="shortcut icon" type="image/x-icon"
          href="https://e7.pngegg.com/pngimages/330/810/png-clipart-car-dealership-graphics-sports-car-computer-icons-car-blue-driving.png">
    <style>
        table {
            border-collapse: collapse;
            width: 80%;

        }

        th {
            font-size: 16px;
            padding: 10px;
            border: 1px solid lightblue;
        }
        td {
            font-size: 16px;
            padding: 10px;
            border: 1px solid lightblue;
        }

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

        div {
            padding-top: 80px;
            padding-left: 20px;
        }
        nav1 {
            margin-top: 100px;
            position: fixed;
            scroll-margin-right: 10px;
            width: 20%;
        }
        input {
            text-align: center;
            width: 200px;
            height: 30px;
            font-size: 10px;
        }
        .inp{
            display:  flex;
        }
    </style>
</head>

<body>
<%@include file="header.jsp" %>
<div><a href="/">Home </a><a href="${pageContext.request.contextPath}/catalog">/ catalog</a>/ order</div>
<p class="w3-container w3-padding w3-margin"></p>
<box>
    <box class="w3-card-4 w3-round-large w3-padding" style="width: 50%">
        <h2><a href=${pageContext.request.contextPath}/catalog/car?id=${car.id}
               class="w3-text-blue"> ${car.brand} ${car.model} ${car.year}</a></h2>
        <h6> &#9989; ${car.placeQuantity} places &#9989; ${car.transmission}
            &#9989;${car.doorQuantity} doors &#9989;${car.fuelType}</h6><br>
        <table>
            <tr>
                <td><span style="font-size: 12px">Color</span></td>
                <td><span style="font-size: 12px">Trunk volume</span></td>
                <td><span style="font-size: 12px">Engine capacity</span></td>
                <td><span style="font-size: 12px">Engine power</span></td>
                <td><span style="font-size: 12px">Engine fuel type</span></td>
            </tr>
            <tr>
                <td> ${car.color}</td>
                <td> ${car.trunkVolume} L</td>
                <td> ${car.engineCapacity}L</td>
                <td> ${car.horsePower} h/p</td>
                <td> ${car.fuelType}</td>
            </tr>
        </table><br>
            <table>
                <p style="font-size: 18px">The cost of booking</p>
                <tr>
                    <th> <span style="font-size: 10px">1-3 days </span></th>
                    <th> <span style="font-size: 10px">4-7 days </span></th>
                    <th> <span style="font-size: 10px">8-15 days </span></th>
                    <th> <span style="font-size: 10px">16-30 days </span></th>
                </tr>
                <tr>
                    <th><span style="color: crimson" aria-flowto=""> ${car.price*1.0}$</span></th>
                    <th><span style="color: crimson" aria-flowto=""> ${car.price*0.9}$</span></th>
                    <th><span style="color: crimson" aria-flowto=""> ${car.price*0.75}$</span></th>
                    <th><span style="color: crimson" aria-flowto=""> ${car.price*0.65}$</span></th>
                </tr>
            </table>
        <br>
        <flex>
            <h3 class="w3-padding w3-text-blue">Include:</h3>

            <h7 class="w3-padding w3-text-black ">&#9989; The car is insured against accidents</h7>
            <h7 class="w3-padding w3-text-black "> &#9989;Daily mileage up to 350 km</h7>
            <h7 class="w3-padding w3-text-black ">&#9989;24 hour roadside support</h7>
            <h7 class="w3-padding w3-text-black ">&#9989;The car is returned with the same fuel level as when it was
                issued
            </h7>
        </flex>

        <c:if test="${sessionScope.user == null}">
            <h4 class="w3-text-blue w3-round-large"> To place an order, please <a href=/login>Sing in </a></h4>
        </c:if>
        <c:if test="${sessionScope.user != null}">
        <form action="/booking">
            <div class="inp" style="width: 100%">
                <h5 class="w3-padding w3-text-blue">When do you rent? </h5>
                <label for="rental_date_id"></label>
                <input class="w3-round-large"
                       maxlength="20"
                       type="date"
                       min="${LocalDate.now()}"
                       name="rentalDate"
                       id="rental_date_id"
                       required/><br>

                <h5 class="w3-padding w3-text-blue">When are you returning it? </h5>
                <label for="return_date_id"></label>
                <input class="w3-round-large"
                       maxlength="20"
                       type="date"
                       min="${LocalDate.now()}"
                       name="returnDate"
                       id="return_date_id"
                       required/><br>

                <input hidden name="id" value="${car.id}"/>
            </div>
            <button class="w3-btn w3-round-large w3-right w3-red w3-padding">Booking
            </button>
        </form>
        </c:if>
        <br>
    </box>
    </br>
</box>
<%@include file="footer.jsp" %>
</body>
</html>
