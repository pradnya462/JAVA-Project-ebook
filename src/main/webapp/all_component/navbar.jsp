<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page isELIgnored="false" %>
<style>



a{

   color: #4d1a00;
   
}

.form-inline a.btn {
  border: none;
  margin: 0.25rem;
  padding: 0.5rem 1rem;
  text-decoration: none;
  transition: background-color 0.3s, color 0.3s; /* Added color transition */
}
.form-inline a.btn:hover {
    background-color: white;
	color: #4d1a00 !important;
	border-radius: 15px; 
}

.col-md-3{
    
  width: 100%;
  max-width: 1000px;
}

</style>
<div class="container-fluid" style="height: 10px; background-color: #4d1a00"></div>


<div class="container-fluid p-3">

<div class="row">
<div class="col-md-3 custom2">
<h3><i class="fa-solid fa-book"></i> BookishBazzar</h3>
</div>
<div class="col-md-6">
  <form class="form-inline my-2 my-lg-0" action="search.jsp" method="post">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="ch">
      <button class="btn btn-primary my-2 my-sm-0 customs" type="submit">Search</button>
    </form>
</div>

<c:if test="${not empty userobj}">
  <div class="col-md-3" >
  <div class="logo-container">
 <a href="checkout.jsp" > <i class="fa-solid fa-cart-shopping fa-2x" class="animated-logo">
</i></a></div>
  
    <a href="login.jsp" class="btn customs"><i class="fa-solid fa-user "></i> ${ userobj.name}</a> 
    <a href="logout" class="btn btnd"><i class="fa-solid fa-right-to-bracket"></i> Logout</a>
  </div>
</c:if>



<c:if test="${empty userobj }">

<div class="col-md-3"  >
<a href= "login.jsp" class="btn customs"><i class="fa-solid fa-right-to-bracket"></i> Login</a> 
<a href="register.jsp" class="btn btnd"><i class="fa-solid fa-user-plus"></i> Register</a>
</div>

</c:if>

</div>
</div>


<nav class="navbar navbar-expand-lg navbar-dark bg-custom tcolor">
  <a class="navbar-brand" href="#"><i class="fa-solid fa-house-chimney"></i></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
       <li class="nav-item active">
        <a class="nav-link disabled" href="all_recent_book.jsp"><i class="fa-solid fa-book-open"></i> Recent Book</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="all_new_book.jsp"><i class="fa-solid fa-book-open"></i> New Book</a>
      </li>
     
      <li class="nav-item active">
        <a class="nav-link disabled" href="all_old_book.jsp"><i class="fa-solid fa-book-open"></i> Old Book</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <a href="setting.jsp" class="btn text-light my-2 my-sm-0" type="submit"><i class=" fa-solid fa-gear"></i> Setting</a>
 
      <a class="btn text-light my-2 my-sm-0" type="submit"><i class=" fa-solid fa-address-book"></i> Contact Us</a>
    
    </form>
  </div>
</nav>

<link rel="stylesheet" href="all_component/style.css">