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
    <title>Cars</title>
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
<div><a href="/admin">Home </a><a href="${pageContext.request.contextPath}/admin/cars/car/${car.id}">/ edit</a></div>
<box>
    <form method="post" class="w3-card-4 w3-blue-grey w3-round-large w3-padding" style="width: 90%">
        <a style="font-size: 12px" href="${pageContext.request.contextPath}/admin/cars/create_car">Create new car</a>
        <flex>
            <c:if test="${car_id == false}">
                <p class="w3-text-green"> This car ID doesn't exist</p>
            </c:if>
            <c:if test="${car_id == true || create_car == true}">
                <h1>${car.brand} ${car.model}</h1>
                <table style="font-size: 10px">
                    <tr>
                        <th>Car_id</th>
                        <th>Brand</th>
                        <th>Model</th>
                        <th>Year of release</th>
                        <th>Color</th>
                        <th>Fuel</th>
                        <th>Engine, l</th>
                        <th>Horse power</th>
                        <th>Transmission</th>
                        <th>Consumption 100 km</th>
                        <th>Places</th>
                        <th>Doors</th>
                        <th>Trunk, l</th>
                        <th>VIN code</th>
                        <th>Number</th>
                        <th>Price, $</th>
                        <th>Delete</th>
                        <th>Edit</th>
                    </tr>
                    <tr>
                        <td>${car.id}</td>
                        <td>${car.brand}</td>
                        <td>${car.model}</td>
                        <td>${car.year}</td>
                        <td>${car.color}</td>
                        <td>${car.fuelType}</td>
                        <td>${car.engineCapacity}</td>
                        <td>${car.horsePower}</td>
                        <td>${car.transmission}</td>
                        <td>${car.fuelConsumption}</td>
                        <td>${car.placeQuantity}</td>
                        <td>${car.doorQuantity}</td>
                        <td>${car.trunkVolume}</td>
                        <td>${car.vinCode}</td>
                        <td>${car.number}</td>
                        <td>${car.price}</td>
                        <td><b><a href="/admin/cars/car/delete_car/${car.id}" class="w3-text-red">DELETE</a></b></td>
                        <td><b><a href="/admin/cars/car/update_car/${car.id}" class="w3-text-blue">EDITE</a></b></td>
                    </tr>
                </table>
                </br>
                <p style="font-size: 12px"><a href="${pageContext.request.contextPath}/admin/cars">Back</a></p>
            </c:if>
        </flex>
    </form>
</box>
</body>
</html>