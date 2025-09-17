

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="metrocard_loginstyles.css">
<link rel="stylesheet" href="../css/styles.css">
<title>Admin Login</title>
<link rel="icon" type="images/jpg" href="https://www.punemetrorail.org/assets/images/logo.png">
<style>
    body {
    font-family: Arial, sans-serif;
    background-color: #f2f2f2;
    margin: 0;
    padding: 0;
}

.container-card {
    max-width: 500px;
    margin: 100px auto;
    background-color: #fff;
    border-radius: 8px;
    padding: 20px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    text-align: center;
}

h2 {
    color: #007bff;
}

.form-group {
   margin-top:20px;
   margin-bottom: 20px;
}

label {
    display: block;
    font-weight: bold;
    margin-bottom: 5px;
}

input[type="text"],
input[type="password"] {
    width: calc(100% - 12px);
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

input[type="submit"] {
    background-color: #007bff;
    color: #fff;
    border: none;
    padding: 10px 20px;
    border-radius: 4px;
    cursor: pointer;
}

input[type="submit"]:hover {
    background-color: #0056b3;
}

.button {
    background-color: #007bff;
    color: #fff;
    border: none;
    padding: 10px 20px;
    border-radius: 4px;
    text-decoration: none;
    display: inline-block;
    transition: background-color 0.3s ease;
}

.button:hover {
    background-color: #0056b3;
}

/* metrocard login servlet*/

.metro-card {
    margin:50px auto;
    width: 300px;
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
}

.card-header {
    background-color: #007bff;
    color: #fff;
    padding: 20px;
    text-align: center;
    border-top-left-radius: 10px;
    border-top-right-radius: 10px;
}

.card-body {
    padding: 20px;
}

.card-body p {
    margin: 10px 0;
    font-size: 16px;
}
.register-link {
    color:black;
    margin-top: 10px;
    font-size: 16px;
}
.register-link a {
    color:#2f1597; 
    font-size: 16px;
    text-decoration:underline;
}
.register-link a:hover {
    text-decoration: underline;
}
</style>
</head>
<body>
    <%@ include file="AdminLoginHeader.jsp" %>    
<div class="container-card">
    <h2>Admin Login</h2>
    <form action="AdminLoginServlet.jsp" method="post">
        <div class="form-group">
            <label for="metroUser">Username :</label>
            <input type="text" id="name" name="name" required>
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <div class="form-group">
            <input type="submit" value="Login">
        </div>
    </form>
</div>
</body>
<%@ include file="AdminLoginFooter.jsp" %>

</html>
