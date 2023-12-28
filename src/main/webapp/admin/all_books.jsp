<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.DAO.BookDAOImpl" %>
<%@ page import="com.Database.DBConnect" %>
<%@ page import="com.entity.BookDtls" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@page isELIgnored="false" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="allCss.jsp" %>
<style type="text/css">
   .head{
   background-color: #4d1a00;;
   color:white;
   
   }
   
</style>
</head>
<body>
<%@include file="navbar.jsp" %><br>


<c:if test="${empty userobj}">
  <c:redirect url="../login.jsp" />
</c:if>


<h2><center>Hello Admin</center></h2>
<c:if test="${not empty succ}">
    <h5 class="test-center text-success"><center>${succ}</center></h5>
    <c:remove var="succ" scope="session"/>
</c:if>

<c:if test="${not empty fail}">
    <h5 class="test-center text-danger"><center>${fail}</center></h5>
    <c:remove var="fail" scope="session"/>
</c:if>


<table class="table table-striped">
  <thead class="head" class="text-light">
    <tr>
     <th scope="col">ID</th> 
      <th scope="col">Image</th>
      <th scope="col">Book Name</th>
      <th scope="col">Author</th>
      <th scope="col">Price</th>
      <th scope="col">Categories</th>
      <th scope="col">Status</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
 <% 
   BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
  List<BookDtls> list=dao.getAllBooks();
  for(BookDtls b:list){
  %> 
  <tr>
      <td><%=b.getBookId() %></td>
      <td><img src="../book/<%=b.getPhotoname()%>"  style="width:50px; height:50px;"></td>
      <td><%=b.getBookname() %></td>
      <td><%=b.getAuthor() %></td>
      <td><%=b.getPrice() %></td>
      <td><%=b.getBookCategory() %></td>
      <td><%=b.getStatus() %></td>
      <td>
      <a href="edit_books.jsp?id=<%=b.getBookId()%>" class="btn btn-sm btn-success"><i class="fa-regular fa-pen-to-square"></i> Edit</a>
      <a href="../delete?id=<%= b.getBookId() %>" class="btn btn-sm btn-danger"><i class="fa-solid fa-trash"></i> Delete</a>
      </td>
    </tr> 
  
  <%
  }
  %>

 
    
    
  </tbody>
</table>

</body>
</html>