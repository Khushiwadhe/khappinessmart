<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="com.shopping.model.CartItem" %>
<%@ page import="com.shopping.dao.CartDao" %>   
<%@ page import="com.shopping.dao.*" %> 
<%@page import="com.shopping.model.*" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart - Online Grocery Shop</title>
    <link rel="stylesheet" type="text/css" href="main_css/profile_style.css">
</head>
<body>
    
<header>

 <div class="header-middle">
            <div class="header-middle-left">
                <img src="/logo.png" style = "font-size: 30px;"alt="HappinessSuperMart" class="logo">
                
            </div>
            </div>
<div class="header-bottom">
            <nav style = "margin-top: -10px;">
                <ul>
                    <li><a href="home.jsp">Home</a></li>
                    <li><a href="shop.jsp">Shop</a></li>
                    <li><a href="">Message Us</a></li>
                    <li><a href="contact.jsp">Contact Us</a></li>
                    <li><a href="shop.jsp" class="sale">Almost Finished</a></li>
                </ul>
            </nav>
        </div>
</header>
    <h2>Your Shopping Cart</h2>
    <%
        List<Product> cart = (List<Product>) session.getAttribute("cart");
        if (cart != null && !cart.isEmpty()) {
    %>
        <ul>
            <% double total = 0; %>
            <% for (Product product : cart) { %>
                <li style = "text-align: center;">
                    <%= product.getName() %> - $<%= product.getPrice() %>
                    <% total += product.getPrice(); %>
                </li>
            <% } %>
        </ul>
        <p style = "text-align: center;">Total: $<%= total %></p>
        <form action="checkout.jsp" method="post">
            <input type="submit" value="Proceed to Checkout">
        </form>
        <form action="shop.jsp" method="post">
             <input type="submit" value="Continue Shopping">
        </form>
    <%
        } else {
    %>
        <p align = center>Your cart is empty.</p>
    <%
        }
    %>
</body>
</html>