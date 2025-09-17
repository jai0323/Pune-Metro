<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%
String name = request.getParameter("name");
String mobile = request.getParameter("mobile");
String item = request.getParameter("item");
String description = request.getParameter("description");
String stationName = request.getParameter("S_name");

// Database connection details
String url = "jdbc:mysql://localhost:3306/pune_metro"; // Adjust the URL, database name as necessary
String user = "root"; // Database username
String pass = "password"; // Database password

try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection(url, user, pass);

    String query = "INSERT INTO foundItems (name, mobile, item, description, stationName) VALUES (?, ?, ?, ?, ?)";
    PreparedStatement pst = con.prepareStatement(query);
    pst.setString(1, name);
    pst.setString(2, mobile);
    pst.setString(3, item);
    pst.setString(4, description);
    pst.setString(5, stationName);

    int i = pst.executeUpdate();
    if(i > 0) {
        response.sendRedirect("LostFound.jsp"); // Redirect to a success page or back to form
    } else {
        // Handle insertion failure
    }
} catch(Exception e) {
    out.println(e);
}
%>
