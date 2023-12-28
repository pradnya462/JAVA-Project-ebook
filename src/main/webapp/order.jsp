<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@page import="com.entity.*"%>
<%@page import="com.DAO.*"%>
<%@page import="com.Database.*"%>
<%@page import="java.util.List"%>
<title>Insert title here</title>
<%@include file="all_component/allCss.jsp" %>
</head>
<body style="background-color: #f0f1f2">

<c:if test="${ empty userobj }">
<c:redirect url="login.jsp" ></c:redirect>
</c:if>

<%@include file="all_component/navbar.jsp" %>
<div class="container p-1">
<h3 class="text-center">Your Order</h3>
   <table class="table table-striped mt-3">
  <thead class="bg-info text-white">
    <tr>
      <th scope="col">Order ID</th>
      <th scope="col">Name</th>
      <th scope="col">Book Name</th>
      <th scope="col">Author</th>
      <th scope="col">Price</th>
      <th scope="col">Payment Type</th>
    </tr>
  </thead>
  <tbody>
  <%
     user u=(user) session.getAttribute("userobj"); 
     BookOrderImpl dao=new BookOrderImpl(DBConnect.getConn());
     List<Book_Order> blist=dao.getBook(u.getEmail());
     for(Book_Order b:blist)
     {%>
      <tr>
      <th scope="row"><%=b.getOrderId() %></th>
      <td><%=b.getUserName() %></td>
      <td><%=b.getBookName() %></td>
      <td><%=b.getAuthor() %></td>
      <td><%=b.getPrice() %></td>
      <td><%=b.getPaymentType() %></td>
    </tr>
     <%}
  %>
    
    
 </tbody>
</table>
</div>
</body>
</html>