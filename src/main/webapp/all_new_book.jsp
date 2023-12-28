<%@page import="com.Database.DBConnect"%>
<%@page import="com.DAO.*"%>
<%@page import="java.util.*"%>
<%@page import="com.entity.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page isELIgnored="false" %>

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

#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}


</style>
</head>
<body>

<%
user u =(user)session.getAttribute("userobj");
%>

<c:if test="${not empty addCart }">

<div id="toast">${addCart}</div>

<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
</script>

<c:remove var="addCart" scope="session"/>

</c:if>


<%@include file="all_component/navbar.jsp" %>

<div class="conatiner-fluid">
  <div class="row p-3">
   <%
BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
List<BookDtls> list = dao.getAllNewBook();
for(BookDtls b:list)
{%>
<div class="col-md-3">
	<div class="card crd-ho">
<div class="card-body text-center">
<img alt="" src="book/<%=b.getPhotoname() %>" style="width:100px; height:150px" class="img-thumblin">
<p><%=b.getBookname() %></p>
<p>Author: <%=b.getAuthor() %></p>
<p>Categories:<%=b.getBookCategory() %></p>
<div class="row">
	<% if(u==null)
{%>
	<a href="login.jsp" class="btn btn-dark btn-sm ml-2">Add Cart</a>
<%} else{%>
	<a href="cart?bid=<%=b.getBookId() %> &&uid=<%=u.getId()%>" class="btn btn-dark btn-sm ml-2">Add Cart</a>
	
<%}%>



<a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-secondary btn-sm ml-1">View Details</a>
<a href="" class="btn btn-dark btn-sm ml-1"><%=b.getPrice()%>
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