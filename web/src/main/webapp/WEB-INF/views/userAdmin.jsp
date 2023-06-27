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
<div><a href="/admin">Home </a><a href="${pageContext.request.contextPath}/admin/users/user/${user.id}">/ edit</a>
</div>
<box>
    <form method="post" class="w3-card-4 w3-blue-grey w3-round-large w3-padding" style="width: 70%">
        <a style="font-size: 12px" href="${pageContext.request.contextPath}/admin/users/create_user">Create new user</a>
        <flex>
                <p style="font-size: 16px">
                <h1>${user.login}</h1>
                <table>
                    <tr>
                        <th>User_id</th>
                        <th>Login</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Role</th>
                        <th>Delete</th>
                        <th>Edit</th>
                    </tr>
                    <tr>
                        <td>${user.id}</td>
                        <td>${user.login}</td>
                        <td>${user.email}</td>
                        <td>${user.phone}</td>
                        <td>${user.role}</td>
                        <td><a href="${pageContext.request.contextPath}/admin/users/user/delete_user/${user.id}"
                               class="w3-text-red">DELETE</a></td>
                        <td><a href="${pageContext.request.contextPath}/admin/users/user/update_user/${user.id}"
                               class="w3-text-blue">EDIT</a></td>
                    </tr>
                </table>
                </br>
                <p style="font-size: 16px"><a href="${pageContext.request.contextPath}/admin/users">Back</a></p>
        </flex>
    </form>
</box>
</body>
</html>