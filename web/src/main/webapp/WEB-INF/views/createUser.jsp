<%@ page import="by.potapenko.database.entity.CarEntity" %>
<%@ page import="java.util.Optional" %>
<%--
  Created by IntelliJ IDEA.
  uzer: Professional
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
    <title>Create new user</title>
    <style>
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
            width: 250px;
            height: 30px;
            font-size: 14px;
        }

        input {
            width: 250px;
            height: 30px;
            font-size: 14px;
        }

    </style>
</head>
<body>
<%@include file="headerAdmin.jsp" %>
<div><a href="/admin">Home </a>/ create new user</div>
<box>
    <form method="post" class="w3-card-4 w3-blue-grey w3-round-large w3-padding" style="width: 30%">
        <flex>

            <c:if test="${create_user == null}">
                <h1>User</h1><br>
                <label for="fullName_id">Full name</label>
                <input class="w3-round-large"
                       type="text"
                       maxlength="20"
                       placeholder="Enter your full name"
                       name="fullName"
                       id="fullName_id"
                       required/><br>

                <label for="email_id">Email</label>
                <input class="w3-round-large"
                       type="text"
                       maxlength="20"
                       placeholder="Enter your email"
                       name="email"
                       id="email_id"
                       required/><br>

                <label for="phone">Phone No.</label>
                <input class="w3-round-large"
                       type="text"
                       maxlength="13"
                       placeholder="Enter your phone"
                       name="phone"
                       id="phone"
                       required/><br>

                <label for="date_of_birthday_id">Date of birthday</label>
                <input class="w3-round-large"
                       type="date"
                       min="1950-01-01"
                       max="2003-01-01"
                       name="dateOfBirthday"
                       id="date_of_birthday_id"
                       required/><br>

                <label for="address_id">Address</label>
                <input class="w3-round-large"
                       maxlength="100"
                       type="text"
                       placeholder="Enter city,street,No."
                       name="address"
                       id="address_id"
                /><br>

                <label for="pwd">Password</label>
                <input class="w3-round-large"
                       maxlength="20"
                       type="password"
                       placeholder="Enter your password"
                       name="password"
                       id="pwd"
                       required/></p><br>

                <label for="passport_id">Passport No.</label>
                    <input class="w3-round-large"
                           width="350px"
                           maxlength="9"
                           type="text"
                           name="passport"
                           id="passport_id"
                           required/><br>

                <label for="driver_id">Driver licence</label>
                    <input class="w3-round-large"
                           width="350 px"
                           maxlength="9"
                           type="text"
                           name="driverLicense"
                           id="driver_id"
                           required/><br>

                <label for="role"></label>
                    <select class="w3-round-large"
                            id="role"
                            name="role"
                            required>
                        <sec:authorize access="hasAnyAuthority('ADMIN','MANAGER')">
                        <option value="USER">USER</option>
                        </sec:authorize>
                        <sec:authorize access="hasAuthority('ADMIN')">
                        <option value="MANAGER">MANAGER</option>
                        </sec:authorize>

                    </select><br>
                <label> <input class="w3-round-large"  name="agreement" type="checkbox" style="height: 15px; width: 15px;" checked required/> I agree to the processing of personal
                    data</label><br>
                <button class="w3-btn w3-white w3-round-large" type="submit">Create</button>
                </br>
                <p style="font-size: 16px"><a href="${pageContext.request.contextPath}/admin/users">Back</a></p>
            </c:if>
            <c:if test="${create_user == false}">
                <p style="font-size: 20px" class="w3-text-red"> Sorry! Creating doesn't possible now, please try
                    again </p>
                <a href="/admin/uzers/create_uzer" class="w3-text-blue">Create new user</a><br>
            </c:if>
        </flex>
    </form>
</box>
</body>
</html>