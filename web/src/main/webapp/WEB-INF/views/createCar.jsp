<%@ page import="by.potapenko.database.entity.CarEntity" %>
<%@ page import="java.util.Optional" %>
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
    <title>Create new car</title>
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
            width: auto;
            height: 30px;
            font-size: 10px;
        }

        input {
            width: auto;
            height: 30px;
            font-size: 10px;
        }
    </style>
</head>
<body>
<%@include file="headerAdmin.jsp" %>
<div><a href="/admin">Home </a>/ create new car</div>

<box>
    <form method="post" class="w3-card-4 w3-blue-grey w3-round-large w3-padding" style="width: 90%">
        <flex>
            <c:if test="${create_car == null}">
                <h1>Car</h1><br>
                <table style="font-size: 10px">
                    <tr>
                        <th>Brand</th>
                        <th>Model</th>
                        <th>Year of release</th>
                        <th>Color</th>
                        <th>Fuel type</th>
                        <th>Engine, l</th>
                        <th>Horse power, h.p</th>
                        <th>Transmission</th>
                    </tr>

                    <td><label for="brand_id"></label>
                        <select class="w3-round-large"
                                id="brand_id"
                                name="brand"
                                required>
                            <option value="">--Brand car--</option>
                            <option value="Audy">Audy</option>
                            <option value="BMW">BMW</option>
                            <option value="Citroen">Citroen</option>
                            <option value="Ford">Ford</option>
                            <option value="Renault">Renault</option>
                            <option value="Hyundai">Hyundai</option>
                        </select><br></td>

                    <td><label for="model"></label>
                        <input class="w3-round-large"
                               maxlength="20"
                               type="text"
                               placeholder="Enter model car"
                               name="model"
                               id="model"
                               required/><br></td>

                    <td><label for="year_id"></label>
                        <select class="w3-round-large"
                                id="year_id"
                                maxlength="4"
                                name="year"
                                required>
                            <option value="">--Year--</option>
                            <c:forEach var="i"
                                       items="${[2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023]}">
                                <option value="${i}">${i}</option>
                            </c:forEach>
                        </select><br></td>

                    <td><label for="color_id"></label>
                        <select class="w3-round-large"
                                id="color_id"
                                name="color"
                                required>
                            <option value="">--Color car--</option>
                            <option value="WHITE">White</option>
                            <option value="BLACK">Black</option>
                            <option value="BLUE">Blue</option>
                            <option value="GREY">Grey</option>
                            <option value="RED">Red</option>
                            <option value="GREEN">Green</option>
                            <option value="YELLOW">Yellow</option>
                        </select><br></td>

                    <td><label for="fuel_id"></label>
                        <select class="w3-round-large"
                                id="fuel_id"
                                name="fuelType"
                                required>
                            <option value="">--Fuel type--</option>
                            <option value="GASOLINE">Gasoline</option>
                            <option value="GAS">Gas</option>
                            <option value="DIESEL">Diesel</option>
<%--                            <option value="ELECTRIC">Electric</option>--%>
                        </select><br></td>

                    <td><label for="engine_id"></label>
                        <select class="w3-round-large"
                                id="engine_id"
                                name="engineCapacity"
                                required>
                            <option value="">--Engine capacity, l--</option>
                            <c:forEach var="i" items="${[1.4,1.5,1.6,1.7,1.8,1.9,2.0,2.1,2.2,2.3,2.5]}">
                                <option value="${i}">${i}</option>
                            </c:forEach>
                        </select><br></td>

                    <td><label for="power_id"></label>
                        <input class="w3-round-large"
                               maxlength="3"
                               type="number"
                               placeholder="Enter horse power"
                               name="horsePower"
                               id="power_id"
                               required/><br></td>

                    <td><label for="transmission_id"></label>
                        <select class="w3-round-large"
                                id="transmission_id"
                                name="transmission"
                                required>
                            <option value="">--Transmission type--</option>
                            <option value="AUTOMATIC">Automatic</option>
                            <option value="MANUAL">Manual</option>
                            <option value="HYBRID">Hybrid</option>
                        </select><br></td>

                </table>
                <table style="font-size: 10px">
                    <tr>
                        <th>Consumption on 100 km, l</th>
                        <th>Places</th>
                        <th>Doors</th>
                        <th>Trunk,l</th>
                        <th>VIN code</th>
                        <th>Car number</th>
                        <th>Price,$</th>
                    </tr>
                    <td><label for="consumption_id"></label>
                        <select class="w3-round-large"
                                id="consumption_id"
                                name="fuelConsumption"
                                required>
                            <option value="">--Fuel consumption--</option>
                            <c:forEach var="i" items="${[6.4,6.5,6.6,6.7,6.8,6.9,7.0,7.1,7.2,7.3,7.5]}">
                                <option value="${i}">${i}</option>
                            </c:forEach>
                        </select><br></td>

                    <td><label for="places_id"></label>
                        <select class="w3-round-large"
                                id="places_id"
                                name="placeQuantity"
                                required>
                            <option value="">--Places quantity--</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                        </select><br></td>

                    <td><label for="doors_id"></label>
                        <select class="w3-round-large"
                                id="doors_id"
                                name="doorQuantity"
                                required>
                            <option value="">--Doors quantity--</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                        </select><br></td>

                    <td><label for="trunk_id"></label>
                        <input class="w3-round-large"
                               maxlength="3"
                               type="number"
                               placeholder="Enter trunk volume"
                               name="trunkVolume"
                               id="trunk_id"
                               required/><br></td>

                    <td><label for="vinCode_id"></label>
                        <input class="w3-round-large"
                               maxlength="17"
                               type="text"
                               placeholder="Enter VIN-code"
                               name="vinCode"
                               id="vinCode_id"
                               required/>
                        </input><br></td>

                    <td><label for="number_id"></label>
                        <input class="w3-round-large"
                               maxlength="17"
                               type="text"
                               placeholder="Enter number car"
                               name="number"
                               id="number_id"
                               required/>
                        </input><br></td>

                    <td><label for="price_id"></label>
                        <input class="w3-round-large"
                               maxlength="3"
                               type="number"
                               placeholder="Enter price rental"
                               name="price"
                               id="price_id"
                               required/><br></td>
                </table>
                <br>
                <button class="w3-btn w3-white w3-round-large" type="submit">Create</button>
                </br>

                <p style="font-size: 12px"><a href="${pageContext.request.contextPath}/admin/cars">Back</a></p>
            </c:if>
            <c:if test="${create_car == false}">
                <p style="font-size: 20px" class="w3-text-red"> Sorry! Creating doesn't possible now, please try
                    again </p>
                <a href="/admin/cars/create_car" class="w3-text-blue">Create new car</a><br>
            </c:if><br>
        </flex>
    </form>
</box>
</body>
</html>