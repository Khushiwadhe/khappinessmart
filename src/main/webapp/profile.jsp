<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="com.shopping.model.User"%>
<%@ page import="com.shopping.model.Order"%>
<%@ page import="com.shopping.dao.OrderDao"%>
<%@ page import="com.shopping.dao.*"%>
<%@ page import="com.shopping.model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile - Online Grocery Shop</title>
<link rel="stylesheet" type="text/css" href="main_css/profile_style.css">

</head>
<body>
<header>

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
                    <li><a style = "padding-left:200px;" href="logout.jsp" class="sale">Logout</a></li>
                    
                </ul>
            </nav>
        </div>
        </header>
	<div class="container">
        <h2>Profile</h2>
        <%
            User user = (User) session.getAttribute("user");
            if (user != null) {
        %>
            <p style = "text-align: center;">Username: <%= user.getName() %></p>
            <p style = "text-align: center;">Email: <%= user.getEmail() %></p>
            <p style = "text-align: center;">Phone: <%= user.getPhone() %></p>
            <h3>Your Orders</h3>
            
            <ul>
            <%
                OrderDao orderDao = new OrderDao();
                List<Order> orders = (List<Order>) request.getAttribute("orders");
                orders = orderDao.getOrdersByUserId(user.getId());
                if (orders != null && !orders.isEmpty()) {
            %>
                <table>
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Status</th>
                            <th>Total Amount</th>
                            <th>Shipping Address</th>
                            <th>Zipcode</th>
                            <th>City</th>
                            <th>Products</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Order order : orders) { %>
                            <tr>
                                <td><%= order.getId() %></td>
                                <td><%= order.getStatus() %></td>
                                <td>$<%= order.getTotalAmount() %></td>
                                <td><%= order.getShippingAddress() %></td>
                                <td><%= order.getZipcode() %></td>
                                <td><%= order.getCity() %></td>
                                <td>
                                    <ul>
                                        <% for (Product product : order.getProducts()) { %>
                                            <li><%= product.getName() %> - $<%= product.getPrice() %></li>
                                        <% } %>
                                    </ul>
                                </td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            <% } else { %>
                <p>No orders found.</p>
            <% } %>
        <% } else { %>
            <p>Please <a href="login.jsp">login</a> to view your profile.</p>
        <% } %>
        </ul>
    </div>
</body>
</html>