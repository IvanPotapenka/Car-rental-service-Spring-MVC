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
    <title>Clients</title>
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
<div><a href="/admin">Home </a><a href="${pageContext.request.contextPath}/admin/clients/client/${client.id}">/ edit</a>
</div>
<box>
    <form method="post" class="w3-card-4 w3-blue-grey w3-round-large w3-padding" style="width: 90%">
        <flex>
                <p style="font-size: 16px">
                <h1>${client.firstName} ${client.lastName}</h1>
                <table style="font-size: 10px">
                    <tr>
                        <th>Client_id</th>
                        <th>First name</th>
                        <th>Last name</th>
                        <th>Date of birthday</th>
                        <th>Phone number</th>
                        <th>Address</th>
                        <th>Delete</th>
                        <th>Edit</th>

                    </tr>
                    <tr>
                        <td>${client.id}</td>
                        <td>${client.firstName}</td>
                        <td>${client.lastName}</td>
                        <td>${client.dateOfBirthday}</td>
                        <td>${client.phone}</td>
                        <td>${client.address}</td>
                        <td><a href="${pageContext.request.contextPath}/admin/clients/client/delete_client/${client.id}"
                               class="w3-text-red">DELETE</a></td>
                        <td><a href="${pageContext.request.contextPath}/admin/clients/client/update_client/${client.id}"
                               class="w3-text-blue">EDIT</a></td>
                    </tr>
                </table>
                </br>
                <p style="font-size: 16px"><a href="${pageContext.request.contextPath}/admin/clients">Back</a></p>
        </flex>
    </form>
</box>
</body>
</html>