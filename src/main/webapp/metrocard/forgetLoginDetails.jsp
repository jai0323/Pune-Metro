<%@ page import="java.sql.*" %>
<%@ page import="java.util.UUID" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="java.util.Properties" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="javax.mail.Authenticator" %>

<%
// Retrieve email address from the form
String email = request.getParameter("email");

// Database connection details
String url = "jdbc:mysql://localhost:3306/pune_metro";
String user = "root";
String pass = "password";

Connection con = null;
PreparedStatement pst = null;
ResultSet rs = null;

try {
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection(url, user, pass);

    // Query to retrieve login details based on the provided email
    String query = "SELECT username, password FROM registration WHERE email=?";
    pst = con.prepareStatement(query);
    pst.setString(1, email);
    rs = pst.executeQuery();

    if (rs.next()) {
        // If a record is found with the provided email, retrieve the login details
        String username = rs.getString("username");
        String password = rs.getString("password");

        // Get the email address from the form
        String to = email;
        
        // Set the email properties
        Properties props = new Properties();
        props.put("mail.debug", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");
        props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        
        // Set your email credentials
        final String usernames = "onlinepunemetro@gmail.com";
        final String passwords = "qxoqrjtrjolvhlwv";
        
        // Create a session with authentication
        Session sessions = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(usernames, passwords);
            }
        });
        sessions.setDebug(true);
        
        try {
            Message messages = new MimeMessage(sessions);
            messages.setFrom(new InternetAddress(usernames));
            messages.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            messages.setSubject("Login Details Recovery");
            messages.setText("Dear User,\n\nYour login details:\nUsername: " + username + "\nPassword: " + password + "\n\nSincerely,\nThe Pune Metro Team");
        
            // Send the message
            Transport.send(messages);
            
            out.println("<script>alert('Login details sent successfully to your email address.');</script>");
            response.sendRedirect("metrocard_login.jsp");
        } catch (MessagingException e) {
            out.println("Failed to send email: " + e.getMessage());
        }
    } else {
        // If no record found with the provided email
        out.println("<p>No user found with the provided email address.</p>");
    }
} catch (Exception e) {
    out.println("<p>An error occurred: " + e.getMessage() + "</p>");
} finally {
    // Close database connections and resources
    if (rs != null) rs.close();
    if (pst != null) pst.close();
    if (con != null) con.close();
}
%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="metrocard_loginstyles.css">
<link rel="stylesheet" href="headerfooter.css">
<title>MetroCard Login</title>
</head>
<body>
    <%@ include file="header.jsp" %>   
<div class="container-card">
    <h2>Forget Details</h2>
    <form action="forgetLoginDetails.jsp" method="post">
        <div class="form-group">
            <label for="metroUser">Email Id:</label>
            <input type="text" id="username" name="email" placeholder="xyz12@gmail.com" required>
        </div>
        <div class="form-group">
            <input type="submit" value="Get Details">
        </div>
    </form>
   
</div>
</body>
<script src="index.js"></script>    
<%@ include file="footer.jsp" %>

</html>
