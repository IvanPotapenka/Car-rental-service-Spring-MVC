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
        table {
            border-collapse: collapse;
            width: 100%;
        }

        th {
            font-size: 12px;
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
    </style>
</head>

<body>
<%@include file="header.jsp" %>
<div><a href="/">Home </a><a href="${pageContext.request.contextPath}/catalog">/ catalog</a><a href="/order">/ order</a><a
        href="/booking">/ booking</a></div>

<p class="w3-container w3-padding w3-margin"></p>
<box>
    <c:if test="${create_rental == true}">
    <p style="font-size: 20px" class="w3-text-green"> Your order has been formed successfully!</p>
    <p style="font-size: 14px"> Our manager will call you back within 30 minutes</p>
    <box class="w3-card-4 w3-round-large w3-padding" style="width: 80%">
        <flex>
                <table>
                    <p style="font-size: 18px">Order No.${rental.id}</p>
                    <tr>
                        <th> <span style="font-size: 10px">Client</span></th>
                        <th> <span style="font-size: 10px">Phone No.</span></th>
                        <th> <span style="font-size: 10px">Email</span></th>
                        <th> <span style="font-size: 10px">Car </span></th>
                        <th> <span style="font-size: 10px">Car No.</span></th>
                        <th> <span style="font-size: 10px">Rental date</span></th>
                        <th> <span style="font-size: 10px">Return date</span></th>
                        <th> <span style="font-size: 10px">Rental days </span></th>
                        <th> <span style="font-size: 10px">Price for a day </span></th>
                        <th> <span style="font-size: 10px">Discount </span></th>
                        <th><span style="font-size: 10px">Total price</span></th>
                    </tr>
                    <tr>
                        <th style="font-size: 16px"><span style="color: crimson" aria-flowto=""> ${rental.userDto.fullName}</span></th>
                        <th style="font-size: 16px"><span style="color: crimson" aria-flowto=""> ${rental.userDto.phone}</span></th>
                        <th style="font-size: 16px"><span style="color: crimson" aria-flowto=""> ${rental.userDto.email}</span></th>
                        <th style="font-size: 16px"><span style="color: crimson" aria-flowto=""> ${rental.carDto.brand} ${rental.carDto.model} ${rental.carDto.year}</span></th>
                        <th style="font-size: 16px"><span style="color: crimson" aria-flowto=""> ${rental.carDto.number}</span></th>
                        <th style="font-size: 16px"><span style="color: crimson" aria-flowto="">${rental.rentalDate} at
                12.00 PM</span></th>
                        <th style="font-size: 16px"><span style="color: crimson" aria-flowto=""> ${rental.returnDate} at
                12.00 PM</span></th>
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
                </table><br>

                <p style="font-size: 18px" class="w3-padding w3-text-black"> Where to pick up the car?
                    <a style="font-size: 12px" target="_blank" href="https://www.google.com/maps/place/Enterprise+Car+%26+Van+Hire+-+London+Bow/@51.528167,-0.0229837,17z/data=!3m1!4b1!4m6!3m5!1s0x48761fffe08f667f:0x8ab07dcc3e9e2ca2!8m2!3d51.528167!4d-0.020795!16s%2Fg%2F1td7h6pv?entry=ttu">
                    145b Bow Road,CITY OF BOW,London,ENG,GB,E3 2SA</a></p><br>

                <a  class="w3-btn w3-round-large w3-green" style="font-size: 14px" href="/account/orders"> Check status order</a>
            </c:if>
            <c:if test="${create_rental == false}">
           <box>
            <flex class="w3-card-4 w3-blue-grey w3-round-large w3-padding" style="width: 60%">
                <p style="font-size: 20px" class="w3-text-white"> Sorry! Creating doesn't possible now, please try
                    again letter </p><br>
            </flex>
           </box>
        </flex>
            </c:if><br>
    </box>
    </br>
</box><br><br><br><br><br><br><br><br><br><br><br
<%@include file="footer.jsp" %>
</body>
</html>