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
    <title>Update rental</title>
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
        .head{
            flex-direction: row;
            margin-right: 3%;
            padding-top: 20px;
            margin-left: 4%;
            height: 60px;
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
<div><a href="/admin">Home </a>/ update rental</div>

<div class="head">

    <form style="margin-left: 75%; margin-top: 1px; margin-bottom: 2%">
        <input style="border: 1px solid lightslategray; border-radius: 5px" type="text" name=text" class="search" placeholder="">
        <input class="w3-btn w3-round-large w3-border w3-tiny w3-white w3-padding w3-margin-left" type="submit" name="submit" class="submit" value="Search">
    </form>

    <a  style="font-size: 12px; font-weight: bold">Status order:</a>
    <a href="/admin/rentals?status=CHECK" style="font-size: 14px" class="w3-btn w3-round-large w3-tiny w3-white w3-padding w3-margin-right">Check</a>
    <a href="/admin/rentals?status=PROCESSING"style="font-size: 14px" class="w3-btn w3-round-large w3-tiny w3-white w3-padding w3-margin-right">Processing</a>
    <a href="/admin/rentals?status=REFUSED"style="font-size: 14px" class="w3-btn w3-round-large w3-tiny w3-white w3-padding w3-margin-right">Refused</a>
    <a href="/admin/rentals?status=APPROVE" style="font-size: 14px" class="w3-btn w3-round-large w3-tiny w3-white w3-padding w3-margin-right">Approve</a>
    <a  style="font-size: 12px; font-weight: bold">State order:</a>
    <a href="/admin/rentals?state=ACTIVE" style="font-size: 14px" class="w3-btn w3-round-large w3-tiny w3-white w3-padding w3-margin-right">Active</a>
    <a href="/admin/rentals?state=PASSIVE"style="font-size: 14px" class="w3-btn w3-round-large w3-tiny w3-white w3-padding w3-margin-right">Passive</a>
    <a href="/admin/rentals?state=REFUSED"style="font-size: 14px" class="w3-btn w3-round-large w3-tiny w3-white w3-padding w3-margin-right">Refused</a>
    <a href="/admin/rentals?state=COMPLETE" style="font-size: 14px" class="w3-btn w3-round-large w3-tiny w3-white w3-padding w3-margin-right">Complete</a>
    <a  style="font-size: 14px" class="w3-btn w3-round-large w3-tiny w3-white w3-padding w3-margin-right"></a>
    <a style="font-size: 14px" class="w3-btn w3-round-large w3-tiny w3-white w3-padding w3-margin-right"></a>
    <a style="font-size: 14px" class="w3-btn w3-round-large w3-tiny w3-white w3-padding w3-margin-right"></a>
    <a  style="font-size: 12px; font-weight: bold">Sort:</a>
    <a href="/admin/rentals?sort=ASC" style="font-size: 14px" class="w3-btn w3-round-large w3-tiny w3-white w3-padding 3-margin-right">Sort by id</a>
    <a href="/admin/rentals?sort=DESC" style="font-size: 14px" class="w3-btn w3-round-large w3-tiny w3-white w3-padding w3-margin-right">Sort by date</a>




    <%--    <a href="/catalog?brand=Ford" style="font-size: 14px" class="w3-btn w3-round-large w3-tiny w3-white w3-padding w3-margin-right">FORD</a>--%>
    <%--    <a href="/catalog?brand=Renault" style="font-size: 14px" class="w3-btn w3-round-large w3-tiny w3-white w3-padding w3-margin-right">RENAULT</a>--%>

</div>
<box>
    <form method="post" class="w3-card-4 w3-blue-grey w3-round-large w3-padding" style="width: 90%">
        <flex>
            <h1>Order No.${rental.id} </h1><br>
            <c:if test="${update_rental == true}">
                <p style="font-size: 20px" class="w3-text-green"> Order No.${rental.id} save successfully!</p>
                <p style="font-size: 16px"><a href="/admin/rentals/rental/${rental.id}">Back</a></p>
            </c:if><br>
            <c:if test="${update_rental == null}">
                <p style="font-size: 16px">
                <table style="font-size: 10px">
                    <tr>
                        <th>Rental id</th>
                        <th>Car brand</th>
                        <th>Car model</th>
                        <th>Client</th>
                        <th>Rental date</th>
                        <th>Return date</th>
                    </tr>
                    <td><label for="rental_id"></label>
                        <input class="w3-round-large"
                               name="id"
                               id="rental_id"
                               value="${rental.id}"
                               readonly/><br></td>

                    <td><label for="brand_id"></label>
                        <select class="w3-round-large"
                                id="brand_id"
                                name="brand"
                                required>
                            <option value="Audy">Audy</option>
                            <option value="BMW">BMW</option>
                            <option value="Citroen">Citroen</option>
                            <option value="Ford">Ford</option>
                            <option value="Renault">Renault</option>
                            <option value="Hyundai">Hyundai</option>
                            <option selected>${rental.carDto.brand}</option>
                        </select><br></td>

                    <td><label for="model"></label>
                        <input class="w3-round-large"
                               maxlength="20"
                               type="text"
                               placeholder="Enter model car"
                               name="model"
                               id="model"
                               value="${rental.carDto.model}"
                               required/><br></td>

                    <td><label for="user_id"></label>
                        <input class="w3-round-large"
                               name="user"
                               id="user_id"
                               value=" ${rental.userDto.fullName} "
                               readonly/><br></td>

                    <td><label for="rental_date_id"></label>
                        <input class="w3-round-large"
                               maxlength="20"
                               type="date"
                               min="${LocalDate.now()}"
                               name="rentalDate"
                               value="${rental.rentalDate}"
                               id="rental_date_id"
                        /><br></td>
                    <td><label for="return_date_id"></label>
                        <input class="w3-round-large"
                               maxlength="20"
                               type="date"
                               min="${LocalDate.now()}"
                               name="returnDate"
                               value="${rental.returnDate}"
                               id="return_date_id"
                        /><br></td>
                    <tr>
                        <th>Rental days</th>
                        <th>Price</th>
                        <th>Status</th>
                        <th>Creator rental</th>
                        <th>Date of creation</th>
                    </tr>
                            <td><label for="rental_days_id"></label>
                                <input class="w3-round-large"
                                       name="rentalDays"
                                       id="rental_days_id"
                                       value="${rental.rentalDays}"
                                       readonly/><br></td>

                            <td><label for="price_id"></label>
                                <input class="w3-round-large"
                                       name="price"
                                       id="price_id"
                                       value="${rental.price}"
                                       readonly/><br></td>

                <td><label for="status_id"></label>
                    <select class="w3-round-large"
                            id="status_id"
                            name="status"
                            required>
                        <option style="color: red" value=" CHECK">CHECK</option>
                        <option style="color: greenyellow" value="APPROVE">APPROVE</option>
                        <option style="color: red" value="REFUSED">REFUSED</option>
                        <option style="color: yellow" value="PROCESSING">PROCESSING</option>
                        <option selected>
                            <c:if test="${rental.status=='CHECK'}">
                                <p style="color: red"> ${rental.status}</p>
                            </c:if>
                            <c:if test="${rental.status=='PROCESSING'}">
                                <p style="color: yellow"> ${rental.status}</p>
                            </c:if>
                            <c:if test="${rental.status=='REFUSED'}">
                                <p style="color: red"> ${rental.status}</p>
                            </c:if>
                            <c:if test="${rental.status=='CLOSED'}">
                                <p style="color: white"> ${rental.status}</p>
                            </c:if>
                            <c:if test="${rental.status=='APPROVE'}">
                                <p style="color: greenyellow"> ${rental.status}</p>
                            </c:if>

                        </option>
                    </select><br></td>
                            <td><label for="creator_rental_id"></label>
                                <input class="w3-round-large"
                                       name="creator"
                                       id="creator_rental_id"
                                       value="${rental.creator}"
                                       readonly/><br></td>

                            <td><label for="date_of_creation_id"></label>
                                <input class="w3-round-large"
                                       name="dateOfCreation"
                                       id="date_of_creation_id"
                                       value="${rental.dateOfCreation}"
                                       readonly/><br></td>

                <td><label for="state_id"></label>
                    <select class="w3-round-large"
                            id="state_id"
                            name="state"
                            required>
                        <option style="color: red" value="PASSIVE">PASSIVE</option>
                        <option style="color: greenyellow" value="ACTIVE">ACTIVE</option>
                        <option style="color: red" value="REFUSED">REFUSED</option>
                        <option style="color: yellow" value="COMPLETE">COMPLETE</option>
                        <option selected> <p style="color: red"> ${rental.state}</p>
                        </option>
                    </select><br></td>

                        </tr>
                </table>
<%--                    <input hidden name="carDto" value="${rental.carDto}"/><br>--%>
                <br>
                    <button class="w3-btn w3-white w3-round-large" type="submit">Save</button>
                    </br>
            <p style="font-size: 16px"><button class="w3-btn w3-round-large" onclick="history.go(-1);">Back</button></p><br>
<%--                    <p style="font-size: 12px"><a href="/admin/rentals/rental/update_rental">Back</a></p>--%>
            </c:if>
            <c:if test="${update_rental == false}">
                <p class="w3-text-red"> Order No. ${rental.id} wasn't saved!</p>
                <a href="/admin/rentals/rental/${rental.id}" class="w3-text-blue">Try again</a></p>
            </c:if><br>
        </flex>
    </form>
</box>
</body>
</html>