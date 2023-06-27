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
      width: 200px;
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
<div><a href="/admin">Home </a>/ update new client</div>
<box>
  <form method="post" class="w3-card-4 w3-blue-grey w3-round-large w3-padding" style="width: 90%">
    <flex>
      <h1>${client.firstName} ${client.lastName}</h1><br>
      <c:if test="${update_client == true}">
        <p style="font-size: 20px" class="w3-text-green"> Client save successfully!</p>
        <p style="font-size: 16px"><a href="/admin/clients/client/${client.id}">Back</a></p>
      </c:if><br>
      <c:if test="${update_client == null}">
        <table style="font-size: 10px">
          <tr>
            <th>First name</th>
            <th>Last name</th>
            <th>Date of birthday</th>
            <th>Phone number</th>
          <th>Address</th>
          </tr>


          <td><label for="first_name_id"></label>
            <input class="w3-round-large"
                   maxlength="20"
                   type="text"
                   placeholder="Enter first name"
                   name="firstName"
                   id="first_name_id"
                   value="${client.firstName}"
                   required/><br></td>

          <td><label for="last_name_id"></label>
            <input class="w3-round-large"
                   maxlength="20"
                   type="text"
                   placeholder="Enter last name"
                   name="lastName"
                   id="last_name_id"
                   value="${client.lastName}"
                   required/><br></td>


          <td><label for="date_of_birthday_id"></label>
            <input class="w3-round-large"
                   maxlength="20"
                   type="date"
                   placeholder="Enter date of birthday"
                   name="dateOfBirthday"
                   id="date_of_birthday_id"
                   value="${client.dateOfBirthday}"
                   required/><br></td>

          <td><label for="phone_id"></label>
            <input class="w3-round-large"
                   maxlength="20"
                   type="tel"
                   placeholder="Enter your phone"
                   name="phone"
                   id="phone_id"
                   value="${client.phone}"
            /><br></td>

          <td><label for="address_id"></label>
            <input class="w3-round-large"
                   maxlength="3"
                   type="text"
                   placeholder="Enter address"
                   name="address"
                   id="address_id"
                   value="${client.address}"
            /><br></td>
        </table>
        <br>
        <button class="w3-btn w3-white w3-round-large" type="submit">Save</button>
        </br>

        <p style="font-size: 12px"><a href="${pageContext.request.contextPath}/admin/clients">Back</a></p>
      </c:if>
      <c:if test="${update_cleint == false}">
        <p class="w3-text-red"> Client wasn't saved!</p>
        <a href="/admin/clients/client" class="w3-text-blue">Try again</a></p>
      </c:if><br>
    </flex>
  </form>
</box>
</body>
</html>