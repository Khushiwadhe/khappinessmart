<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Grocera-Home Page</title>
<link href="main_css/home_style.css" type="text/css" rel="stylesheet">
</head>
<body>
<p class = "headline">Free delivery & 40% Discount for next 3 orders!Place your 1st order in.<span style="margin-left: 180px;"></span>until the end of sale : 50days 14hrs 15min 48sec</p>
<header>
<div class="header-top">
<ul>
<li ><a href ="about.jsp">About Us</a></li>
<li><a href = "profile.jsp">My account</a></li>
<li><a href = "wishlist.jsp">Wishlist</a></li>
<li id = "textStyle">|we deliver to you every day from 7:00am to 5:00pm <span style="margin-left: 450px;">Order Tracking</li>
</ul>
</div>
 <div class="header-middle">
            <div class="header-middle-left">
                <img src="/logo.png" style = "font-size: 30px;"alt="HappinessSuperMart" class="logo">
                <span style = "font-size: 12px;">Deliver to all</span>
            </div>
            <div class="header-middle-center">
                <input type="text" placeholder="Search for products, categories or brands...">
            </div>
            <div class="header-middle-right">
                <a style = "font-size: 12px;"href="login.jsp">Sign In</a>
                <a style = "font-size: 12px;"href="register.jsp">Register</a>
                <a style = "font-size: 12px;"href="wishlist.jsp">Wishlist</a>
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
<!-- Main Content -->
<main>
        <section class="content">
            <div class="promotion">
                <h2>Get the best quality products at the lowest prices</h2>
                <p>We have prepared special discounts for you on grocery products. Don't miss these opportunities...</p>
                <img src="main_images/AdobeStock_35859274_Preview.png" width = "800" height = "250" alt="Promotion">
                <a class = "button" href = "shop.jsp">Shop Now</a>
            </div>
        </section>
    </main>

    <!-- Footer -->
    <footer>
        <!-- Footer content here -->
    </footer>

    <script src="js/timer.js"></script>
    <div style = "text-align: center;">
    <h1 style = "color: #228B22; font-size: 40px;">Contact Us</h1>
    <p align = "center"><img src = "images/contact.jpeg" width = "900" height = "300"></p>
    <p style = "color: #228B22; font-size: 15px;">If you have any questions, feel free to reach out to us at:</p>
    <p style = "color: #228B22; font-size: 15px;">Email: support@onlinegroceryshop.com</p>
    <p style = "color: #228B22; font-size: 15px;">Phone: (123) 456-7890</p>
    <p style = "color: #228B22; font-size: 15px;">Address: 123 Grocery Lane, Food City, FC 12345</p>
</body>
</html>