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
    <title>Catalog</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="shortcut icon" type="image/x-icon"
          href="https://e7.pngegg.com/pngimages/330/810/png-clipart-car-dealership-graphics-sports-car-computer-icons-car-blue-driving.png">
    <link rel="stylesheet" href=
            "https://unpkg.com/@primer/css@^18.0.0/dist/primer.css"/>
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
            align-items: center;
            margin-top: 10%;
            margin-bottom: 10%;
        }

        div {
            padding-top: 80px;
            padding-left: 1%;
        }

        nav1 {
            position: fixed;
            margin-left: 1%;
            width: 20%;
        }

        select {
            text-align: center;
            width: 200px;
            height: 30px;
            font-size: 10px;
        }

        input {
            text-align: center;
            width: 200px;
            height: 30px;
            font-size: 10px;
        }

    </style>
</head>
<body>
<%@include file="header.jsp" %>
<div><a href="/">Home </a><a href="${pageContext.request.contextPath}/catalog">/ catalog</a></div>
</nav1>
<nav1>
    <form>
        <flex class="w3-border w3-round-large w3-padding" style="width: 100%">
            <p style="font-size: 16px">
            <h6>Filter</h6>
                        <input hidden name="limit" value="${limit}"/>
                        <input hidden name="page" value="${page}"/>
            <label for="brand_id"></label>
            <select class="w3-round-large"
                    id="brand_id"
                    name="brand">
                <option value= "">--Brand--</option>
                <option value="Audy">Audy</option>
                <option value="BMW">BMW</option>
                <option value="Citroen">Citroen</option>
                <option value="Ford">Ford</option>
                <option value="Renault">Renault</option>
                <option value="Hyundai">Hyundai</option>
            </select><br>

            <label for="model_id"></label>
            <select class="w3-round-large"
                    id="model_id"
                    name="mark">
                <option value="">--Model--</option>
                <option value="Audy">A8</option>
                <option value="BMW">X6</option>
                <option value="Citroen">C5</option>
                <option value="Ford">F1</option>
                <option value="Renault">A6</option>
                <option value="Hyundai">C8</option>
            </select><br>

            <label for="color_id"></label>
            <select class="w3-round-large"
                    id="color_id"
                    name="color">
                <option  value= "">--Color car--</option>
                <option value="WHITE">White</option>
                <option value="BLACK">Black</option>
                <option value="BLUE">Blue</option>
                <option value="GREY">Grey</option>
                <option value="RED">Red</option>
                <option value="GREEN">Green</option>
                <option value="YELLOW">Yellow</option>
            </select><br>

            <label for="fuel_id"></label>
            <select class="w3-round-large"
                    id="fuel_id"
                    name="fuelType">
                <option  value= "">--Fuel type--</option>
                <option value="GASOLINE">Gasoline</option>
                <option value="GAS">Gas</option>
                <option value="DIESEL">Diesel</option>
            </select><br>
            <label for="transmission_id"></label>
            <select class="w3-round-large"
                    id="transmission_id"
                    name="transmission">
                <option  value= "">--Transmission type--</option>
                <option value="AUTOMATIC">Automatic</option>
                <option value="MANUAL">Manual</option>
                <option value="HYBRID">Hybrid</option>
            </select><br>
            <label for="consumption_id"></label>
            <select class="w3-round-large"
                    id="consumption_id"
                    name="fuelConsumption">
                <option  value= "">--Fuel consumption--</option>
                <c:forEach var="i" items="${[6.4,6.5,6.6,6.7,6.8,6.9,7.0,7.1,7.2,7.3,7.5]}">
                    <option value="${i}">${i}</option>
                </c:forEach>
            </select><br>
            <button class="w3-btn w3-white w3-round-large" type="submit">Show</button>
            </br>
            <p style="font-size: 12px"><a href="${pageContext.request.contextPath}/catalog">clear</a></p>

        </flex>
    </form>
</nav1>
<c:if test="${find_car_error==false}">

    <c:forEach var="car" items="${cars}">
        <box class="w3-container ">
            <box class="w3-card-4 w3-round-large w3-padding" style="width: 50%"><br>
                <h2><a href=${pageContext.request.contextPath}/catalog/car?id=${car.id}
                       class="w3-text-blue"> ${car.brand} ${car.model} ${car.year}</a></h2>
                <h6> &#9989; ${car.placeQuantity} places &#9989; ${car.transmission}
                    &#9989;${car.doorQuantity} doors &#9989; ${car.fuelType}

             </h6><br>
                <table>
                    <tr>
                        <th>1-3 days</th>
                        <th>4-7 days</th>
                        <th>7-15 days</th>
                        <th>15-30 days</th>
                    </tr>
                    <tr>
                        <th>${car.price*1}$</th>
                        <th>${car.price*0.9}$</th>
                        <th>${car.price*0.8}$</th>
                        <th>${car.price*0.7}$</th>
                    </tr>
                </table>
                <br>
                <h2 class="w3-text-red">Price ${car.price}$</h2><br>
                <button class="w3-btn w3-round-large w3-red" onclick="location.href='/order?id=${car.id}'">Order
                </button>
                </br>
            </box>
        </box>
    </c:forEach>
</c:if>
<c:if test="${find_car_error==true}">
<flex class="w3-container w3-padding">
    <p>
    <h2>Nothing found, change the search parameters!</h2></p></br>
    </c:if>
    <form>
        <box>
            <div2 class="d-flex flex-justify-center">
                <nav2 class="paginate-container">
                    <div2 class="pagination">

                        <c:if test="${page > 1 }">
                            <a href="${pageContext.request.contextPath}/catalog/filter?limit=${limit}&page=${page-1}${parameters}"
                               class="previous_page" aria-disabled="false">Previous</a>
                            <a href="${pageContext.request.contextPath}/catalog/filter?limit=${limit}&page=1${parameters}">
                                1 </a>
                            <span class="gap"> … </span>
                        </c:if>

                        <c:if test="${page == 1}">
                            <span class="previous_page" aria-disabled="true">Previous</span>
                        </c:if>

                        <c:forEach begin="${page}" end="${page+2}" var="i">
                            <c:if test="${page == i}">
                                <em aria-current="${i}"> ${i} </em>
                            </c:if>
                            <c:if test="${i < count }">
                                <c:if test="${page != i }">
                                    <a href="/catalog/filter?limit=${limit}&page=${i}${parameters}"> ${i} </a>
                                </c:if>
                            </c:if>
                        </c:forEach>

                        <c:if test="${count == page}">
                            <span class="next_page" aria-disabled="true">Next</span>
                        </c:if>

                        <c:if test="${count != page}">
                            <span class="gap"> … </span>
                            <a href="${pageContext.request.contextPath}/catalog/filter?limit=${limit}&page=${count}${parameters}"> ${count} </a>
                            <a class="next_page"
                               href="${pageContext.request.contextPath}/catalog/filter?limit=${limit}&page=${page+1}${parameters}"
                               aria-label="Next">Next</a>
                        </c:if>
                    </div2>
                </nav2>
            </div2>
        </box>

        <box>
            <div1>
                <label for="limit_id"></label>
                <select class="w3-round-large"
                        id="limit_id"
                        name="limit">
                    <option selected>${limit}</option>
                    <option value="3">3</option>
                    <option value="6">6</option>
                    <option value="9">9</option>
                </select>
                <button class="w3-btn w3-white w3-round-large" type="submit">Show page</button>
                </br>
            </div1>
        </box>
    </form>
</flex>
<%@include file="footer.jsp" %>
</body>
</html>
