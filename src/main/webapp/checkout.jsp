<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.Database.DBConnect"%>
<%@page import="com.DAO.*"%>
<%@page import="com.entity.*"%>
<%@ page import="java.util.List" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart Page</title>
<%@include file="all_component/allCss.jsp" %>
</head>
<body style="background-color: #f0f1f2">
<%@include file="all_component/navbar.jsp" %>


<c:if test="${ empty userobj }">
<c:redirect url="login.jsp" ></c:redirect>
</c:if>






 <c:if test="${not empty succMsg}">
 <div class="alert alert-success" role="alert">${succMsg}</div>
<c:remove var="succMsg" scope="session"/>
 </c:if>
 
  <c:if test="${not empty failedMsg}">
 <div class="alert alert-danger" role="alert">${failedMsg}</div>
<c:remove var="failedMsg" scope="session"/>
 </c:if>

<div class="container">
<div class="row p-2">
<div class=col-md-6">

<div class="card bg-white">
<div class="card-body">
<h3 class="text-center text-success">Your Selected Item</h3>
<table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">Book Name</th>
      <th scope="col">Author</th>
      <th scope="col">Price</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
  <% 
  user u=(user) session.getAttribute("userobj");
   CartDAOImpl dao=new CartDAOImpl(DBConnect.getConn());
   List<Cart> cart=dao.getBookByUser(u.getId());
   Double totalPrice=0.00;
   for(Cart c:cart){
	   totalPrice=c.getTotalPrice();
   
   %>
   <tr>
      <th scope="row"><%=c.getBookName() %></th>
      <td><%=c.getAuthor() %></td>
      <td><%=c.getPrice()%></td>
      <td>
      <a href="remove_book?cid=<%=c.getCid() %>"
       class="btn btn-sm btn-danger">Remove</a>
      
      </td>
    </tr>
   
   <%} 
  %>
    <tr>
       <td>Total Price</td>
       <td></td>
       <td></td> 
       <td><%=totalPrice %></td>
    </tr>
    
  </tbody>
</table>
</div>
</div>
</div>

<div class="col-md-6">
<div class="card">
<div class="card-body">
<h3 class="text-center text-success">Your Details for Order</h3>

<form action="order" method="post">
<input type="hidden" value="${userobj.id }" name="id">
 <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Name</label>
      <input type="text" class="form-control" name="username" id="inputEmail4" value="${userobj.name}" required>
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Email</label>
      <input type="email" class="form-control" id="inputPassword4" name="email" value="${userobj.email }"required >
    </div>
  </div>
  
   <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Phone Number</label>
      <input type="number" class="form-control" id="inputEmail4" name="phno" value="${userobj.phno }"required>
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Address</label>
      <input type="text" class="form-control" id="inputPassword4" name="address" required>
    </div>
  </div>
  
   <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Landmark</label>
      <input type="text" class="form-control" name="landmark" id="inputEmail4" required>
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">City</label>
      <input type="text" class="form-control" name="city" id="inputPassword4" required>
    </div>
  </div>
  
   <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">State</label>
      <input type="text" class="form-control" name="state" id="inputEmail4" required >
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Pin code</label>
      <input type="number" class="form-control" name="pincode" id="inputPassword4" required>
    </div>
  </div>
  
  <div class="form-group">
   <label>Payment</label>  
   <select class="form-control" name="payment">
   <option value="noselect">--Select--</option>
   <option value="COD">Cash on Delivery</option>
   <option value="ON" >Online Pay</option>
   
   </select>
  </div>
   
   
   <div class="text-center">
   <button class="btn btn-warning">Order Now</button>
   <a href="index.jsp"><button class="btn btn-success">Continue Shopping</button></a>
   </div>
 
</form>

 </div>
</div>
</div>
</div>


</div>


</body>
</html>