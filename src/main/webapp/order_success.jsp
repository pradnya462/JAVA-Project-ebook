   <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_component/allCss.jsp" %>
<style>
.container {
  max-width: 600px;
  margin: 0 auto;
  padding: 20px;
  text-align: center;
}

h1 {
  color: #333;
}

p {
  color: #666;
  margin-top: 10px;
}
</style>

</head>
<body>
<h1>Order Placed</h1>
</body style="background-color: #f0f1f2">
<%@include file="all_component/navbar.jsp" %>

<div class="container">
    <h1>Order Successful</h1>
    <p>Your order has been successfully placed. Thank you for your purchase!</p>
    
    <a href="index.jsp" class="btn btn-info mt-3">Home</a>
    <a href="order.jsp" class="btn btn-danger mt-3">View Order</a>
    
  </div>
</html>