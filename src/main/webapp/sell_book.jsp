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
<style>
  form {
    width: 400px;
    margin: 0 auto;
  }
  

  label {
    display: block;
    margin-bottom: 5px;
  }

  input[type="text"],
  input[type="number"],
  select {
    width: 100%;
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    margin-bottom: 10px;
  }

  input[type="file"] {
    margin-bottom: 15px;
  }

  input[type="submit"] {
    background-color: #000000;
    color: white;
    padding: 10px 15px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 16px;
  }

  input[type="submit"]:hover {
    background-color: #8B0000;
  }
</style>
</head>
<body style="background-color: #f0f1f2">

<c:if test="${empty userobj }">
<c:redirect url="login.jsp"></c:redirect>
</c:if>

<%@include file="all_component/navbar.jsp" %><br>

<div class="container">

  <div class="card">
  <div class="card-body">
  <h4><center>Sell Old Books</center></h4>
  
  <c:if test="${not empty succ}">
    <p class="test-center text-success">${succ}</p>
    <c:remove var="succ" scope="session"/>
</c:if>

<c:if test="${not empty fail}">
    <p class="test-center text-danger">${fail}</p>
    <c:remove var="fail" scope="session"/>
</c:if>
  
  <form action="add_old_book" method="post" enctype="multipart/form-data" >
 
  
  <input type="hidden" value="${userobj.email }" name="user">
  
  
  <label for="bookName">Book Name:</label>
  <input type="text" id="bookName" name="bookName" required><br>

  <label for="authorName">Author Name:</label>
  <input type="text" id="authorName" name="authorName" required><br>

  <label for="price">Price:</label>
  <input type="number" id="price" name="price" step="0.01" required><br>

 
 

  <label for="photo">Upload Photo:</label>
  <input type="file" id="photo" name="photo" accept="image/*"><br>

  <input type="submit" value="Sell">
</form>
  
  </div>
  
  </div>
</div>
</body>
</html>