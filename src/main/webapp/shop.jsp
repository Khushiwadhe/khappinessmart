<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>

<%@ page import="com.shopping.dao.*" %>
<%@ page import="com.shopping.model.*" %>
<%@ page import="com.shopping.servlet.*" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Shop - Online Grocery Shop</title>
    <link rel="stylesheet" type="text/css" href="main_css/profile_style.css">
</head>
<body>
<!-- <p class = "headline">Free delivery & 40% Discount for next 3 orders!Place your 1st order in.<span style="margin-left: 180px;"></span>until the end of sale : 50days 14hrs 15min 48sec</p> -->
<header>
 <div class="header-middle">
            <div class="header-middle-left">
                <img src="/logo.png" style = "font-size: 30px;"alt="HappinessSuperMart" class="logo">
            </div>
  </div>
<div class="header-bottom">
            <nav>
                <ul>
                    <li><a href="home.jsp">Home</a></li>
                    <li><a href="">Blog</a></li>
                    <li><a href="">Message Us</a></li>
                    <li><a href="contact.jsp">Contact Us</a></li>
                    <li><a href="shop.jsp" class="sale">Almost Finished</a></li>
                </ul>
            </nav>
        </div>
</header>
    <h1>Shop</h1>
    <form action="shop.jsp" method="get">
        <label for="search">Search:</label>
        <input type="text" id="search" name="search">
        <input type="submit" value="Search">
    </form>
    <%
        String search = request.getParameter("search");
        ProductDao productDao = new ProductDao();
        List<Product> products;
        if (search != null && !search.isEmpty()) {
            products = productDao.searchProducts(search);
        } else {
            products = productDao.getAllProducts();
        }
    %>
    
   
    <div class="container">
       
        <h3>Categories</h3>
        <ul class = "product">
            <% 
                CategoryDao categoryDao = new CategoryDao();
                List<Category> categories = (List<Category>) request.getAttribute("categories");
                categories = categoryDao.getAllCategories();
                if (categories != null) {
                    for (Category category : categories) { 
            %>
                <li class = "product">
                <a href="categoryProducts?categoryId=<%= category.getId() %>">
                <img src="<%= category.getImageUrl() %>" alt="<%= category.getName() %>" width="80" height="100">
                <%= category.getName() %>
                </a>
                </li>
            <% 
                    } 
                } else { 
            %>
                <li>No categories available.</li>
            <% } %>
        </ul>
    </div>

    <h2>Featured Products</h2>
    <ul class = "product">
        <%
            ProductDao productDao2 = new ProductDao();
            List<Product> products2 = (List<Product>) request.getAttribute("products");
            products2 = productDao2.getAllProducts();
            if (products != null) {
                for (Product product : products) {
        %>
            <li class = "product">
                <img src="<%= product.getImageUrl() %>" alt="<%= product.getName() %>" width="100" height="100">
                <h3><%= product.getName() %></h3>
                <p><%= product.getDescription() %></p>
                <p>Price: $<%= product.getPrice() %></p>
                <form action="cart" method="post">
                    <input type="hidden" name="productId" value="<%= product.getId() %>">
                    <input type="submit" value="Add to Cart">
                </form>
            </li>
        <%
                }
            }
        %>
    </ul>
</body>
</html>