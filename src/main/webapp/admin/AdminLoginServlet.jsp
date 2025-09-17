<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.http.*" %>

<%
    String username = request.getParameter("name");
    String password = request.getParameter("password");

    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    boolean isValidUser = false;

    try {
        // Register JDBC driver
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pune_metro", "root", "");

        // Execute SQL query to validate user
        String sql = "SELECT * FROM admin WHERE username = ? AND password = ?";
        PreparedStatement preparedStatement = conn.prepareStatement(sql);
        preparedStatement.setString(1, username);
        preparedStatement.setString(2, password);
        rs = preparedStatement.executeQuery();

        // Check if user is valid
        if (rs.next()) {
            isValidUser = true;
            // Store username in session
            HttpSession adminSession = request.getSession();
            adminSession.setAttribute("username", username);

        }
    } catch (SQLException se) {
        // Handle errors for JDBC
        se.printStackTrace();
    } catch (Exception e) {
        // Handle errors for Class.forName
        e.printStackTrace();
    } finally {
        // Close resources
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException se) {
            se.printStackTrace();
        }
    }

    if (isValidUser) {
        // Redirect to AdminHome.jsp if login is successful
        response.sendRedirect("AdminHome.jsp");
    } else {
        // Redirect to an error page or display an error message
        response.sendRedirect("AdminLoginError.jsp");
    }
%>
