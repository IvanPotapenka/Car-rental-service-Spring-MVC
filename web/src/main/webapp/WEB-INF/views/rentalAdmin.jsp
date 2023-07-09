<%--
  Created by IntelliJ IDEA.
  User: Professional
  Date: 12.04.2023
  Time: 0:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href=
            "https://unpkg.com/@primer/css@^18.0.0/dist/primer.css"/>
    <title>Rentals</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }

        td {
            padding: 10px;
            border: 1px solid white;
        }

        th {
            padding: 10px;
            border: 1px solid white;
        }

        box {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 100px;

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

    </style>
</head>
<body>
<%@include file="headerAdmin.jsp" %>
<div><a href="/admin">Home </a><a href="${pageContext.request.contextPath}/admin/rentals/rental/${rental.id}">/ edit</a>
</div>
<box>
    <form method="post" class="w3-card-4 w3-blue-grey w3-round-large w3-padding" style="width: 90%">
        <a style="font-size: 12px" href="${pageContext.request.contextPath}/admin/rentals/create_rental">Create new rental</a>
        <flex>
                <p style="font-size: 16px">
                <h1>Order No.${rental.id}</h1>
                <table style="font-size: 10px">
                    <tr>
                        <th>Rental id</th>
                        <th>Car</th>
                        <th>rental full name </th>
                        <th>Rental date</th>
                        <th>Return date</th>
                        <th>Rental days</th>
                        <th>Price</th>
                        <th>Status</th>
                        <th>Date of creation</th>
                        <th>Delete</th>
                        <th>Edit</th>

                    </tr>
                    <tr>
                        <td>${rental.id}</td>
                        <td>${rental.carDto.brand} ${rental.carDto.model} No. ${rental.carDto.number}</td>
                        <td>${rental.clientDto.firstName} ${rental.clientDto.lastName}</td>
                        <td>${rental.rentalDate}</td>
                        <td>${rental.returnDate}</td>
                        <td>${rental.rentalDays}</td>
                        <td>${rental.price}</td>
                        <td><p style="color: crimson">${rental.status}</p> </td>
                        <td>${rental.dateOfCreation}</td>
                        <td><a href="${pageContext.request.contextPath}/admin/rentals/rental/delete_rental/${rental.id}"
                               class="w3-text-red">DELETE</a></td>
                        <td><a href="${pageContext.request.contextPath}/admin/rentals/rental/update_rental/${rental.id}"
                               class="w3-text-blue">EDIT</a></td>
                    </tr>
                </table>
                </br>
                <p style="font-size: 16px"><a href="${pageContext.request.contextPath}/admin/rentals">Back</a></p>
        </flex>
    </form>
</box>
</body>
</html>