<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%@page import="com.entity.*"%>
<%@page import="com.DAO.*"%>
<%@page import="com.Database.*"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Order</title>
<%@include file="allCss.jsp" %>
</head>
<body>

<style type="text/css">
   .head{
   background-color: #4d1a00;;
   color:white;
   
   }
   
</style>
<c:if test="${empty userobj}">
  <c:redirect url="../login.jsp" />
</c:if>


<%@include file="navbar.jsp" %><br>
<h2><center>Hello Admin</center></h2>


<table class="table table-striped">
  <thead class="head" class="text-light">
    <tr>
      <th scope="col">Order ID</th>
      <th scope="col">Name</th>
      <th scope="col">Email</th>
      <th scope="col">Address</th>
      <th scope="col">Mob no</th>
      <th scope="col">Book name</th>
      <th scope="col">Author</th>
      <th scope="col">Price</th>
      <th scope="col">Payment type</th>
    </tr>
  </thead>
  <tbody>
  <%
     BookOrderImpl dao=new BookOrderImpl(DBConnect.getConn());
     List<Book_Order> blist=dao.getAllOrder();
     for(Book_Order b:blist)
     {%>
      <tr>
      <th scope="row"><%=b.getOrderId() %></th>
      <td><%=b.getUserName() %></td>
      <td><%=b.getEmail() %></td>
      <td><%=b.getFulladd() %></td>
      <td><%=b.getPhno() %></td>
      <td><%=b.getBookName() %></td>
     <td><%=b.getAuthor() %></td>
      <td><%=b.getPrice() %></td>
      <td><%=b.getPaymentType() %></td>
    </tr>
     <%}
  %>
    
  </tbody>
</table>

</body>
</html>