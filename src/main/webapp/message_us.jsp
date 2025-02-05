<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Grocera-Message Us</title>
<link rel="stylesheet" type="text/css" href="main_css/home_style.css">
</head>
<body>
<header>
<div class="header-middle">
            <div class="header-middle-left">
                <img src="/gro.png" width = "140px" height = "50px"style = "font-size: 30px;" alt="HappinessSuperMart" class="logo">
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
                    <li><a href="">Blog</a></li>
                    <li><a href="">Recepies</a></li>
                    <li><a href="">Message Us</a></li>
                    <li><a href="contact.jsp">Contact Us</a></li>
                    <li><a href="shop.jsp" class="sale">Almost Finished</a></li>
                </ul>
            </nav>
        </div>
        </header>
        <div style = "align-self:  center;">
        <form>
        <textarea name="message" rows="15" cols="150" placeholder="Enter your Query"></textarea><br>
        <input class="button" type="submit" value="Submit">
        </form>
        </div>
</body>
</html>