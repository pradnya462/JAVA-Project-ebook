<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@page isELIgnored="false" %>   
<%@ page import="com.DAO.BookDAOImpl" %>
<%@ page import="com.Database.DBConnect" %>
<%@ page import="com.entity.BookDtls" %>
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
<div class="container">
<div class="row">
   <div class="col-md-4 offset-md-4">
   <div class="card">
	 <div class="card-body">

     <h4><center>Edit Books</center></h4>
     
     <%
        int id=Integer.parseInt(request.getParameter("id"));
        BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
        BookDtls b=dao.getBookById(id);
     %>
	 <form action="../editbooks" method="post"  >
	 <input type="hidden" name="id" value="<%=b.getBookId() %>">
  <label for="bookName">Book Name:</label>
  <input type="text" id="bookName" name="bookName" required value="<%=b.getBookname() %>"><br>

  <label for="authorName">Author Name:</label>
  <input type="text" id="authorName" name="authorName" required value="<%=b.getAuthor() %>"><br>

  <label for="price">Price:</label>
  <input type="number" id="price" name="price" step="0.01" required value="<%=b.getPrice() %>"><br>

  <label for="bookStatus">Book Status:</label>
  <select id="bookStatus" name="bookStatus">
   <%
   if("Active".equals(b.getStatus())){
	   %>
	   <option value="active">Active</option>
	  <option value="Inactive">Inactive</option>
	  <%
   }else{%>
   <option value="Inactive">Inactive</option>
	   <option value="active">Active</option>
   <%}
	   %>
   
    

  </select><br>

  <input type="submit" value="Update">
</form>
	   
	   </div>
   </div>
   
   
   </div>

</div>

</div>

</body>
</html>