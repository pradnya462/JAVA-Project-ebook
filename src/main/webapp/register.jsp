<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook-Register</title>
<%@include file="all_component/allCss.jsp" %>

<!-- Added CSS Styles -->

<style>
body {
  background-color: #f0f1f2;
  font-family: Arial, sans-serif;
}

.container {
  padding: 20px;
  margin-top: 50px;
  background-color: #ffffff;
  border-radius: 10px;
  box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1);
}

.card {
  border: none;
  border-radius: 10px;
  overflow: hidden;
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
/* styles.css */
/* ... (your existing styles) */

/* Additional styles for the image and animation */
.registration-image {
  max-width: 550px;
  height: 600px;
  margin-top: 20px;
  animation: fadeInUp 1s ease-in-out;
}

@keyframes fadeInUp {
  0% {
    opacity: 0;
    transform: translateY(20px);
  }
  100% {
    opacity: 1;
    transform: translateY(0);
  }
}
.background-container {
  background-image: url('book/img3.jpg');
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
</style>
</head>
<body>
<%@include file="all_component/navbar.jsp" %>
<div class="background-container">

<div class="container">
  <div class="row">
    <div class="col-md-6">
      <div class="card">
        <div class="card-body">
          <h3 class="text-center mb-4">Register Here</h3><hr>

<c:if test="${not empty succMsg }">
<p class="text-center text-success">${succMsg }</p>
<c:remove var="succMsg" scope="session"/>
</c:if>

<c:if test="${not empty failedMsg }">
<p class="text-center text-danger">${failedMsg }</p>
<c:remove var="failedMsg" scope="session"/>
</c:if>
<form action="register" method="post">
<div class="form-group">
    <label for="exampleInputEmail1">Enter Full Name</label>
    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter name" name="fname" required="required">
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" name="email" required="required">
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">Phone No</label>
    <input type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Phone no" name="phno" required="required">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" name="password" required="required">
  </div>
  <div class="form-check mb-4">
    <input type="checkbox" class="form-check-input" name="check" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1" >Agree terms & conditions</label>
  </div>
  <div class="text-center">
    <button type="submit" class="btn customs">Submit</button>
  </div>
</form>
</div>
</div>
</div>
<div class="col-md-6 d-none d-md-block">
      <div class="registration-image-container">
        <img src="book/reg.png" alt="Registration Image" class="registration-image">
      </div>
    </div>
  </div>
</div>
  </div>



</body>
</html>
