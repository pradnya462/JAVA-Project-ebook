<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="com.Database.DBConnect"%>
<%@page import="com.DAO.*"%>
<%@page import="com.entity.*"%>
<%@ page import="java.util.List" %>
<%@page import="com.smart.paymentcontroller" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_component/allCss.jsp" %>
<link rel="stylesheet" type="text/css" href="all_component/style.css">

 <style type="text/css">
    
    input {
      padding: 8px;
      font-size: 16px;
      border: 1px solid #ccc;
      border-radius: 5px;
    }
</style>
</head>
<body style="background-color: #f0f1f2">
<%@include file="all_component/navbar.jsp" %>

<% 
  user u=(user) session.getAttribute("userobj");
   CartDAOImpl dao=new CartDAOImpl(DBConnect.getConn());
   List<Cart> cart=dao.getBookByUser(u.getId());
   Double totalPrice=0.00;
   for(Cart c:cart){
	   totalPrice=c.getTotalPrice();
   }
   
   
   
%>


<div>
<div class="card">
<div class="card-body">
<h3 class="text-center text-success">Your Details for Order</h3>

<form action="order" method="post">

<input type="hidden" value="${userobj.id }" name="id">
 <div class="form-row">
    <div class="form-group col-md-4">
      <label for="inputEmail4">Name</label>
      <input type="text" class="form-control" name="username" id="inputEmail4" value="${userobj.name}" required>
    </div>
    <div class="form-group col-md-4">
      <label for="inputPassword4">Email</label>
      <input type="email" class="form-control" id="inputPassword4" name="email" value="${userobj.email }"required >
    </div>
    
    <div class="form-group col-md-4">
      <label for="inputEmail4">Phone Number</label>
      <input type="number" class="form-control" id="inputEmail4" name="phno" value="${userobj.phno }"required>
    
  </div>  
  </div><hr>
  <div class="card2">
  <div class="text-center text-success">
    <h3>Pay</h3>
  </div>
  <div class="text-center">
    <input id="payment_field" type="text" value="<%= totalPrice %>">
    <button onclick="paymentStart()" class="btn btn-success">Checkout</button>
  
  </div>
  
</div>


  
  </form>
  </div>
  </div>
  </div>
 <script type="text/javascript">
 /* first request to server*/

 const paymentStart=()=>{
	 event.preventDefault();
     console.log("Payment start");
     let amount=$("#payment_field").val();
     console.log(amount);


    $.ajax(
         {
             url: '/payment/create_order',
             data:JSON.stringify( {amount:amount,info:'order_request '}),
             contentType:'application/json',
             type:'POST',
             dataType:'json',
             success:function(response){
                 //invoked when success
                 console.log(response)

             },
             error:function(error){
                 //invoked when error
                 console.log(error)
                 alert("something went wrong")
             }

         }
     )
 };

 </script>
</body>
</html>