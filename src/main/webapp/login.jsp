<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook: Login</title>
<%@include file="all_component/allCss.jsp" %>
<style>
   body {
  background-color: #f0f1f2;
  font-family: Arial, sans-serif;
  margin:0;
}
.background-container {
  background-image: url('book/log.avif');
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
  min-height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
}

.container {
  max-width: 1200px; /* Adjust as needed */
  padding: 20px;
  background-color: rgba(255, 255, 255, 0.8); /* Semi-transparent white background */
  border-radius: 10px;
  box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1);
}

.card {
  border: none;
  border-radius: 10px;
  overflow: hidden;
  height:600px;
}

.card-body {
  padding: 30px;
}

.text-center {
  text-align: center;
}

.form-group {
  margin-bottom: 25px;
}

label {
  font-weight: bold;
}

.form-control {
  border: 1px solid #ccc;
  border-radius: 5px;
  padding: 10px;
  transition: border-color 0.3s ease-in-out;
}

.form-control:focus {
  outline: none;
  border-color: #007bff;
}
.customs:hover{
	background-color: #4d2800; 
	color: white;
	border-color:#4d2800; 
}

.customs{
	background-color: #fff4e6;
	color: black;
	border-color:#ffdab3; 
	
}
.registration-image {
  max-width: 600px;
  height: 600px;
  margin-top: 20px;
  animation: fadeInUp 1s ease-in-out;
}
</style>
</head>
<body ">
<%@include file="all_component/navbar.jsp" %>
<div class="background-container">
 
<div class="container">
<div class="row">
<div class="col-md-6 ">
<div class="card">
<div class="card-body">
<h4 class="text-center mb-4">Login Page</h4><hr>

<c:if test="${not empty failedMsg}">
    <h5 class="text-center text-danger">${failedMsg}</h5>
    <c:remove var="failedMsg" scope="session"/>
</c:if>
<c:if test="${not empty succ}">
    <h5 class="text-center text-success">${succ}</h5>
    <c:remove var="succ" scope="session"/>
</c:if>

<form action="login" method="post">
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" required="required" name="email">

  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" name="password">
  </div>
  <div class="text-center">
  <button type="submit" class="btn customs">Login</button><br><br>
  <a href="register.jsp">Create Account</a>
  </div>
</form>
</div>
</div>
</div>

    <div class="col-md-6 d-none d-md-block">
      <div class="registration-image-container">
        <img src="book/log1.png" alt="Registration Image" class="registration-image">
      </div>
    </div>
</div>
</div>
  </div>


</body>
</html>