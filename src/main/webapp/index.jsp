<%@page import="com.Database.DBConnect"%>
<%@page import="com.DAO.*"%>
<%@page import="java.util.*"%>
<%@page import="com.entity.*"%>
 <!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<html>
<head>
<title>Ebook: Index</title>
<%@include file="all_component/allCss.jsp" %>
<style type="text/css">

.row a{
   color:black;
}
h3{
   font-family: Palatino Linotype, Book Antiqua, Palatino, serif;
   font-weight:bold;
}

@keyframes fade-in {
  from {
    opacity: 0;
    transform: translateY(20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.card.crd-ho {
  animation: fade-in 0.5s ease-out forwards;
  opacity: 0;
  
}


/* Add more nth-child selectors for additional cards */

.card-body {
   background-color:#FDF2E9;
   transition: transform 0.3s ease-in-out;
   border: 1px solid #ffdab3; ;
}

.card-body:hover {
  background-color: lightgray;
  transform: scale(1.1);
}




.back-img {
  background: url("book/bck.avif");
  height: 90vh;
  width: 100%;
  background-repeat: no-repeat;
  background-size: cover;
  background-position: center bottom;
}
.white-box {
  background-color: white;
  padding: 20px; /* Adjust the padding as needed */
  font-family: 'Playfair Display', serif;
  height:80%;
  width:80%;
}
/* Style the white-box with a background image */
.white-box {
  background-image: url('book/foot.png'); /* Replace with your image path */
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center;
  padding: 20px; /* Add padding as needed to control spacing between content and background */
}

/*Text Below homa page0*/
.container-mid {
    text-align: center;
  }

  .container-mid img {
    display: block;
    margin: 20px auto;
  }
  .container-mid .row {
    margin: 20px 0; /* Adjust the margin size as needed */
  }

  .container-mid h3 {
    font-size: 30px; /* Adjust the font size as needed */
  }

  .container-mid span {
    display: block;
   
    font-size: 12px; /* Adjust the font size as needed */
  }
  /*///////////*/


/* Style the links container */
.links-container {
  display: inline-block; /* Display links side by side */
}

/* Style the custom links */
.custom-link {
  text-decoration: none; /* Remove default underline */
  color: #198754; /* Set link color */
  margin-right: 20px; /* Add space between links */
  transition: border-color 0.3s; /* Add transition for underline color change */
}

/* Add underline on hover with a different color */
.custom-link:hover {
  border-bottom: 2px solid #198754; /* Change the border color on hover */
  color: #198754; /* Change the text color on hover if desired */
}


/* Vertical alignment of text */
.align-items-center {
  height: 70vh; /* Match the height of the background image */
}

.crd-ho:hover{
background-color: #ebd5c6;
}
.col-md-3{
max-width: fit-content;  
display:flex;


}
.chart-container {
  display: flex;
  justify-content: space-between;
}

.chart {
 /* Adjust the margin as needed */
}

.leaf-background {
        background-image: url('book/back-leaf.webp'),url('book/back-leaf2.webp'); /* Replace with the actual path to your leaf image */
        background-repeat: no-repeat;
        background-position: center right,left top; /* Adjust the position as needed */
        background-size: 400px; 
        margin-right: 0px; /* Add some padding to the right side to make space for the image */
        
}
.leaf-background1 {
        background-image: url('book/back-leaf3.png'); /* Replace with the actual path to your leaf image */
        background-repeat: no-repeat;
        background-position: right top; /* Adjust the position as needed */
        background-size: 400px; 
        margin-right: 0px; /* Add some padding to the right side to make space for the image */
        
    }
.leaf-background2 {
        background-image: url('book/back-leaf4.webp'),url('book/back-leaf5.png');/*Replace with the actual path to your leaf image */
        background-repeat: no-repeat;
        background-position: right top,left bottom; /* Adjust the position as needed */
        background-size: 400px; 
        margin-right: 0px; /* Add some padding to the right side to make space for the image */
        
    }
/*new book animation*/
.image-container {
  position: relative;
  overflow: hidden;
}

.image-overlay {
  position: absolute;
  top: 0;
  left: 0;
  width: 166px;
  height: 231px;
  background-color: rgba(0, 0, 0, 0.7);
  opacity: 0;
  transition: opacity 0.3s ease-in-out;
  display: flex;
  justify-content: center;
  align-items: center;
}

.image-container:hover .image-overlay {
  opacity: 1;
}

.btn-favorite,
.btn-cart,
.btn-details,
.btn-price {
  color: white;
  margin: 5px;
  transition: transform 0.3s ease-in-out;
}

.btn-favorite:hover,
.btn-cart:hover,
.btn-details:hover,
.btn-price:hover {
  transform: scale(1.2);
}

/*//new book animation*/

/*Recent Book*/
.image-container {
  position: relative;
  overflow: hidden;
  height:230px;
  width:166px;
}

.image-container img {
  transition: transform 0.3s ease-in-out;
}

.image-container:hover img {
  transform: scale(1.1);
}

.image-overlay {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.7);
  opacity: 0;
  transition: opacity 0.3s ease-in-out;
  display: flex;
  justify-content: center;
  align-items: center;
  height:230px;
  width:166px;
}

.image-container:hover .image-overlay {
  opacity: 1;
}

.image-overlay a {
  display: inline-block;
  margin: 5px;
  color: white;
  transition: transform 0.3s ease-in-out;
}

.image-overlay a:hover {
  transform: scale(1.2);
}

.btn-favorite {
  background-color: transparent;
  border: none;
}

.btn-cart,
.btn-details {
  background-color: transparent;
  border: none;
}

.btn-price {
  background-color: transparent;
  border: none;
  color: white;
  font-size: 18px;
}

.btn-price i {
  margin-left: 5px;
}

/*//Recent Book*/


/*Old book section*/
.image-container {
  position: relative;
  overflow: hidden;
}

.image-container img {
  transition: transform 0.3s ease-in-out;
}

.image-container:hover img {
  transform: scale(1.1);
}

.image-overlay {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.7);
  opacity: 0;
  transition: opacity 0.3s ease-in-out;
  display: flex;
  justify-content: center;
  align-items: center;
}

.image-container:hover .image-overlay {
  opacity: 1;
}

.image-overlay a {
  display: inline-block;
  margin: 5px;
  color: white;
  transition: transform 0.3s ease-in-out;
}

.image-overlay a:hover {
  transform: scale(1.2);
}

.btn-details,
.btn-cart {
  background-color: transparent;
  border: none;
}

.btn-price {
  background-color: transparent;
  border: none;
  color: white;
  font-size: 18px;
}

.btn-price i {
  margin-left: 5px;
}

/*//Old book section*/

/*about us*/


/*//about us*/
</style>
</head>
<body style="background-color: #f0f1f2; background-blend-mode: overlay;">

<%
user u =(user)session.getAttribute("userobj");
%>


<%@include file="all_component/navbar.jsp" %>

<div class="container-fluid back-img">
  <div class="row align-items-center">
    <div class="col-md-6 text-black">
      <div class="white-box">
        <h2 style="font-size:50px;">Hello,<br>
        The <span style="color: green;">book-Lovers</span></h2>
        <p>GET THE LATEST BEST SELLER!!</p>
        <p>BookishBazaar is a modern and flexible WordPress theme for book writers and authors, featuring WooCommerce support</p><br><br>
        <div class="links-container">
          <a href="all_recent_book.jsp" class="custom-link">Latest Book</a>
          <a href="sell_book.jsp" class="custom-link">Sell Book</a>
        </div>
      </div>
    </div>
    <div class="col-md-6">
      <!-- Empty column to create spacing between the text and background image -->
    </div>
  </div>
</div>

<div class="container-mid">
   <img src="book/txt-image.png" alt="Image">
   <div class="row">
     <h3>"Every day is a journey and the journey itself is home."<br><br><span>MATSU BASHIO</span></h3>
   </div>
</div>
<hr>



<!-- Start recent book-->
 <div class="container">
 
    <div class="leaf-background">
 
    <h3 class="text-center">Recent Book</h3><br><br>
    <div class="row">
        <% BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
        List<BookDtls> list2 = dao2.getRecentBooks();
        for (BookDtls b : list2) { %>
            <div class="col-md-3">
                <div class="card crd-ho">
                    <div class="card-body text-center">
                        <div class="image-container">
                            <img alt="" src="book/<%= b.getPhotoname() %>" class="img-thumbnail" style="height:230px; width:166px;">
                            <div class="image-overlay">
                                <a href="#" class="btn btn-favorite"><i class="fa-solid fa-heart"></i></a>
                                <% if (u == null) { %>
                                    <a href="login.jsp" class="btn btn-cart"><i class="fa-solid fa-shopping-cart"></i></a>
                                <% } else { %>
                                    <a href="cart?bid=<%= b.getBookId() %> &&uid=<%= u.getId() %>" class="btn btn-cart"><i class="fa-solid fa-shopping-cart"></i></a>
                                <% } %>
                                <a href="view_books.jsp?bid=<%= b.getBookId() %>" class="btn btn-details"><i class="fa-solid fa-eye"></i></a>
                            </div>
                        </div>
                        <p style="font-family: 'DM Serif Display', serif; font-size:40px;"><b><%= b.getBookname() %></b></p>
                        <p>Author: <%= b.getAuthor() %></p>
                        <p>Categories: <%= b.getBookCategory() %></p>
                        <div class="row">
                            <a href="" class="btn btn-price" style="color:green;"><%= b.getPrice() %><i class="fa-solid fa-indian-rupee-sign"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        <% } %>
    </div><br><br>
    <div class="text-center mt-1">
        <a href="all_recent_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
    </div>
</div>
</div>

<!-- End recent book-->




<hr>
<!-- Start New book-->
<div class="container">
   <div class="leaf-background1">
    <h3 class="text-center">New Book</h3>
    <div class="row">
        <% BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
        List<BookDtls> list = dao.getNewBook();
        int count = 0;
        for (BookDtls b : list) {
            if (count % 4 == 0 && count != 0) { %>
    </div>
    <div class="row">
        <% } %>
        <div class="col-md-3">
            <div class="card crd-ho">
                <div class="card-body text-center">
                    <div class="image-container">
                        <img alt="" src="book/<%= b.getPhotoname() %>" class="img-thumbnail">
                        <div class="image-overlay">
                            <a href="#" class="btn btn-favorite"><i class="fa-solid fa-heart"></i></a>
                            <% if (u == null) { %>
                                <a href="login.jsp" class="btn btn-cart"><i class="fa-solid fa-shopping-cart"></i></a>
                            <% } else { %>
                                <a href="cart?bid=<%= b.getBookId() %> &&uid=<%= u.getId() %>" class="btn btn-cart"><i class="fa-solid fa-shopping-cart"></i></a>
                            <% } %>
                            <a href="view_books.jsp?bid=<%= b.getBookId() %>" class="btn btn-details"><i class="fa-solid fa-eye"></i></a>
                        </div>
                    </div>
                    <p style="font-family: 'DM Serif Display', serif; font-size:40px;"><b><%= b.getBookname() %></b></p>
                    <p>Author: <%= b.getAuthor() %></p>
                    <p>Categories: <%= b.getBookCategory() %></p>
                    <div class="row">
                        <a href="" class="btn btn-price" style="color:green;"><%= b.getPrice() %>
                            <i class="fa-solid fa-indian-rupee-sign"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <% count++;
        } %>
    </div><br><br>
    <div class="text-center mt-1">
        <a href="all_new_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
    </div>
</div>
</div>

<!-- End new book-->





<hr>
<!-- Start old book-->
<div class="container">
<div class="leaf-background2">
    <h3 class="text-center">Old Book</h3>
    <div class="row">
        <% BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getConn());
        List<BookDtls> list3 = dao3.getOldBooks();
        for (BookDtls b : list3) { %>
            <div class="col-md-3">
                <div class="card crd-ho">
                    <div class="card-body text-center">
                        <div class="image-container">
                            <img alt="" src="book/<%= b.getPhotoname() %>" class="img-thumbnail">
                            <div class="image-overlay">
                                <a href="view_books.jsp?bid=<%= b.getBookId() %>" class="btn btn-details"><i class="fa-solid fa-eye"></i></a>
                                <% if (u == null) { %>
                                    <a href="login.jsp" class="btn btn-cart"><i class="fa-solid fa-shopping-cart"></i></a>
                                <% } else { %>
                                    <a href="cart?bid=<%= b.getBookId() %> &&uid=<%= u.getId() %>" class="btn btn-cart"><i class="fa-solid fa-shopping-cart"></i></a>
                                <% } %>
                            </div>
                        </div>
                        <p style="font-family: 'DM Serif Display', serif; font-size:40px;"><b><%= b.getBookname() %></b></p>
                        <p>Author: <%= b.getAuthor() %></p>
                        <p>Category: <%= b.getBookCategory() %></p>
                        <div class="row">
                            <a href="" class="btn btn-price" style="color:green;"><%= b.getPrice() %><i class="fa-solid fa-indian-rupee-sign"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        <% } %>
    </div><br><br>
    <div class="text-center mt-1">
        <a href="all_old_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
    </div>
    </div>
</div><hr>

<!-- End Old book-->

<!-- about us  -->
<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" src="ca1.png" alt="First slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="ca2.png" alt="Second slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="ca3.png" alt="Third slide">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
<!-- about us  -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<%@include file="all_component/footer.jsp" %>
</body>
</html>
