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
            width: 90%;
        }

        th {
            font-size: 12px;
            padding: 5px;
            border: 1px solid lightblue;
        }
        td {
            font-size: 16px;
            padding: 5px;
            border: 1px solid lightblue;
        }

        box {
            display: flex;
            width: 25%;
            flex-direction: column;
            align-items: center;
            margin-top: 1%;
            margin-bottom: 1%;
        }

        flex {
            display: flex;
            flex-direction: column;
            height: 500px;
            margin-top: 6%;
            margin-bottom: 10%;

        }

        .wrap {
            max-width: 70%;
            height: 200%;
            margin-left: 25%;
            padding-top: 10px;
        }

        .bblock {
            float: left;
            min-width: 30%;
            height: 420px;
            margin-right: 2%;
            margin-top: 2%;
            text-align: center;
        }

        .blockavto {
            display: flex;
            flex-direction: row;
            float: left;
            min-width: 30%;
            height: 60px;
            margin-right: 2%;
            margin-top: 1%;
            text-align: left;
        }

        .block {
            flex-direction: row;
            width: 100%;
            height: 100%;
            padding-top: 10px;
        }

        .form{
            position: absolute;
            width: 18%;
            height: 500px;
            margin-left: 2%;
            margin-top: 3px;
            text-align: left;
        }

        .head{
            flex-direction: row;
            margin-right: 3%;
            padding-top: 10px;
            margin-left: 3%;
            height: 60px;
        }

        div {
            padding-top: 80px;
            padding-left: 1%;
        }
        div1 {
            margin: 0 auto;
        }

        div2 {
            display: flex;
         width: 100%;
            flex-direction: row;
        }
        div3 {
           padding-left: 80px;
            height: 70px;
        }
        div5{
            padding-left: 150px;
        }
        div6{
            width: 160px;
        text-align: right;
        }

        .kpp{
            padding-top: 10%;
            width: 250px;
            height: 100px;
            padding-left: 1%;
        }

        .fuel{
            padding-top: 10%;
            margin-top: 30%;
            width: 250px;
            height: 100px;
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
        div7{
            width: 500px;
            height: 60px;
        }

        input {
            text-align: center;
            width: 200px;
            height: 30px;
            font-size: 10px;
        }
        input.smallCheckbox {
            width: 15px;
            height: 15px;
            padding-right: 5%;
        }



        /* Начало стилей  */
        .Window {
            position: fixed;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            background: rgba(0,0,0,0.7);
            display: none;
            pointer-events: none;
        }

        .Window:target {
            display: block;
            pointer-events: auto;
        }

        .Window > div {
            width: 400px;
            height: 450px;
            position: relative;
            margin: 10% auto;
            padding: 20px;
            border-radius: 5px;
            background: #f2f2f2;
            box-shadow: 0px 0px 20px 2px;
        }



    </style>
</head>
<body>
<%@include file="header.jsp" %>
<div><a href="/">Home </a><a href="${pageContext.request.contextPath}/catalog">/ catalog</a>

    <form style="margin-left: 75%; margin-top: 1px; margin-bottom: 2%; position: absolute">

        <input style="border: 1px solid lightslategray; border-radius: 5px" type="text" name=text" class="search" placeholder="">

        <input class="w3-btn w3-round-large w3-border w3-tiny w3-white w3-padding w3-margin-left" style="width: 20%; margin-left: 60%; margin-top: 1px" type="submit" name="submit" value="Search">

    </form>
    <h2 >Rent a car without a driver </h2>
        <h6 >The company "CAR RENTAL SERVICE" provides services for renting a car without a driver for a day for any purpose. In our fleet there is a wide selection of passenger cars from budget to business class, as well as minibuses, motorcycles and motorhomes. By contacting us, you will always be able to find exactly the transport that will allow you to make tourist trips with convenience and comfort, meet friends or perform official duties.</h6>
</div>

<div class="head">

    <a href="/catalog?type=ECONOMIC" style="font-size: 14px" class="w3-btn w3-round-large w3-tiny w3-white  w3-margin-right">Economic</a>
    <a href="/catalog?type=AVERAGE" style="font-size: 14px" class="w3-btn w3-round-large w3-tiny w3-white w3-padding w3-margin-right">Average</a>
    <a href="/catalog?type=COMFORT"style="font-size: 14px" class="w3-btn w3-round-large w3-tiny w3-white w3-padding w3-margin-right">Comfort+</a>
    <a href="/catalog?type=BUSINESS" style="font-size: 14px" class="w3-btn w3-round-large w3-tiny w3-white w3-padding w3-margin-right">Business</a>
    <a href="/catalog?type=PREMIUM" style="font-size: 14px" class="w3-btn w3-round-large w3-tiny w3-white w3-padding w3-margin-right">Premium</a>
    <a href="/catalog?type=CABRIOLET" style="font-size: 14px" class="w3-btn w3-round-large w3-tiny w3-white w3-padding w3-margin-right">Cabriolet</a>
    <a href="/catalog?type=JEEP"style="font-size: 14px" class="w3-btn w3-round-large w3-tiny w3-white w3-padding w3-margin-right">Jeep</a>
    <a href="/catalog?type=MINIVAN" style="font-size: 14px" class="w3-btn w3-round-large w3-tiny w3-white w3-padding w3-margin-right">Minivan</a>
    <a href="/catalog?type=ELECTRIC" style="font-size: 14px" class="w3-btn w3-round-large w3-tiny w3-white w3-padding w3-margin-right">Electric</a>
    <a href="/catalog?type=LUKS" style="font-size: 14px" class="w3-btn w3-round-large w3-tiny w3-white w3-padding">Luks</a>
    <a href="/catalog?brand=Audy" style="font-size: 14px" class="w3-btn w3-round-large w3-tiny w3-white w3-padding w3-margin-right">AUDY</a>
    <a href="/catalog?brand=Bmw"style="font-size: 14px" class="w3-btn w3-round-large w3-tiny w3-white w3-padding w3-margin-right">BMW</a>
    <a href="/catalog?brand=Citroen"style="font-size: 14px" class="w3-btn w3-round-large w3-tiny w3-white w3-padding w3-margin-right">CITROEN</a>
    <a href="/catalog?brand=Ford" style="font-size: 14px" class="w3-btn w3-round-large w3-tiny w3-white w3-padding w3-margin-right">FORD</a>
    <a href="/catalog?brand=Renault" style="font-size: 14px" class="w3-btn w3-round-large w3-tiny w3-white w3-padding w3-margin-right">RENAULT</a>
    <a href="/catalog?brand=Volkswagen" style="font-size: 14px"  class="w3-btn w3-round-large w3-tiny w3-white w3-padding w3-margin-right">VOLKSWAGEN</a>

</div>

<div id="ModalOpen" class="Window">

        <form method="post"  action="/quickly-order" class="w3-card-4 w3-yellow w3-round-large w3-padding" style="width: 30%; height: 40%; margin-left: 30%; margin-top: 10%; align-items: center">
            <a href="#close" title="Close" style="margin-left: 95%" class="close">X</a>
                    <p style="font-size: 16px">

                <p style="font-size: 18px">Quickly order</p>
                <label for="username_id">Name</label>

                <input style="width: 80%; margin-left: 10%; margin-top: 2%" class="w3-round-large"
                       type="text"
                       maxlength="20"
                       placeholder="Enter your name"
                       name="username"
                       id="username_id"
                       required/><br>

                <label for="phone_id">Phone</label>
                <input style="width: 80%;  margin-left: 10%; margin-top: 2%" class="w3-round-large"
                       maxlength="13"
                       minlength="12"
                       type="tel"
                       placeholder="Enter your phone"
                       name="phone"
                       id="phone_id"
                       required/></p>
                <button class="w3-btn w3-white w3-tiny w3-round-large" style="margin-left: 80%" type="submit">Submit</button>
                </br>
            </flex>
        </form>
    </div>
</div>

<div id="false" class="Window">

    <form  class="w3-card-4 w3-red  w3-round-large w3-padding" style="width: 30%; height: 40%; margin-left: 30%; margin-top: 10%; text-align: center">
        <a href="#close" title="Close" style="margin-left: 95%" class="close">X</a>

        <p style="font-size: 24px; color: red">Such a request already exists!
            </p> </br>
        <p style="font-size: 24px; color: red">Wait for the call!</p>

        </br>
        </flex>
    </form>
</div>
</div>


<div id="true" class="Window">

    <form  class="w3-card-4 w3-green w3-round-large w3-padding" style="width: 30%; height: 40%; margin-left: 30%; margin-top: 10%; text-align: center">
        <a href="#close" title="Close" style="margin-left: 95%" class="close">X</a>

        <p style="font-size: 24px; color: white; margin-top: 5%">Your application has been accepted!</p> </br>
        <p style="font-size: 18px; color: white">Our manager will call you back soon!</p>

        </br>
        </flex>
    </form>
</div>
</div>


<div class="block">
    <form class="form"  action="/catalog">
        <flex class="w3-border w3-round-large w3-padding" style="width: 100%">
            <p style="font-size: 14px;font-weight: bold">Filter</p>

                <div class="kpp">
                    <p style="font-size: 14px;font-weight: bold; padding-left: 5%">Transmission</p>
                        <ul>
                            <li>
                                <label style="font-size: 10px ; padding-left: 5%"><input  class="smallCheckbox" style="margin-right: 10%" name="transmission" type="checkbox" value="MANUAL"
                                       />Manual</label>
                            </li><br>
                            <li>
                               <label style="font-size: 10px ; padding-left: 5%"><input class="smallCheckbox" style="margin-right: 10%" name="transmission" type="checkbox" value="AUTOMATIC"
                                       />Automatic</label>
                            </li><br>
                            <li>
                               <label style="font-size: 10px ; padding-left: 5%"> <input class="smallCheckbox" style="margin-right: 10%" name="transmission" type="checkbox" value="HYBRID"
                                       />Hybrid</label>
                            </li><br>
                        </ul>
                </div>

                <div class="fuel">
                    <p style="font-size: 14px;font-weight: bold ;padding-left: 5%">Fuel type</p>
                        <ul>
                            <li> <label style="font-size: 10px ; padding-left: 5%"><input style="margin-right: 10%" class="smallCheckbox" name="fuelType" type="checkbox" value="DIESEL"
                                        />Diesel</label></li><br>

                            <li><label style="font-size: 10px ; padding-left: 5%"><input  style="margin-right: 10%" class="smallCheckbox"  name="fuelType" type="checkbox" value="GAS"
                                             />Gas</label></li><br>

                            <li><label style="font-size: 10px ; padding-left: 5%"><input style="margin-right: 10%" class="smallCheckbox"  name="fuelType" type="checkbox" value="GASOLINE"
                                               />Gasoline</label></li><br>
                        </ul>
                    </div>
            <div style="margin-top: 25%">
            <button type="submit" style="font-size: 14px; margin-left: 60%; width: 30%" class="w3-btn w3-round-large w3-border w3-tiny w3-white ">Submit</button>
</div>
        </flex>

    </form>

    <div class="wrap">

        <div class="blockavto w3-card-4 w3-round-large w3-padding" style="width: 94%">

<div7>
            <p  style="font-size: 14px;font-weight: bold ; width: 30%">Cars in our park</p>
            <p style="font-size: 12px;width: 30%; color: #8f9296; flex-direction: row">Find ${cars.size()} cars</p>
</div7>
            <div6>
                <p  style="font-size: 14px;font-weight: bold; color: #8f9296">Sort by price: </p>
            </div6>
                <div6>
                <a href="catalog?sort=ASC"  style="font-size: 14px;color: #8f9296; font-weight: bold" >cheap at first</a>
                </div6>
            <div6>
                    <a href="catalog?sort=DESC" style="font-size: 14px;color: #8f9296; font-weight: bold">dear ones first</a>
            </div6>
        </div>


        <c:forEach var="car" items="${cars}">
                <div class="bblock w3-card-4 w3-round-large w3-padding" style="width: 22%">
                  <div2>
                    <p style="font-size: 20px"><a href=${pageContext.request.contextPath}/catalog/car/${car.id}
                       class="w3-text-blue"> ${car.brand} ${car.model} ${car.year}</a></p>
                    <div3>

                        <c:if test="${car.status == 'FREE'}">
                        <p style="font-size: 10px" class="w3-btn w3-round-large w3-green">${car.status}</p>
                        </c:if>
                        <c:if test="${car.status == 'BOOKED'}">
                            <p style="font-size: 10px" class="w3-btn w3-round-large w3-yellow">${car.status}</p>
                        </c:if>
                        <c:if test="${car.status == 'BUSY'}">
                            <p style="font-size: 10px" class="w3-btn w3-round-large w3-red">${car.status}</p>
                        </c:if>

                    </div3>
                </div2>
                <a href=${pageContext.request.contextPath}/catalog/car/${car.id} >
                    <figure style="margin: 0 auto"> <img  width="250" height="135"   src="${car.image}" alt="${car.brand} ${car.model}"></figure></a>
                <p style="font-size: 12px"> &#9989; ${car.placeQuantity} places &#9989; ${car.transmission}
                    &#9989;${car.doorQuantity} doors &#9989; ${car.fuelType}
                </p>
                </table>
                <table>
                    <button class="w3-btn w3-round-large w3-tiny w3-yellow" style="width: 40%; height: 25px; margin-top: 1%; margin-bottom: 3%" onclick="location.href='#ModalOpen'">Quickly order
                    </button>
                    <tr>
                        <th> <span style="font-size: 10px">1-3 days </span></th>
                        <th> <span style="font-size: 10px">4-7 days </span></th>
                        <th> <span style="font-size: 10px">8-15 days </span></th>
                        <th> <span style="font-size: 10px">16-30 days </span></th>
                    </tr>
                    <tr>
                        <th style="font-size: 12px"><span style="color: crimson" aria-flowto=""> ${car.price*1.0}$</span></th>
                        <th style="font-size: 12px"><span style="color: crimson" aria-flowto=""> ${car.price*0.9}$</span></th>
                        <th style="font-size: 12px"><span style="color: crimson" aria-flowto=""> ${car.price*0.75}$</span></th>
                        <th style="font-size: 12px"><span style="color: crimson" aria-flowto=""> ${car.price*0.65}$</span></th>
                    </tr>
                </table><br>
                <button class="w3-btn w3-round-large w3-tiny w3-red" style="width: 90%" onclick="location.href='/order/${car.id}'">Order
                </button>
                </br>


            </div>
     </c:forEach>
</div>
</div>

    <form>
        <box>
            <div2 class="d-flex flex-justify-center">
                <nav2 class="paginate-container">
                    <div2 class="pagination">
                        <c:if test="${page > 1 }">
                            <a href="${pageContext.request.contextPath}/catalog?limit=${limit}&page=${page-1}"
                               class="previous_page" aria-disabled="false">Previous</a>
                            <a href="${pageContext.request.contextPath}/catalog?limit=${limit}&page=1"> 1 </a>
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
                                    <a href="/catalog?limit=${limit}&page=${i}"> ${i} </a>
                                </c:if>
                            </c:if>
                        </c:forEach>

                        <c:if test="${count == page}">
                            <span class="next_page" aria-disabled="true">Next</span>
                        </c:if>

                        <c:if test="${count != page}">
                            <span class="gap"> … </span>
                            <a href="${pageContext.request.contextPath}/catalog?limit=${limit}&page=${count}"> ${count} </a>
                            <a class="next_page"
                               href="${pageContext.request.contextPath}/catalog?limit=${limit}&page=${page+1}"
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
<%--                <input name="page" value="${page}" hidden>--%>
                <button class="w3-btn w3-white w3-round-large" type="submit">Show page</button>
                </br>
            </div1>
        </box>
    </form>
</flex>
<%@include file="footer.jsp" %>
</body>
</html>
