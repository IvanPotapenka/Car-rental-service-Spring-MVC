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
<%@page import="java.time.LocalDate" %>

<html>
<head>
    <title>Booking</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="shortcut icon" type="image/x-icon"
          href="https://e7.pngegg.com/pngimages/330/810/png-clipart-car-dealership-graphics-sports-car-computer-icons-car-blue-driving.png">
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }

        td {
            padding: 10px;
            border: 1px solid gray;
        }

        th {
            padding: 10px;
            border: 1px solid gray;
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
            align-items: center;
        }

        div {
            padding-top: 80px;
            padding-left: 20px;
        }

        select {
            padding: 10px;
            width: auto;
            height: 35px;
            font-size: 10px;
        }

        input {
            padding: 10px;
            width: auto;
            height: 35px;
            font-size: 10px;
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
<div><a href="/">Home </a><a href="${pageContext.request.contextPath}/cars">/ cars</a><a href="/order">/ order</a>
        / booking</div>
<c:if test="${create_client == null}">
<p class="w3-container w3-padding w3-margin"></p>
<box><p style="font-size: 60px" class="w3-text-red">Booking</p>
    <box class="w3-card-4 w3-round-large w3-padding" style="width: 50%">
        <h2><a href=${pageContext.request.contextPath}/cars?id=${car.id}
               class="w3-text-blue"> ${car.brand} ${car.model} ${car.year}</a></h2>
        <h6> &#9989; ${car.placeQuantity} places &#9989; ${car.transmission}
            &#9989;${car.doorQuantity} doors &#9989; ${car.fuelType} </h6>
        <flex>
            <h5 class="w3-padding w3-text-black">Rental date:</h5><h5 class="w3-padding w3-text-red">${rental.rentalDate} at 12.00 PM</h5>
            <h5 class="w3-padding w3-text-black">Return date:</h5><h5 class="w3-padding w3-text-red"> ${rental.rentalDate} at 12.00 PM</h5>
            <h4 class="w3-padding w3-text-red"> Rental ${rental.rentalDays} days</h4>
            <h3 class="w3-padding w3-text-red"> Total price ${rental.price}$</h3>
            <h3 class="w3-padding w3-text-blue"> You confirm compliance with the minimum rental conditions:</h3>

            <h7 class="w3-padding w3-text-black ">&#9989; Driving experience of at least 2 years.</h7>
            <h7 class="w3-padding w3-text-black ">&#9989; The minimum age is 20 years.</h7>
            <h7 class="w3-padding w3-text-black ">&#9989; The minimum rental period is 2 hours.</h7>
            <h7 class="w3-padding w3-text-black ">&#9989; Mileage limits - 300 km / day, every subsequent 300 km. for $ 10 (at the rate of the NBRB).</h7>
            <h7 class="w3-padding w3-text-black ">&#9989; Without the possibility of leaving the Republic of Belarus.</h7>
            <h7 class="w3-padding w3-text-black ">&#9989; The rental price includes CASCO insurance.</h7>
            <h7 class="w3-padding w3-text-black ">&#9989; Deposit (deposit) 500r.</h7>

        </flex>
    </box>
    </br>
    <form method="post" class="w3-card-4  w3-round-large w3-padding" style="width: 90%">
        <flex>

                <h1>Your data</h1><br>
                <table style="font-size: 10px">
                    <tr>
                        <th>*First name</th>
                        <th>*Last name</th>
                        <th>*Date of birthday</th>
                        <th>*Phone number</th>
                        <th>Address</th>
                    </tr>

                    <td><label for="first_name_id"></label>
                        <input class="w3-round-large"
                               maxlength="20"
                               type="text"
                               placeholder="Enter first name"
                               name="firstName"
                               id="first_name_id"
                               required/><br></td>

                    <td><label for="last_name_id"></label>
                        <input class="w3-round-large"
                               maxlength="20"
                               type="text"
                               placeholder="Enter last name"
                               name="lastName"
                               id="last_name_id"
                               required/><br></td>

                    <td><label for="date_of_birthday_id"></label>
                        <input class="w3-round-large"
                               type="date"
                               min="1950-01-01"
                               max="2003-01-01"
                               name="dateOfBirthday"
                               id="date_of_birthday_id"
                               required/><br></td>

                    <td><label for="phone_id"></label>
                        <input class="w3-round-large"
                               maxlength="13"
                               type="tel"
                               placeholder="Enter your phone"
                               name="phone"
                               id="phone_id"
                        /><br></td>

                    <td><label for="address_id"></label>
                        <input class="w3-round-large"
                               maxlength="100"
                               type="text"
                               placeholder="Enter city,street,No."
                               name="address"
                               id="address_id"
                        /><br></td>
                </table>
                <br>

            <table>
                <h1>Documents</h1><br>
                <table style="font-size: 10px">
                    <tr>
                        <th>*PASSPORT No.</th>
                        <th>*DRIVER LICENSE No.</th>
                    </tr>

                <td><label for="passport_id"></label>
                    <input class="w3-round-large"
                           maxlength="9"
                           type="text"
                           name="passport"
                           id="passport_id"
                           required/><br></td>

                    <td><label for="driver_id"></label>
                        <input class="w3-round-large"
                               maxlength="9"
                               type="text"
                               name="driverLicense"
                               id="driver_id"
                               required/><br></td>

            </table>
                <button class="w3-btn w3-white w3-round-large" type="submit">Send on check</button><br>
                </c:if>
        </flex>
    </form><br>
</box>
<%@include file="footer.jsp" %>
</body>
</html>