<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="com.shopping.model.*"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Checkout - Online Grocery Shop</title>
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

	<div class="container">
        <h2>Checkout</h2>
        <%
            List<Product> cart = (List<Product>) session.getAttribute("cart");
            if (cart != null && !cart.isEmpty()) {
        %>
            <form action="checkout" method="post">
                <table>
                    <thead>
                        <tr>
                            <th>Product</th>
                            <th>Price</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Product product : cart) { %>
                            <tr>
                                <td><%= product.getName() %></td>
                                <td>$<%= product.getPrice() %></td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
                <h3>Shipping Information</h3>
                <label for="shippingAddress">Address:</label>
                <input type="text" id="shippingAddress" name="shippingAddress" required>
                <label for="zipcode">Zipcode:</label>
                <input type="text" id="zipcode" name="zipcode" required>
                <label for="city">City:</label>
                <input type="text" id="city" name="city" required>
                <br> <label for="paymentMethod">Payment Method:</label> <select
			          id="paymentMethod" name="paymentMethod" required>
			          <option value="creditCard">Credit Card</option>
		              <option value="debitCard">Debit Card</option>
			          <option value="paypal">PayPal</option>
			          </select><br>
                <button type="submit">Place Order</button>
            </form>
        <% } else { %>
            <p>Your cart is empty. <a href="shop.jsp">Continue shopping</a>.</p>
        <% } %>
    </div>

	<!-- <h1>Checkout</h1>
	<form action="CheckoutServlet" method="post">
		<label for="address">Shipping Address:</label>
		<textarea id="address" name="address" required></textarea>
		<br> <label for="paymentMethod">Payment Method:</label> <select
			id="paymentMethod" name="paymentMethod" required>
			<option value="creditCard">Credit Card</option>
			<option value="debitCard">Debit Card</option>
			<option value="paypal">PayPal</option>
		</select><br> <input type="submit" value="Place Order">
	</form> -->
</body>
</html>