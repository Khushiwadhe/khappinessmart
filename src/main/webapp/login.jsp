<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login - Online Grocery Shop</title>
<style>
body {
background-color: #F9F6EE;
}
</style>
<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>

<div class="main">

<!-- Sing in  Form -->
<section class="sign-in">
<div class="container">
<div class="signin-content">
<div class="signin-image">
<figure>
<img src="images/signin-image.jpg" alt="sing up image">
</figure>
<a href="register.jsp" class="signup-image-link">Create an
account</a>
</div>

<div class="signin-form">
<h2 class="form-title">Sign in</h2>
<form method="post" action="user" class="register-form"
id="login-form">
<input type="hidden" name="action" value="login">
<div class="form-group">
<label for="email"><i
class="zmdi zmdi-account material-icons-name"></i></label> <input
type="text" name=email id="email"
placeholder="Enter email" />
</div>
<div class="form-group">
<label for="password"><i class="zmdi zmdi-lock"></i></label> <input
type="password" name="password" id="password"
placeholder="Password" />
</div>
<div class="form-group">
<input type="checkbox" name="remember-me" id="remember-me"
class="agree-term" /> <label for="remember-me"
class="label-agree-term"><span><span></span></span>Remember
me</label>
</div>
<div class="form-group form-button">
<input type="submit" name="signin" id="signin"
class="form-submit" value="Login" />
</div>
</form>
<div class="social-login">
<span class="social-label">Or login with</span>
<ul class="socials">
<li><a href="#"><i
class="display-flex-center zmdi zmdi-facebook"></i></a></li>
<li><a href="#"><i
class="display-flex-center zmdi zmdi-twitter"></i></a></li>
<li><a href="#"><i
class="display-flex-center zmdi zmdi-google"></i></a></li>
</ul>
</div>
</div>
</div>
</div>
</section>

</div>

<!-- JS -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="js/main.js"></script>

<%
        String errorMessage = (String) request.getAttribute("errorMessage");
        if (errorMessage != null) {
    %>
        <p style="color:red;"><%= errorMessage %></p>
    <%
        }
    %>
    <%-- <header>
        <nav>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="about.jsp">About Us</a></li>
                <li><a href="shop.jsp">Shop</a></li>
                <li><a href="contact.jsp">Contact</a></li>
                <li><a href="login.jsp">Login</a></li>
                <li><a href="register.jsp">Register</a></li>
            </ul>
        </nav>
    </header>
    <h2>Login</h2>
    <form action="user" method="post">
        <input type="hidden" name="action" value="login">
        Email: <input type="text" name="email"><br>
        Password: <input type="password" name="password"><br>
        <input type="submit" value="Login">
        <a href="register.jsp">If you are new here - Register</a>
    </form>
    <%
        String errorMessage = (String) request.getAttribute("errorMessage");
        if (errorMessage != null) {
    %>
        <p style="color:red;"><%= errorMessage %></p>
    <%
        }
    %> --%>
</body>
</html>