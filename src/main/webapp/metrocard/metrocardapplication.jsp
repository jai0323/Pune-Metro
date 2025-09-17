<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="headerfooter.css">
<title>MetroCard Application Form</title>
</head>
<style>
    body {
    font-family: Arial, sans-serif;
    background-color: #f2f2f2;
    margin: 0;
    padding: 0;
}
h2{
    margin-top:10px;
}
.container1 {
    max-width: 500px;
    margin: 20px auto;
    background: rgba(255, 255, 255, 0.3); /* semi-transparent white */
    border-radius: 16px;
    padding: 25px 30px;
    box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
    backdrop-filter: blur(-11px); /* blur the background behind the container */
    -webkit-backdrop-filter: blur(10px); /* for Safari */
    border: 1px solid rgba(255, 255, 255, 0.3); /* optional soft border */
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}
@keyframes fadeIn {
    from { opacity: 0; transform: translateY(20px); }
    to { opacity: 1; transform: translateY(0); }
}
.container1 {
    animation: fadeIn 0.8s ease-in-out;
}


h2 {
    text-align: center;
}

.form-group {
    font-size:18px;
    margin-bottom: 10px;
}

label {
    display: block;
    font-weight: bold;
    margin-bottom: 5px;
}
/* Base styling */
/* Glassy Input Fields */
input[type="text"],
input[type="email"],
input[type="password"] {
    width: calc(100% - 12px);
    padding: 10px;
    border: 1px solid rgba(255, 255, 255, 0.4); /* soft transparent border */
    border-radius: 20px;
    font-size: 14px;
    outline: none;
    background: rgba(255, 255, 255, 0.2);  /* semi-transparent background */
    color: #fff; /* white text */
    backdrop-filter: blur(8px);  /* frosted glass effect */
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); /* subtle shadow */
    transition: all 0.3s ease-in-out;
}

/* Hover and Focus Effect */
input[type="text"]:hover,
input[type="email"]:hover,
input[type="password"]:hover,
input[type="text"]:focus,
input[type="email"]:focus,
input[type="password"]:focus {
    transform: scale(1.05); /* slight zoom */
    border-color: #ffffff;  /* highlight border */
    box-shadow: 0 0 20px rgba(255, 255, 255, 0.6); /* glowing effect */
    background: rgba(255, 255, 255, 0.25); /* slightly brighter on hover */
}

input[type="submit"] {
    background-color:#55528d;
    color: #fff;
    border: none;
    font-size:16px;
    padding: 10px 20px;
    border-radius: 15px;
    cursor: pointer;
}

input[type="submit"]:hover {
    background-color:light-green;
}
body {
    font-family: Arial, sans-serif;
    /*background-color: #f2f2f2;*/
    margin: 0;
    padding: 0;

            font-family: Arial, sans-serif;
            background-color:rgba(226, 223, 223, 0.674);
            color:rgb(5, 5, 5);
            background-image: url('https://www.punemetrorail.org/assets/images/banner3.jpg'); 
            background-size: cover;
            background-position: center; 
            background-repeat: no-repeat; 
            background-attachment: fixed; 
}

</style>
<%@ include file="header.html" %> 
<body>   
<div class="container1" id="error">
    <h2>MetroCard Application Form</h2>
    <form action="metrocarddbconn.jsp" id="form" method="post">
        
        <div class="form-group">
            <label for="name">Full Name:<input type="text" id="name" name="name" required></label>
        </div>
        <div class="form-group">
            <label for="name">UserName:</label>
            <input type="text" id="name" name="username" required>
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <div class="form-group">
            <label for="Age">Age:</label>
            <input type="text" id="age" name="age" required>
        </div>
        <div class="form-group">
            <label for="gender">Gender:</label>
            <input type="radio" id="gender" name="gender" value="m" required>Male
            <input type="radio" id="gender" name="gender" value="f" required>Female
            <input type="radio" id="gender" name="gender" value="o" required>Transgender
        </div>
        <div class="form-group">
            <label for="phone">Phone Number:</label>
            <input type="text" id="phone" name="phone" required>
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
        </div>
        <div class="form-group">
            <label for="address">Address:</label>
            <input type="text" id="address" name="address" required>
        </div>
        <center>
        <div class="form-group">
            <input type="submit" value="Submit Application">
        </div>
                
    </form>
</div>

</body>
<script src="index.js"></script>    
<%@ include file="footer.jsp" %>

</html>
