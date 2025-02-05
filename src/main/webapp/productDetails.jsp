<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.shopping.model.Product" %>
<%@ page import="com.shopping.dao.ProductDao" %>
<%@ page import="com.shopping.dao.*" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product Details - Online Grocery Shop</title>
    <link rel="stylesheet" type="text/css" href="main_css/styles.css">
</head>
<body>
    <header>
        <nav>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="about.jsp">About Us</a></li>
                <li><a href="shop.jsp">Shop</a></li>
                <li><a href="contact.jsp">Contact</a></li>
                <li><a href="cart.jsp">Cart</a></li>
                <li><a href="profile.jsp">Profile</a></li>
            </ul>
        </nav>
    </header>
    <%
        int productId = Integer.parseInt(request.getParameter("id"));
        ProductDao productDao = new ProductDao();
        Product product = productDao.getProductById(productId);
    %>
    <h1><%= product.getName() %></h1>
    
    <p><%= product.getDescription() %></p>
    <p>Price: $<%= product.getPrice() %></p>
    <form action="CartServlet" method="post">
        <input type="hidden" name="action" value="add">
        <input type="hidden" name="productId" value="<%= product.getId() %>">
        <label for="quantity">Quantity:</label>
        <input type="number" id="quantity" name="quantity" value="1" min="1">
        <input type="submit" value="Add to Cart">
    </form>
</body>
</html>