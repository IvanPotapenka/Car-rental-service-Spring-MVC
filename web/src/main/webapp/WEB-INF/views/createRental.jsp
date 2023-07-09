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
<%@page import="java.time.LocalDate" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>





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
            width: 300px;
            height: 30px;
            font-size: 10px;
        }

        input {
            width: 300px;
            height: 30px;
            font-size: 10px;
        }

    </style>
</head>
<body>

<%@include file="headerAdmin.jsp" %>
<div><a href="/admin">Home </a>/ create new rental</div>
<box>
    <form method="post" class="w3-card-4 w3-blue-grey w3-round-large w3-padding" style="width: 90%">
        <flex>
            <c:if test="${create_client == null}">
                <h1>Rental</h1><br>
                <table style="font-size: 10px">
                    <tr>
                        <th>Car</th>
                        <th>Client</th>
                        <th>Date of rental</th>
                        <th>Date of return</th>
                    </tr>

                    <td>

                        <h4>${cars.id}</h4>


                        <b><a href="${pageContext.request.contextPath}/admin/cars"
                              class="w3-text-blue">ADD CAR</a></b><br></td>

                   <td>

<form action="/admin/rentals/create_rental" method="post" id="search-input">
                       <script>
                           $( function() {
                               var availableTags = []
                               <c:forEach var="client" items="${clients}">
                               availableTags.push("${client.firstName} ${client.lastName}")
                                </c:forEach>
                               $( "#search" ).autocomplete({
                                   source: availableTags
                               });
                           } );
                       </script>
    <label for="search">Tags: </label>

    <input name="search" id="search" type="text" onchange="if (this.value.length >= 3) this.form.submit()" />

    </form>

                   </td>

                    <td><label for="rental_date_id"></label>
                        <input class="w3-round-large"
                               maxlength="20"
                               type="date"
                               min="${LocalDate.now()}"
                               name="rental_date"
                               id="rental_date_id"
                        /><br></td>

                    <td><label for="return_date_id"></label>
                        <input class="w3-round-large"
                               maxlength="20"
                               type="date"
                               min="${LocalDate.now()}"
                               name="return_date"
                               id="return_date_id"
                        /><br></td>
                </table>
                <br>
                <button class="w3-btn w3-white w3-round-large" type="submit">Create</button>
                </br>

                <p style="font-size: 12px"><a href="/admin/rentals">Back</a></p>
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