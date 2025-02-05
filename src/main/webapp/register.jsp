<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register - Online Grocery Shop</title>
<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="main">

<!-- Sign up form -->
<section class="signup">
<div class="container">
<div class="signup-content">
<div class="signup-form">
<h2 class="form-title">Sign up</h2>		
<form method="post" action="user" class="register-form"
id="register-form">
<input type="hidden" name="action" value="register">

<div class="form-group">
<label for="name"><i
class="zmdi zmdi-account material-icons-name"></i></label> <input
type="text" name="name" id="name" placeholder="Enter Your Name" />
</div>

<div class="form-group">
<label for="email"><i class="zmdi zmdi-email"></i></label> <input
type="email" name="email" id="email" placeholder="Enter email" />
</div>

<div class="form-group">
<label for="pass"><i class="zmdi zmdi-lock"></i></label> <input
type="password" name="password" id="pass" placeholder="Password" />
</div>

<div class="form-group">
<label for="contact"><i class="zmdi zmdi-lock-outline"></i></label>
<input type="text" name="phone" id="contact"
placeholder="Contact no" />
</div>

<div class="form-group">
<input type="checkbox" name="agree-term" id="agree-term"
class="agree-term" /> <label for="agree-term"
class="label-agree-term"><span><span></span></span>I
agree all statements in <a href="#" class="term-service">Terms
of service</a></label>
</div>

<div class="form-group form-button">
<input type="submit" name="signup" id="signup"
class="form-submit" value="Register" />
</div>
</form>
</div>

<div class="signup-image">
<figure>
<img src="images/signup-image.jpg" alt="sing up image">
</figure>
<a href="login.jsp" class="signup-image-link">Already have an account -Login
</a>
</div>
</div>
</div>
</section>
</div>
<!-- JS -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="js/main.js"></script>



    <!-- <header>
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
     <h2>Register</h2>
    <form action="user" method="post">
        <input type="hidden" name="action" value="register">
        Name: <input type="text" name="name"><br>
        Email: <input type="text" name="email"><br>
        Password: <input type="password" name="password"><br>
        Phone: <input type="text" name="phone"><br>
        <input type="submit" value="Register">
        <a href="login.jsp">Already have an account -Login</a>
    </form> -->
</body>
</html>