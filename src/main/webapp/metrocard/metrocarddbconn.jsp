<%@ page import ="java.sql.*"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.lang.*"%>
<%@ page import ="java.util.UUID"%>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="java.util.Properties" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="javax.mail.Authenticator"%>

<%

long cardno;
        UUID uuid = UUID.randomUUID();
        long mostSignificantBits = uuid.getMostSignificantBits();
        cardno = Math.abs(mostSignificantBits % 1_000_000_000);

        // Define the validity period of the metro card in days
        int validityPeriodInDays = 30;
        
        // Get the current date
        java.util.Date currentDate = new java.util.Date();
        
        // Calculate the expiration date by adding the validity period to the current date
        java.util.Calendar calendar = java.util.Calendar.getInstance();
        calendar.setTime(currentDate);
        calendar.add(java.util.Calendar.DAY_OF_MONTH, validityPeriodInDays);
        java.util.Date expiryDate = calendar.getTime();
        
        // Format the dates for display
        java.text.SimpleDateFormat dateFormat = new java.text.SimpleDateFormat("yyyy-MM-dd");
       // String formattedCurrentDate = dateFormat.format(currentDate);
String formattedExpiryDate = dateFormat.format(expiryDate);

String name=request.getParameter("name");
String username=request.getParameter("username");
String password=request.getParameter("password");
String age=request.getParameter("age");
String gender=request.getParameter("gender");
String phone=request.getParameter("phone");
String email=request.getParameter("email");
String address=request.getParameter("address");

try{
   
    Class.forName("com.mysql.jdbc.Driver");
    Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/pune_metro","root","password");
    ResultSet rs;
    PreparedStatement ps1= con.prepareStatement("select username from registration where username=?");
    ps1.setString(1,username);
    
    rs = ps1.executeQuery();

    if(rs.next())
    {
        %>
        <!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Registration Failed</title>
<link rel="stylesheet" href="metrocard_loginstyles.css">
</head>
<body>

<div class="container-card">
    <h2>Registration Failed</h2>
    <a href="metrocardapplication.jsp" class="button">Go to Registration!</a>
</div>

</body>
</html>
            <script>
                    alert("Username already exist");
            </script>
        <%

    }else{
        PreparedStatement ps= con.prepareStatement("insert into registration(name,username,password,age,gender,phone,email,address,cardno,expdate)values(?,?,?,?,?,?,?,?,?,?)");
        ps.setString(1, name);
        ps.setString(2, username);
        ps.setString(3, password);
        ps.setString(4, age);
        ps.setString(5, gender);
        ps.setString(6, phone);
        ps.setString(7, email);
        ps.setString(8, address);
        ps.setLong(9, cardno);
        ps.setString(10, formattedExpiryDate);
        
        int x = ps.executeUpdate();

        PreparedStatement pss= con.prepareStatement("INSERT INTO metrocard (cardnumber, name, address,expiry_date) VALUES (?, ?, ?,?)");
        pss.setLong(1, cardno);
        pss.setString(2, name);
        pss.setString(3, address);
        pss.setString(4, formattedExpiryDate);
        
        
        int t = pss.executeUpdate();
        
        // Get the email address from the form
        String to = email;
        
        // Set the email properties
        Properties props = new Properties();
        props.put("mail.debug", "true");
        props.put("mail.smtp.host", "smtp.gmail.com"); // Change this to your SMTP server
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");
        props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        
        // Set your email credentials
        final String usernames = "onlinepunemetro@gmail.com";
        final String passwords = "qxoqrjtrjolvhlwv"; // Change this to your email password 
        
        // Create a session with authentication
        Session sessions = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(usernames, passwords);
            }
        });
        sessions.setDebug(true);
        
        try {
            Message messages = new MimeMessage(sessions);
            messages.setFrom(new InternetAddress(usernames));
            messages.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            messages.setSubject("Thank You for Registering for Your Pune Metro Card!");
            messages.setText("Hi " + name + ",\n\nUsername: " + username + "\nPassword: " + password + "\n\nI wanted to extend my heartfelt thanks for registering for your Pune Metro card.\nYour proactive step toward utilizing public transportation not only benefits you but also contributes to a more sustainable and efficient city.\nIf you have any questions or need assistance, please feel free to reach out. We're here to ensure your metro experience is smooth and convenient.\n\nThank you once again for choosing Pune Metro.\n\nWarm regards,\nPune Metro");
        
            // Send the message
            Transport.send(messages);
            out.println("Email sent successfully to " + to);
        } catch (Exception e) {
            out.println(e);
        }
        
    

    if(x>0){
    %>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Registration Successful</title>
<link rel="stylesheet" href="metrocard_loginstyles.css">
<link rel="stylesheet" href="headerfooter.css">
</head>
<%@ include file="header.html" %>
<body>

<div class="container-card">
    <h2>Registration Successful</h2>
    <p>Add balance to your metrocard from any Metro station ticket Counter within 24  hours of registration.</p>
    <p>Thank you for registering!</p>
    <a href="metrocard_login.jsp" class="button">Go to Login</a>
</div>
<script src="index.js"></script> 

</body>
<%@ include file="footer.jsp" %>
</html>
    <%   
    }else{
    %>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Registration Unsuccessful</title>
        <link rel="stylesheet" href="metrocard_loginstyles.css">
        <link rel="stylesheet" href="headerfooter.css">
    </head>
    <%@ include file="header.html" %>
    <body>
        <div class="container-card">
            <h2>Registration Failed</h2>
            <a href="metrocardapplication.jsp" class="button">Login</a>
        </div>
    </body>
    <script src="index.js"></script> 
    
    <%@ include file="footer.jsp" %>
</html>
       <%
    }
}
}catch(Exception e){
    out.println(e);
}

%>

