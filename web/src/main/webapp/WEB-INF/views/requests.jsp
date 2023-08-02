<%--
  Created by IntelliJ IDEA.
  request: Professional
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
  <title>Requests</title>
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

    box1 {
      display: flex;
      flex-direction: column;
      align-items: center;
      margin-top: 1%;
      margin-bottom: 1%;
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
<div><a href="/admin">Home </a> / requests </div>
<box>
  <form method="post" class="w3-card-4 w3-blue-grey w3-round-large w3-padding" style="width: 70%">
    <flex>
      <c:if test="${request_delete_success==true}">
        <p style="font-size: 20px" class="w3-text-green"> Request was successfully deleted</p>
        <p style="font-size: 16px"><a href="${pageContext.request.contextPath}/admin/requests">Back</a></p>
      </c:if>
      <c:if test="${request_delete_success==null}">
      <p style="font-size: 16px">
      <h1>Requests</h1>
      <table>
        <tr>
          <th>Request_id</th>
          <th>Name</th>
          <th>Phone</th>
          <th>Date of creation</th>
          <th>Status</th>
          <th>Massage</th>
          <th>ACCEPT</th>
          <sec:authorize access="hasAuthority('ADMIN')">
          <th>Delete</th>
          </sec:authorize>
        </tr>
        <c:forEach var="request" items="${requests}">
          <tr>
            <td>${request.id}</td>
            <td>${request.username}</td>
            <td>${request.phone}</td>
            <td>${request.dateOfCreation}</td>
            <td>

              <c:if test="${request.status=='OPEN'}">
                <p style="color: red"> ${request.status}</p>
              </c:if>
              <c:if test="${request.status=='PROCESSING'}">
                <p style="color: yellow"> ${request.status}</p>
              </c:if>
              <c:if test="${request.status=='CLOSED'}">
                <p style="color: greenyellow"> ${request.status}</p>
              </c:if>

            </td>
            <td>${request.massage}</td>
            <td>
              <c:if test="${request.status=='CLOSED'}">
              <a class="w3-text">ACCEPT</a></td>
            </c:if>
            <c:if test="${request.status=='OPEN' || request.status=='PROCESSING'}">
            <a href="${pageContext.request.contextPath}/admin/requests/request-processing/${request.id}"
               class="w3-text-blue">ACCEPT</a>
            </c:if>
            </td>
            <sec:authorize access="hasAuthority('ADMIN')">
          <td><a style="color: yellow" href="${pageContext.request.contextPath}/admin/requests/request/delete_request/${request.id}"
                 class="w3-text-red">DELETE</a></td>
            </sec:authorize>
          </tr>
        </c:forEach>
      </table>
      </br>
    </flex>
  </form>
</box>
<form>
  <box>
    <div2 class="d-flex flex-justify-center">
      <nav2 class="paginate-container">
        <div2 class="pagination">
          <c:if test="${page > 1 }">
            <a href="${pageContext.request.contextPath}/admin/requests?limit=${limit}&page=${page-1}"
               class="previous_page" aria-disabled="false">Previous</a>
            <a href="${pageContext.request.contextPath}/admin/requests?limit=${limit}&page=1"> 1 </a>
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
                <a href="/admin/requests?limit=${limit}&page=${i}"> ${i} </a>
              </c:if>
            </c:if>
          </c:forEach>
          <c:if test="${count == page}">
            <span class="next_page" aria-disabled="true">Next</span>
          </c:if>
          <c:if test="${count != page}">
            <span class="gap"> … </span>
            <a href="${pageContext.request.contextPath}/admin/requests?limit=${limit}&page=${count}"> ${count} </a>
            <a class="next_page"
               href="${pageContext.request.contextPath}/admin/requests?limit=${limit}&page=${page+1}"
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
</c:if>
</body>
</html>