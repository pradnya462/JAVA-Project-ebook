<%@page import="com.Database.DBConnect"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page isELIgnored="false" %>


<%@page import="com.DAO.*"%>
<%@page import="java.util.*"%>
<%@page import="com.entity.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User: Old Book</title>
<%@include file="all_component/allCss.jsp" %>
<style>
.tab{
   background-color:#4d1a00;
}
</style>
</head>
<body>
<%@include file="all_component/navbar.jsp" %>


<c:if test="${not empty succMsg }">
<p class = "text-center text-success">${succMsg }</p>
<c:remove var="succMsg" scope="session"/>

</c:if>

<div class="container p-5 ">


<table class="table table-striped">
  <thead class="tab text-white">
    <tr>
      <th scope="col">Book Name</th>
      <th scope="col">Author</th>
      <th scope="col">Price</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
    
    <%
    user u=(user)session.getAttribute("userobj");
    String email = u.getEmail();
    BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
    List<BookDtls> list=dao.getBookByOld(email, "Old");
    for(BookDtls b:list){%>
    
     <tr>
      <td><%=b.getBookname()%></td>
      <td><%=b.getAuthor()%></td>
      <td><%=b.getPrice()%></td>
      <td><%=b.getBookCategory()%></td>
      
      <td><a href="delete_old_book?em=<%=email %>&&id=<%=b.getBookId() %>" 
      class="btn btn-sm btn-danger">Delete</a></td>
    </tr>
     
    <%}
    %>
    
    
    
   
  </tbody>
</table>
  

</div>


</body>
</html>