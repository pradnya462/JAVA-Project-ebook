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
<%@include file="all_component/navbar.jsp" %>

<div class="conatiner-fluid">
  <div class="row p-3">
   <%
BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
List<BookDtls> list = dao.getAllOldBook();
for(BookDtls b:list)
{%>
<div class="col-md-3">
	<div class="card crd-ho">
<div class="card-body text-center">
<img alt="" src="book/<%=b.getPhotoname() %>" style="width:100px; height:150px" class="img-thumblin">
<p><%=b.getBookname() %></p>
<p><%=b.getAuthor() %></p>
<p>Categories:<%=b.getBookCategory() %></p>
<div class="row">
<a href="view_books.jsp?bid=<%=b.getBookId() %>" class="btn btn-dark btn-sm ml-1">View Details</a>
<a href="" class="btn btn-secondary btn-sm ml-1"><%=b.getPrice()%>
<i class="fa-solid fa-indian-rupee-sign"></i></a>
</div>
 </div>
</div>
</div>
<%
}
%>    
  </div>
</div>


</body>
</html>