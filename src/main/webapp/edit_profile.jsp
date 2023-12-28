<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page isELIgnored="false" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_component/allCss.jsp" %>
</head>
<body style="background-color: #f0f1f2">
<%@include file="all_component/navbar.jsp" %><br>

<div class="container">
   <div class="row">
    <div class="col-md-4 offset-md-4">
    <div class="card">
      <div class="card-body">
<form action="update_profile" method="post">
<h4><center>Edit profile</center></h4>


<c:if test="${not empty succMsg}">
    <h5 class="text-center text-success">${succMsg}</h5>
    <c:remove var="succMsg" scope="session"/>
</c:if>
<c:if test="${not empty failedMsg}">
    <h5 class="text-center text-danger">${failedMsg}</h5>
    <c:remove var="failedMsg" scope="session"/>
</c:if>



<input type="hidden" value="${userobj.id }" name="id">
<div class="form-group">
    <label for="exampleInputEmail1">Enter Full Name</label>
    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="${userobj.name}" name="fname" required="required">
   
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="${userobj.email}" name="email" required="required">
    
<div class="form-group">
    <label for="exampleInputEmail1">Phone No</label>
    <input type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="${userobj.phno}" name="phno" required="required">
</div>
<div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" name="password" required="required" >
</div>
  
  
  <div class="text-center">
  <button type="submit" class="btn" style="background-color:#4d1a00; color:white;">Update</button>
  </div>
</form>
        </div>
      </div>
    </div>
   </div>
</div>
</body>
</html>