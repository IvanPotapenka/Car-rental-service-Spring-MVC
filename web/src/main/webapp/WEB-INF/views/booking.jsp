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

        box1 {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 100px;
            padding-bottom: 300px;
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


        div2 {
            margin-top: 20px;
            width: 100%;
        }
        div3 {

            margin-left: 10px;
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
    / booking
</div>
<%--<c:if test="${user_exist == true}">--%>
<%--    <p class="w3-text-red"> Such a user already exists!</p>--%>
<%--    <p><a href="/login" class="w3-text-blue">Please log in</a></p>--%>
<%--</c:if>--%>
<c:if test="${car_status_error == true}">

    <box1>
        <flex class="w3-card-4 w3-round-large w3-padding" style="width: 40%">
            <p style="font-size: 24px; color: red">Sorry this car has status:</p>
                <c:if test="${car.status == 'BOOKED'}">
                    <p class="w3-btn w3-round-large w3-yellow" href="/booking/${car.id}">${car.status}</p>
                </c:if>
                <c:if test="${car.status == 'BUSY'}">
                    <p class="w3-btn w3-round-large w3-red">${car.status}</p>
                </c:if></p>
            <figure class="mb-0"><img src="${car.image}" alt="${car.brand} ${car.model}"></figure>
            <button class="w3-btn w3-round-large w3-red"> <a href="/catalog">Select another car from catalog</a></button>
        </flex>
    </box1>

</c:if>

<c:if test="${car_not_found == true}">
    <flex class="w3-container w3-padding">
        <p>
        <h2>We are sorry((</h2></p>
        <p>
        <h2>This car not found in catalog</h2></p></br>
        <a style="color: cornflowerblue" href="${pageContext.request.contextPath}/catalog">Select another car from catalog</a></p>
    </flex>
</c:if>

<c:if test="${car_status_error == null}">
<c:if test="${car_not_found == null}">

<p class="w3-container w3-padding w3-margin"></p>
<box><p style="font-size: 60px" class="w3-text-red">Booking</p>

    <box class="w3-card-4 w3-round-large w3-padding" style="width: 60%">

        <div2>
            <div3>
                <c:if test="${car.status == 'FREE'}">
                    <p class="w3-btn w3-round-large w3-green">${car.status}</p>
                </c:if>
                <c:if test="${car.status == 'BOOKED'}">
                    <p class="w3-btn w3-round-large w3-yellow">${car.status}</p>
                </c:if>
                <c:if test="${car.status == 'BUSY'}">
                    <p class="w3-btn w3-round-large w3-red">${car.status}</p>
                </c:if>

            </div3>
        </div2>

        <h2><a href=${pageContext.request.contextPath}/car/${car.id}
               class="w3-text-blue"> ${car.brand} ${car.model} ${car.year}</a></h2>
        <figure class="mb-0"><img src="${car.image}" alt="${car.brand} ${car.model}"></figure>

        <h6> &#9989; ${car.placeQuantity} places &#9989; ${car.transmission}
            &#9989;${car.doorQuantity} doors &#9989; ${car.fuelType} </h6>
        <flex>

            <table>
                <p style="font-size: 18px">Detail order</p>
                <tr>
                    <th> <span style="font-size: 10px">Rental date </span></th>
                    <th> <span style="font-size: 10px">Return date:</span></th>
                    <th> <span style="font-size: 10px">Rental days</span></th>
                    <th> <span style="font-size: 10px">Price for day</span></th>
                    <th> <span style="font-size: 10px">Discount</span></th>
                    <th> <span style="font-size: 10px">Total price </span></th>
                </tr>
                <tr>
                    <th style="font-size: 16px"><span style="color: crimson" aria-flowto=""> ${rental.rentalDate} at 12.00 PM</span></th>
                    <th style="font-size: 16px"><span style="color: crimson" aria-flowto=""> ${rental.rentalDate} at 12.00 PM</span></th>
                    <th style="font-size: 16px"><span style="color: crimson" aria-flowto=""> ${rental.rentalDays}</span></th>
                    <th style="font-size: 16px"><span style="color: crimson" aria-flowto=""> ${rental.carDto.price}</span></th>
                    <c:if test="${rental.rentalDays <= 3}">
                        <th style="font-size: 16px"><span style="color: crimson" aria-flowto="">0 %</span></th>
                    </c:if>
                    <c:if test="${rental.rentalDays >= 4 && rental.rentalDays <= 7}">
                        <th style="font-size: 16px"><span style="color: crimson" aria-flowto="">10 %</span></th>
                    </c:if>
                    <c:if test="${rental.rentalDays >= 8 && rental.rentalDays <= 15}">
                        <th style="font-size: 16px"><span style="color: crimson" aria-flowto="">25 %</span></th>
                    </c:if>
                    <c:if test="${rental.rentalDays > 16}">
                        <th style="font-size: 16px"><span style="color: crimson" aria-flowto="">35 %</span></th>
                    </c:if>

                    <th style="font-size: 16px"><span style="color: crimson" aria-flowto=""> ${rental.price}$</span></th>
                </tr>
            </table>
            <h3 class="w3-padding w3-text-blue"> You confirm compliance with the minimum rental conditions:</h3>

            <h7 class="w3-padding w3-text-black ">&#9989; Driving experience of at least 2 years.</h7>
            <h7 class="w3-padding w3-text-black ">&#9989; The minimum age is 20 years.</h7>
            <h7 class="w3-padding w3-text-black ">&#9989; The minimum rental period is 2 hours.</h7>
            <h7 class="w3-padding w3-text-black ">&#9989; Mileage limits - 300 km / day, every subsequent 300 km. for $
                10 (at the rate of the NBRB).
            </h7>
            <h7 class="w3-padding w3-text-black ">&#9989; Without the possibility of leaving the Republic of Belarus.
            </h7>
            <h7 class="w3-padding w3-text-black ">&#9989; The rental price includes CASCO insurance.</h7>
            <h7 class="w3-padding w3-text-black ">&#9989; Deposit (deposit) 500r.</h7>

        </flex>

    </box>
    </br>

    <form method="post" class="w3-card-4  w3-round-large w3-padding" style="width: 60%">
        <flex>
            <h1>Your data</h1><br>
            <table style="font-size: 10px">
                <tr>
                    <th>*Full name</th>
                    <th>*Date of birthday</th>
                    <th>*Phone number</th>
                    <th>*Email</th>
                    <th>Address</th>
                </tr>

                <td><label for="full_name_id"></label>
                    <input class="w3-round-large"
                           maxlength="20"
                           type="text"
                           placeholder="Enter full name"
                           name="fullName"
                           value="${uzer.fullName}"
                           id="full_name_id"
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
                           value="${uzer.phone}"
                           id="phone_id"
                    /><br></td>

                <td><label for="email_id"></label>
                    <input class="w3-round-large"
                           maxlength="50"
                           type="email"
                           placeholder="Enter your email"
                           name="email"
                           value="${uzer.email}"
                           id="email_id"
                    /><br></td>

                <td><label for="address_id"></label>
                    <input class="w3-round-large"
                           maxlength="100"
                           type="text"
                           placeholder="Enter city,street,No."
                           name="address"
                           value="${uzer.address}"
                           id="address_id"
                    /><br></td>
            </table>
                <sec:authorize access="!isAuthenticated()">
                    <h1>Password </h1><br>
                    <table style="font-size: 10px">
                    <tr>
                    <th>*Password</th>
                        <th>*Confirm password</th>
                    </tr>

                    <td><label for="psw_id"></label>
                        <input class="w3-round-large"
                               maxlength="100"
                               minlength="8"
                               type="password"
                               placeholder="Enter password"
                               name="password"
                               id="psw_id"
                        /><br></td>
                    <td><label for="psw_check_id"></label>
                        <input class="w3-round-large"
                               maxlength="100"
                               minlength="8"
                               type="password"
                               placeholder="Confirm password"
                               name="passwordCheck"
                               id="psw_check_id"
                        /><br></td>

                </sec:authorize>

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
                               width="350px"
                               maxlength="9"
                               type="text"
                               name="passport"
                               id="passport_id"
                               required/><br></td>

                    <td><label for="driver_id"></label>
                        <input class="w3-round-large"
                               width="350 px"
                               maxlength="9"
                               type="text"
                               name="driverLicense"
                               id="driver_id"
                               required/><br></td>

                </table>
                <br>
                <label> <input class="w3-round-large" name="agreement" type="checkbox" checked required/> I agree to the processing of personal
                    data</label><br>

                <button class="w3-btn w3-round-large w3-red" type="submit">Send</button>
                <br>
</c:if>
        </flex>
    </form>
    <br>
</box>
</c:if>
<%@include file="footer.jsp" %>
</body>
</html>