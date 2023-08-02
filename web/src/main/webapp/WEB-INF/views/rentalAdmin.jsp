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

    </style>
</head>
<body>
<%@include file="headerAdmin.jsp" %>
<div><a href="/admin">Home </a><a href="${pageContext.request.contextPath}/admin/rentals/rental/${rental.id}">/ edit</a>
</div>


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

    <c:if test="${rental_not_found == true}">
    <flex class="w3-card-4 w3-blue-grey w3-round-large w3-padding" style="width: 30%">
        <p style="font-size: 26px" class="w3-text-red"> WARNING!</p>
        <p style="font-size: 20px" > Such a rental doesn't exists!</p>
        <p style="font-size: 16px"><a href="${pageContext.request.contextPath}/admin/rentals">Back</a></p>
    </flex>
    </c:if>
    <c:if test="${rental_not_found == null}">
    <form method="post" class="w3-card-4 w3-blue-grey w3-round-large w3-padding" style="width: 90%">
        <a style="font-size: 12px" href="${pageContext.request.contextPath}/admin/rentals/create_rental">Create new rental</a>
        <flex>
                <p style="font-size: 16px">
                <h1>Order No.${rental.id}</h1>
                <table style="font-size: 10px">
                    <tr>
                        <th>Rental id</th>
                        <th>Car</th>
                        <th>Client</th>
                        <th>Rental date</th>
                        <th>Return date</th>
                        <th>Rental days</th>
                        <th>Price</th>
                        <th>Status</th>
                        <th>Date of creation</th>
                        <th>State</th>
                        <th>Delete</th>
                        <th>Edit</th>

                    </tr>
                    <tr>
                        <td>${rental.id}</td>
                        <td>${rental.carDto.brand} ${rental.carDto.model} No. ${rental.carDto.number}</td>
                        <td>${rental.userDto.fullName}</td>
                        <td>${rental.rentalDate}</td>
                        <td>${rental.returnDate}</td>
                        <td>${rental.rentalDays}</td>
                        <td>${rental.price}</td>

                        <td>

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
                                <p style="color: gray"> ${rental.status}</p>
                            </c:if>
                            <c:if test="${rental.status=='APPROVE'}">
                                <p style="color: greenyellow"> ${rental.status}</p>
                            </c:if>

                        </td>
                        <td>${rental.dateOfCreation}</td>
                        <td>
                            <c:if test="${rental.state=='ACTIVE'}">
                                <p style="color: greenyellow"> ${rental.state}</p>
                            </c:if>
                            <c:if test="${rental.state=='PASSIVE'}">
                                <p style="color: white"> ${rental.state}</p>
                            </c:if>
                            <c:if test="${rental.state=='COMPLETE'}">
                                <p style="color: greenyellow"> ${rental.state}</p>
                            </c:if>
                            <c:if test="${rental.state=='REFUSED'}">
                                <p style="color: red"> ${rental.state}</p>
                            </c:if>
                        </td>
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
    </c:if>
</box>
</body>
</html>