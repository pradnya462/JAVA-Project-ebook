<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.Database.DBConnect"%>
<%@page import="com.DAO.*"%>
<%@page import="java.util.*"%>
<%@page import="com.entity.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Recent Books</title>
<%@include file="all_component/allCss.jsp" %>
<style type="text/css">
.back-img {
  height: 70vh;
  width: 100%;
  background-repeat: no-repeat;
  background-size: cover;
  background-position: center bottom;
}

.crd-ho:hover{
background-color: #ebd5c6;
}

</style>
</head>
<body>

<%
user u =(user)session.getAttribute("userobj");
%>
<%@include file="all_component/navbar.jsp" %>

<div class="conatiner-fluid">
  <div class="row p-3">
    <%
BookDAOImpl dao2 =  new BookDAOImpl(DBConnect.getConn());
List<BookDtls> list2=dao2.getAllRecentBook();

for(BookDtls b: list2)
{%>
<div class="col-md-3">
<div class="card crd-ho mt-2">
<div class="card-body text-center">
<img alt="" src="book/<%=b.getPhotoname() %>"
 style="width:100px; height:150px" class="img-thumblin">
<p><%=b.getBookname() %></p>
<p><%=b.getAuthor() %></p>



<p>

<%
if(b.getBookCategory().equals("Old"))
{%>
	
	<p>Categories:<%=b.getBookCategory()%> </p>
	<div class="row">
<a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-secondary btn-sm ml-5">View Details</a>
<a href="" class="btn btn-dark btn-sm ml-1"><%=b.getPrice()%><i class="fa-solid fa-indian-rupee-sign"></i></a>
</div>
	
<%}else{%>
	
	<p>Categories:<%=b.getBookCategory()%> </p>
	<div class="row">
<% if(u==null)
{%>
	<a href="login.jsp" class="btn btn-dark btn-sm ml-2">Add Cart</a>
<%} else{%>
	<a href="cart?bid=<%=b.getBookId() %> &&uid=<%=u.getId()%>" class="btn btn-dark btn-sm ml-2">Add Cart</a>
	
<%}%>
<a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-secondary btn-sm ml-1">View Details</a>
<a href="" class="btn btn-dark btn-sm ml-0"><%=b.getPrice()%><i class="fa-solid fa-indian-rupee-sign"></i></a>

</div>
<%}
%>

 </div>
</div>
</div>
<%}
%>
    </div>
  </div>



</body>
</html>