<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.shopping.model.*" %>    
<%
    User user = (User) session.getAttribute("user");
    Order order = (Order) session.getAttribute("order");

    if (user == null || order == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Confirmation</title>
    
    <link rel="stylesheet" type="text/css" href="main_css/finalPage_style.css">
    
</head>
<body>

   <header>

 <div class="header-middle">
            <div class="header-middle-left">
                <img src="/gro.png" width = "140px" height = "50px"style = "font-size: 40px;" alt="Grocera" class="logo">
            </div>
            </div>

</header>

    <div class="container">
        <h2 style = "text-align: center;">Order Confirmation</h2>
        <%
            if (order != null) {
        %>
        <div style = "text-align: center;">
            <p>Thank you for your order!</p>
            <h3>Order Details</h3>
            <p>Order ID: <%= order.getId() %></p>
            <p>Status: <%= order.getStatus() %></p>
            <h3>Shipping Information</h3>
            <p>Address: <%= order.getShippingAddress() %></p>
            <p>Zipcode: <%= order.getZipcode() %></p>
            <p>City: <%= order.getCity() %></p>
            <h3>Products</h3>
            <table>
                <thead>
                    <tr>
                        <th>Product</th>
                        <th>Price</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Product product : order.getProducts()) { %>
                        <tr>
                            <td><%= product.getName() %></td>
                            <td>$<%= product.getPrice() %></td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
            
            <p>Order Confirmed.<a class = "button" style = "color: white;text-decoration: none"href="shop.jsp"> Go to Shop</a></p>
        <% }  else { %>
                      <p>No order found.<a href="shop.jsp">Continue shopping</a></p>
        <% } %>
    </div>
    </div>
</body>
</html>