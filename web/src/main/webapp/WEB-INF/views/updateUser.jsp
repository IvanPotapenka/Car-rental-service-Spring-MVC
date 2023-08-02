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
<%@include file="headerAdmin.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Edit ${uzer.fullName}</title>
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
<div><a href="/admin">Home </a>
    <a href="${pageContext.request.contextPath}/admin/users/user/update_user/${uzer.id}">/ edit user</a></div>
<box>
    <form method="post" class="w3-card-4 w3-blue-grey w3-round-large w3-padding" style="width: 30%">
        <flex>
            <h1>${uzer.fullName}</h1><br>
            <c:if test="${update_user == true}">
                <p style="font-size: 20px" class="w3-text-green"> User update successfully!</p>
                <p style="font-size: 16px"><a href="/admin/users/user/${uzer.id}">Back</a></p>
            </c:if><br>
            <c:if test="${update_user == null}">

                <label for="fullNameId">Login</label>
                <input class="w3-round-large"
                       type="text"
                       maxlength="20"
                       placeholder="Enter your login"
                       name="fullName"
                       value="${uzer.fullName}"
                       id="fullNameId"
                       required/><br>

                <label for="email">Email</label>
                <input class="w3-round-large"
                       type="email"
                       maxlength="20"
                       placeholder="Enter your email"
                       name="email"
                       value="${uzer.email}"
                       id="email"
                       required/><br>

                <label for="phone">Phone No.</label>
                <input class="w3-round-large"
                       type="text"
                       maxlength="13"
                       placeholder="Enter your phone"
                       name="phone"
                       value="${uzer.phone}"
                       id="phone"
                       required/><br>

                <label for="date">Date of birthday</label>
                <input class="w3-round-large"
                       readonly
                       type="date"
                       name="dateOfBirthday"
                       value="${uzer.dateOfBirthday}"
                       id="date"
                       required/><br>

                <label for="address">Address</label>
                <input class="w3-round-large"
                       type="text"
                       maxlength="100"
                       placeholder="Enter your address"
                       name="address"
                       value="${uzer.address}"
                       id="address"
                       required/><br>

                <label for="role">Role</label>
                    <select class="w3-round-large"
                            id="role"
                            name="role">
                        <option selected> ${uzer.role}</option>
                    </select><br>

                <label for="date_of_creation_id">Date of creation</label>
                    <input class="w3-round-large"
                           type="text"
                           name="dateOfCreation"
                           id="date_of_creation_id"
                           value="${uzer.dateOfCreation}"
                           readonly/><br>

                <button class="w3-btn w3-white w3-round-large" type="submit">Update</button>
                </br>
                </br>
                <p style="font-size: 16px"><a href="/admin/users/user/${uzer.id}">Back</a></p>
            </c:if>
            <c:if test="${update_user == false}">
                <p style="font-size: 20px" class="w3-text-red"> User wasn't updated!Try again later!</p>

            <p style="font-size: 16px"><button class="w3-btn w3-round-large" onclick="history.go(-1);">Back</button></p>
            </c:if><br>
        </flex>
    </form>
</box>
</body>
</html>