<%@ page import="java.sql.*" %>
<%@ page import="java.util.UUID" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="java.util.Properties" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="javax.mail.Authenticator" %>
<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String mobile = request.getParameter("mobile");
String item = request.getParameter("item");
String description = request.getParameter("description");
String stationName = request.getParameter("S_name");
String contactDetails = request.getParameter("contact");

// Database connection details
String url = "jdbc:mysql://localhost:3306/pune_metro";
String user = "root";
String pass = "password";

Connection con = null;
PreparedStatement pst = null;

try {
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection(url, user, pass);

    String query = "INSERT INTO lostItems (name,email, mobile, item, description, stationName, contactDetails) VALUES (?,?, ?, ?, ?, ?, ?)";
    pst = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
    pst.setString(1, name);
    pst.setString(2, email);
    pst.setString(3, mobile);
    pst.setString(4, item);
    pst.setString(5, description);
    pst.setString(6, stationName);
    pst.setString(7, contactDetails);

    int i = pst.executeUpdate();

    if(i > 0) {
        // Retrieve the generated ID
        ResultSet generatedKeys = pst.getGeneratedKeys();
        int id = 0;
        if (generatedKeys.next()) {
            id = generatedKeys.getInt(1);
        }

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
            messages.setSubject("Acknowledgement: Pune Metro Lost Item Report Received");
            messages.setText("Hi " + name + ",\n\nThank you for submitting your lost item report regarding Pune Metro.\n\n and Your lost ID is L_"+id+" please chek on our website in found item if somthis match  with your item feel free to contact us and come with Lost id to collect your Item We have received your report and our team is currently looking into it.\n\nIf you have any further concerns or questions, please feel free to contact us.\n\nThank you for your cooperation.\n\nWarm regards,\nPune Metro");
                
            // Send the message
            Transport.send(messages);
            out.println("<script>alert('Lost Item submitted successfully.'); window.location.href='login.jsp';</script>");
        } catch (Exception e) {
            out.println("Failed to send email: " + e.getMessage());
        }

        response.sendRedirect("LostFound.jsp");
    } else {
        // Handle failure
    }
} catch(Exception e) {
    out.println("An error occurred: " + e.getMessage());
} finally {
    if (pst != null) { pst.close(); }
    if (con != null) { con.close(); }
}
%>
