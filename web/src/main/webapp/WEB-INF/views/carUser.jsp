<%--
  Created by IntelliJ IDEA.
  User: Professional
  Date: 11.04.2023
  Time: 19:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>${car.brand} ${car.model}</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }

        th {
            font-size: 12px;
            padding: 10px;
            border: 1px solid lightblue;
        }

        box {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 100px;
        }

        box {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 1%;
            margin-bottom: 1%;
        }

        flex {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }

        div {
            padding-top: 80px;
            padding-left: 20px;
        }
    </style>
</head>
<body>
<%@include file="header.jsp" %>
<div><a href="/">Home </a><a href="${pageContext.request.contextPath}/catalog">/ catalog</a>/ car</div>
<p class="w3-container w3-padding w3-margin"></p>
<br>
<box class="w3-container ">
    <box class="w3-card-4 w3-round-large w3-padding" style="width: 50%"><br>
        <h2 class="w3-text-blue"> ${car.brand} ${car.model} ${car.year}</a></h2>
        <figure class="mb-0"> <img src="${car.image}" alt="${car.brand} ${car.model}"></figure><br>
        <flex>
            <h7>&#9989; ${car.placeQuantity} places</h7>
            <h7>&#9989; ${car.color}</h7>
            <h7>&#9989;${car.doorQuantity} doors</h7>
            <h7>&#9989;Trunk volume ${car.trunkVolume} l</h7>
            <h7>&#9989; ${car.transmission}</h7>
            <h7>&#9989;Fuel consumption ${car.fuelConsumption}l on 100 km</h7>
            <h7>&#9989; Engine capacity ${car.engineCapacity}l</h7>
            <h7>&#9989; Engine power ${car.horsePower} h/p</h7>
            <h7>&#9989; Engine fuel type ${car.fuelType}</h7>
        </flex><br>
        <table>
            <p style="font-size: 18px">The cost of booking</p>
            <tr>
                <th> <span style="font-size: 10px">1-3 days </span></th>
                <th> <span style="font-size: 10px">4-7 days </span></th>
                <th> <span style="font-size: 10px">8-15 days </span></th>
                <th> <span style="font-size: 10px">16-30 days </span></th>
            </tr>
            <tr>
                <th style="font-size: 16px"><span style="color: crimson" aria-flowto=""> ${car.price*1.0}$</span></th>
                <th style="font-size: 16px"><span style="color: crimson" aria-flowto=""> ${car.price*0.9}$</span></th>
                <th style="font-size: 16px"><span style="color: crimson" aria-flowto=""> ${car.price*0.75}$</span></th>
                <th style="font-size: 16px"><span style="color: crimson" aria-flowto=""> ${car.price*0.6}$</span></th>
            </tr>
        </table>
        <br>
        <button class="w3-btn w3-round-large w3-red" onclick="location.href='/order/${car.id}'">Order
        </button>
        </br>
    </box>
    <p style="font-size: 16px"><button class="w3-btn w3-round-large" onclick="history.go(-1);">Back</button></p><br></box>
</box>
<%@include file="footer.jsp" %>
</body>
</html>
