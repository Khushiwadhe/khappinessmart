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
<title>Products by Category</title>

<link rel="stylesheet" type="text/css" href="main_css/home_style.css">
    <link rel="stylesheet" type="text/css" href="main_css/styles.css">
</head>
<body>
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

</header>
    
    <h2>Products</h2>
        
        <ul>
        <%
            List<Product> products = (List<Product>) request.getAttribute("products");
            if (products != null) {
        %>
            
                <% for (Product product : products) { %>
                    <li>
                        <img src="<%= product.getImageUrl() %>" alt="<%= product.getName() %>" width="100" height="100">
                        <h4><%= product.getName() %></h4>
                        <p><%= product.getDescription() %></p>
                        <p>$<%= product.getPrice() %></p>
                        <form action="cart" method="post">
                            <input type="hidden" name="productId" value="<%= product.getId() %>">
                            <button type="submit">Add to Cart</button>
                        </form>
                    </li>
                <% } %>=
            
        <% } else { %>
            <p>No products available for this category.</p>
        <% } %>
        </ul>
   
    
</body>
</html>