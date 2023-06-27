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
            width: 15px;
            height: 30px;
            font-size: 10px;
        }

        input {
            width: 200px;
            height: 30px;
            font-size: 10px;
        }
    </style>
</head>
<body>
<%@include file="headerAdmin.jsp" %>
<div><a href="/admin">Home </a>/ create new client</div>
<box>
    <form method="post" class="w3-card-4 w3-blue-grey w3-round-large w3-padding" style="width: 90%">
        <flex>
            <c:if test="${create_client == null}">
                <h1>Client</h1><br>
                <table style="font-size: 10px">
                    <tr>
                        <th>First name</th>
                        <th>Last name</th>
                        <th>Middle name</th>
                        <th>Date of birthday</th>

                    </tr>

                    <td><label for="first_name_id"></label>
                        <input class="w3-round-large"
                               maxlength="20"
                               type="text"
                               placeholder="Enter first name"
                               name="first_name"
                               id="first_name_id"
                               required/><br></td>

                    <td><label for="last_name_id"></label>
                        <input class="w3-round-large"
                               maxlength="20"
                               type="text"
                               placeholder="Enter last name"
                               name="last_name"
                               id="last_name_id"
                               required/><br></td>

                    <td><label for="middle_name_id"></label>
                        <input class="w3-round-large"
                               maxlength="20"
                               type="text"
                               placeholder="Enter middle name"
                               name="middle_name"
                               id="middle_name_id"
                        /><br></td>

                    <td><label for="date_of_birthday_id"></label>
                        <input class="w3-round-large"
                               type="date"
                               min="1950-01-01"
                               max="2003-01-01"
                               name="date_of_birthday"
                               id="date_of_birthday_id"
                               required/><br></td>

                    <tr>
                        <th>Phone number</th>
                        <th>Address</th>
                        <th>Driver licence</th>
                    </tr>

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


                    <td><label for="driver_license_id"></label>
                        <input class="w3-round-large"
                               maxlength="10"
                               type="text"
                               placeholder="Enter driver license"
                               name="driver_license"
                               id="driver_license_id"
                        /><br></td>
                </table>

                <br>
                <button class="w3-btn w3-white w3-round-large" type="submit">Create</button>
                </br>

                <p style="font-size: 12px"><a href="/admin/clients">Back</a></p>
            </c:if>
            <c:if test="${create_client == false}">
                <p style="font-size: 20px" class="w3-text-red"> Sorry! Creating doesn't possible now, please try
                    again </p>
                <a href="/admin/clients/create_client" class="w3-text-blue">Create new client</a><br>
            </c:if><br>
        </flex>
    </form>
</box>
</body>
</html>