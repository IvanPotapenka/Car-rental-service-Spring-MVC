<%--
  Created by IntelliJ IDEA.
  uzer: Professional
  Date: 12.04.2023
  Time: 0:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href=
            "https://unpkg.com/@primer/css@^18.0.0/dist/primer.css"/>
    <title>Users</title>
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

        div {
            padding-top: 80px;
            padding-left: 20px;
        }

    </style>
</head>
<body>
<%@include file="headerAdmin.jsp" %>
<div><a href="/admin">Home </a><a href="${pageContext.request.contextPath}/admin/users/user/${uzer.id}">/ edit</a>
</div>
<box>

    <c:if test="${create_user == true || create_user == null}">
    <form method="post" class="w3-card-4 w3-blue-grey w3-round-large w3-padding" style="width: 70%">
        <a style="font-size: 12px" href="${pageContext.request.contextPath}/admin/users/create_user">Create new user</a>
        <flex>
                <p style="font-size: 16px">
                <h1>${uzer.fullName}</h1>
                <table>
                    <tr>
                        <th>User_id</th>
                        <th>Full name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Date of birthday</th>
                        <th>Address</th>
                        <th>Role</th>
                        <th>Status check documents</th>
                        <th>Delete</th>
                        <th>Edit</th>
                    </tr>
                    <tr>
                        <td>${uzer.id}</td>
                        <td>${uzer.fullName}</td>
                        <td>${uzer.email}</td>
                        <td>${uzer.phone}</td>
                        <td>${uzer.dateOfBirthday}</td>
                        <td>${uzer.address}</td>
                        <td>${uzer.role}</td>
                        <td>
                            <c:if test="${uzer.documentDto.statusCheck=='CONFIRMED'}">
                                <p style="color: greenyellow"> ${uzer.documentDto.statusCheck}</p>
                            </c:if>
                            <c:if test="${uzer.documentDto.statusCheck=='DENIED'}">
                                <p style="color: red"> ${uzer.documentDto.statusCheck}</p>
                            </c:if>

                        </td>

                        <td><a href="${pageContext.request.contextPath}/admin/users/user/delete_user/${uzer.id}"
                               class="w3-text-red">DELETE</a></td>
                        <td><a href="${pageContext.request.contextPath}/admin/users/user/update_user/${uzer.id}"
                               class="w3-text-blue">EDIT</a></td>
                    </tr>
                </table>
                </br>
<%--            <sec:authorize access="hasAuthority('ADMIN')">--%>
<%--                <p style="font-size: 16px"><a href="${pageContext.request.contextPath}/admin/managers">Back</a></p>--%>
<%--            </sec:authorize>--%>
<%--            <sec:authorize access="hasAuthority('MANAGER')">--%>
<%--                <p style="font-size: 16px"><a href="${pageContext.request.contextPath}/admin/users">Back</a></p>--%>
<%--            </sec:authorize>--%>
        </flex>
    </form>
    </c:if>
    <c:if test="${create_user == false}">
        <p style="font-size: 20px" class="w3-text-red"> Sorry! Creating doesn't possible now, please try
            again </p>
        <a href="/admin/uzers/create_uzer" class="w3-text-blue">Create new user</a><br>
    </c:if>
</box>
</body>
</html>