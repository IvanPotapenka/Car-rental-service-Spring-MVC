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
        }

        td {
            padding: 12px;
            border: 1px solid gray;
        }

        th {
            padding: 14px;
            border: 1px solid gray;
        }
        box {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 80px;
            margin-left: 100px;
        }

        box1 {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 1%;
            margin-bottom: 1%;
        }
        div {
            padding-top: 80px;
            padding-left: 20px;
        }
        flex {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 5%;
            margin-bottom: 10%;
        }

        nav1 {
            position: fixed;
            margin-left: 5%;
            width: 15%;
        }
    </style>
</head>
<body>
<%@include file="header.jsp" %>
<div><a href="/">Home </a>/ orders</div>
<nav1>
    <flex class="w3-btn w3-border w3-round-large w3-padding" style="width: 100%"
          onclick="location.href='/account/profile'">
        <p style="font-size: 16px">
        <h4>&#128104;</h4>
        <h6>${user.login}</h6>
    </flex>
    <flex class="w3-btn w3-border w3-round-large w3-padding" style="width: 100%"
          onclick="location.href='/account/orders'">
        <p style="font-size: 16px">
        <h4> &#128188;</h4>
        <h6>Orders </h6>
    </flex>
    <flex class="w3-btn w3-border w3-round-large w3-padding" style="width: 100%">
        <p style="font-size: 16px">
        <h4> &#128140;</h4>
        <h6>Message </h6>
    </flex>

</nav1>
<box class="w3-container ">
    <div class="w3-card-4 w3-round-large w3-padding" style="width: 70%"><br>

<h1>Orders</h1>
        <table style="font-size: 12px">
            <tr >
                <th>No. order</th>
                <th>Car</th>
                <th>Client</th>
                <th>Rental date</th>
                <th>Return date</th>
                <th>Rental days</th>
                <th>Price</th>
                <th>Date of created</th>
                <th>Status</th>
                <th>Contract</th>
            </tr>
            <c:forEach var="rental" items="${rentals}">
                <tr>
                    <td>${rental.id}</td>
                    <td>${rental.carDto.brand} ${rental.carDto.model} No. ${rental.carDto.number}</td>
                    <td>${rental.clientDto.firstName} ${rental.clientDto.lastName}</td>
                    <td>${rental.rentalDate}</td>
                    <td>${rental.returnDate}</td>
                    <td>${rental.rentalDays}</td>
                    <td>${rental.price}</td>
                    <td>${rental.dateOfCreation}</td>
                    <td class="w3-text-red">${rental.status}</td>

                    <td><a href="${pageContext.request.contextPath}#"
                           class="w3-text-blue">Download</a></td>
                </tr>
            </c:forEach>
        </table>
        </br>
    </div>
</box>
<form>
    <box>
        <div2 class="d-flex flex-justify-center">
            <nav2 class="paginate-container">
                <div2 class="pagination">
                    <c:if test="${page > 1 }">
                        <a href="${pageContext.request.contextPath}/admin/rentals?limit=${limit}&page=${page-1}"
                           class="previous_page" aria-disabled="false">Previous</a>
                        <a href="${pageContext.request.contextPath}/admin/rentals?limit=${limit}&page=1"> 1 </a>
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
                                <a href="/admin/rentals?limit=${limit}&page=${i}"> ${i} </a>
                            </c:if>
                        </c:if>
                    </c:forEach>
                    <c:if test="${count == page}">
                        <span class="next_page" aria-disabled="true">Next</span>
                    </c:if>
                    <c:if test="${count != page}">
                        <span class="gap"> … </span>
                        <a href="${pageContext.request.contextPath}/admin/rentals?limit=${limit}&page=${count}"> ${count} </a>
                        <a class="next_page"
                           href="${pageContext.request.contextPath}/admin/rentals?limit=${limit}&page=${page+1}"
                           aria-label="Next">Next</a>
                    </c:if>
                </div2>
            </nav2>
        </div2>
    </box>
    <box1>
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
            <button class="w3-btn w3-white w3-round-large w3-opacity" type="submit">Show page</button>
        </div1>
    </box1>
</form>
</flex>

</body>
<%@include file="footer.jsp" %>
</html>