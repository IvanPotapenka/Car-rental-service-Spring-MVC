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
<box>
    <form method="post" class="w3-card-4 w3-blue-grey w3-round-large w3-padding" style="width: 90%">
        <flex>
            <h1>Order No.${rental.id} </h1><br>
            <c:if test="${update_rental == false}">
                <p style="font-size: 20px" class="w3-text-green"> Order No.${rental.id} save successfully!</p>
                <p style="font-size: 16px"><a href="/admin/rantals/rental/${rental.id}">Back</a></p>
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
                               name="rental"
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

                    <td><label for="client_id"></label>
                        <input class="w3-round-large"
                               name="client"
                               id="client_id"
                               value=" ${rental.clientDto.firstName} "
                               readonly/><br></td>

                    <td><label for="rental_date_id"></label>
                        <input class="w3-round-large"
                               maxlength="20"
                               type="date"
                               min="${LocalDate.now()}"
                               name="rental_date"
                               value="${rental.rentalDate}"
                               id="rental_date_id"
                        /><br></td>
                    <td><label for="return_date_id"></label>
                        <input class="w3-round-large"
                               maxlength="20"
                               type="date"
                               min="${LocalDate.now()}"
                               name="return_date"
                               value="${rental.returnDate}"
                               id="return_date_id"
                        /><br></td>
                    <tr>
                        <th>Rental days</th>
                        <th>Price</th>
                        <th>Status</th>
<%--                        <th>Creator rental</th>--%>
                        <th>Date of creation</th>
                    </tr>
                            <td><label for="rental_days_id"></label>
                                <input class="w3-round-large"
                                       name="rental_days"
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
                                <input class="w3-round-large"
                                       name="status"
                                       id="status_id"
                                       value="${rental.status}"
                                       readonly/><br></td>

<%--                            <td><label for="creator_rental_id"></label>--%>
<%--                                <input class="w3-round-large"--%>
<%--                                       name="creator"--%>
<%--                                       id="creator_rental_id"--%>
<%--                                       value="${rental.client.user.role}"--%>
<%--                                       readonly/><br></td>--%>

                            <td><label for="date_of_creation_id"></label>
                                <input class="w3-round-large"
                                       name="date_of_creation"
                                       id="date_of_creation_id"
                                       value="${rental.dateOfCreation}"
                                       readonly/><br></td>
                        </tr>
                </table>
                    <input hidden type="number" name="rental_id" value="${rental.id}"/><br>
                <br>
                    <button class="w3-btn w3-white w3-round-large" type="submit">Save</button>
                    </br>

                    <p style="font-size: 12px"><a href="/admin/rentals/rental/update_rental">Back</a></p>
            </c:if>
            <c:if test="${update_rental == true}">
                <p class="w3-text-red"> Order No. ${rental.id} wasn't saved!</p>
                <a href="/admin/rentals/rental" class="w3-text-blue">Try again</a></p>
            </c:if><br>
        </flex>
    </form>
</box>
</body>
</html>