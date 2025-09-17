<%@ page import="java.sql.*" %>
<%@ page import="java.util.UUID" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="java.util.Properties" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="javax.mail.Authenticator" %>

<%
String name = request.getParameter("name");
String mobile = request.getParameter("mobile");
String email = request.getParameter("email");
String stationName = request.getParameter("S_name");
String complaint = request.getParameter("complaint");

// Validate input
if (name == null || name.isEmpty() || mobile == null || mobile.isEmpty() || email == null || email.isEmpty() || stationName == null || stationName.isEmpty() || complaint == null || complaint.isEmpty()) {
    out.println("Please fill in all the fields.");
    return;
}

// Database connection details
String url = "jdbc:mysql://localhost:3306/pune_metro";
String user = "root";
String pass = "";

try {
    Class.forName("com.mysql.jdbc.Driver");
    try (Connection con = DriverManager.getConnection(url, user, pass)) {
        String query = "INSERT INTO complaints(name, mobile, email, stationName, complaint) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement pst = con.prepareStatement(query)) {
            pst.setString(1, name);
            pst.setString(2, mobile);
            pst.setString(3, email);
            pst.setString(4, stationName);
            pst.setString(5, complaint);

            int i = pst.executeUpdate();
            if (i > 0) {
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
                    messages.setSubject("Acknowledgement: Pune Metro Complaint Received");
                    messages.setText("Hi " + name + ",\n\nThank you for submitting your complaint regarding Pune Metro.\n\nWe have received your complaint and our team is currently looking into it.\n\nIf you have any further concerns or questions, please feel free to contact us.\n\nThank you for your patience and understanding.\n\nWarm regards,\nPune Metro");
                
                    // Send the message
                    Transport.send(messages);
                    out.println("Email sent successfully to " + to);
                } catch (Exception e) {
                    out.println("Failed to send email: " + e.getMessage());
                }

                response.sendRedirect("complaints.jsp");
            } else {
                out.println("Failed to insert complaint.");
            }
        }
    }
} catch(Exception e) {
    out.println("Error: " + e.getMessage());
}
%>
