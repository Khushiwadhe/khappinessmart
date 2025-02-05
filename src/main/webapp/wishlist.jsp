<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Your wishlist</title>
<link href="main_css/home_style.css" type="text/css" rel="stylesheet">
<style>
body {
color: #228B22;
}
</style>
</head>
<body>
<div class="header-middle">
            <div class="header-middle-left">
                <img src="/logo.png" style = "font-size: 40px;"alt="Grocera" class="logo">
                <span style = "font-size: 12px;">Deliver to all</span>
            </div>
            <div class="header-middle-center">
                <input type="text" placeholder="Search for products, categories or brands...">
            </div>
            <div class="header-middle-right">
                <a style = "font-size: 12px;"href="login.jsp">Sign In</a>
                <a style = "font-size: 12px;"href="register.jsp">Register</a>
                <a style = "font-size: 12px;"href="">Wishlist</a>
                <a style = "font-size: 12px;"href="cart.jsp">Cart <span>(0)</span></a>
            </div>
        </div>
<div class="header-bottom">
            <nav>
                <ul>
                    <li><a href="home.jsp">Home</a></li>
                    <li><a href="shop.jsp">Shop</a></li>
                    <li><a href="blog.jsp">Blog</a></li>
                    <li><a href="recepies.jsp">Recepies</a></li>
                    <li><a href="message_us.jsp">Message Us</a></li>
                    <li><a href="contact.jsp">Contact Us</a></li>
                    <li><a href="shop.jsp" class="sale">Almost Finished</a></li>
                </ul>
            </nav>
        </div>
</header>
<div class = "set">
<h2 align = center>Your wishlist is empty!</h2>
<div class="image-container">
        <img src="images/wishlist.jpeg">
        <div class="text-overlay">Make Your WishList</div>
    </div>
</body>
</html>