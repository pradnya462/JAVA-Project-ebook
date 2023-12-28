<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@page isELIgnored="false" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="allCss.jsp" %>
<style>
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


</style>
</head>
<body>
<%@include file="navbar.jsp" %><br><br>
<c:if test="${empty userobj}">
  <c:redirect url="../login.jsp" />
</c:if>
<div class="container">
<div class="row">
   <div class="col-md-4 offset-md-4">
   <div class="card">
	 <div class="card-body">
<c:if test="${not empty succ}">
    <p class="test-center text-success">${succ}</p>
    <c:remove var="succ" scope="session"/>
</c:if>

<c:if test="${not empty fail}">
    <p class="test-center text-danger">${fail}</p>
    <c:remove var="fail" scope="session"/>
</c:if>

 <h4><center>Add Books</center></h4>
	 <form action="../add_books" method="post" enctype="multipart/form-data" >
  <label for="bookName">Book Name:</label>
  <input type="text" id="bookName" name="bookName" required><br>

  <label for="authorName">Author Name:</label>
  <input type="text" id="authorName" name="authorName" required><br>

  <label for="price">Price:</label>
  <input type="number" id="price" name="price" step="0.01" required><br>

  <label for="categories">Categories:</label>
  <input type="text" id="categories" name="categories">
 

  <label for="bookStatus">Book Status:</label>
  <select id="bookStatus" name="bookStatus">
    <option value="active">Active</option>
    <option value="Inactive">Inactive</option>

  </select><br>

  <label for="photo">Upload Photo:</label>
  <input type="file" id="photo" name="photo" accept="image/*"><br>

  <input type="submit" value="Add">
</form>
	   
	   </div>
   </div>
   
   
   </div>

</div>

</div>

</body>
</html>