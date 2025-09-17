<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.http.*" %>
<%
    // Retrieve username from session
    HttpSession userSession = request.getSession(false); // Don't create a new session if it doesn't exist
    String username = null;
    if (userSession != null) {
        username = (String) userSession.getAttribute("username");
    }

    // Check if the user is logged in
    if (username != null) {
    %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <title>Admin Complaints</title>
    <link rel="icon" type="images/jpg" href="https://www.punemetrorail.org/assets/images/logo.png">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500&display=swap" rel="stylesheet">
    <style>
        #heading{
           font-size: 30px;
           margin-left: 100px;
           
       }
       #heading h2{
           font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
           color: #55528dce;
       }
       .selection{
           margin-left: 100px;
           margin-top: 50px;
       }
       .selection button{
           border-top-left-radius: 10px;   
           border-top-right-radius: 10px; 
           height: 40px;
           width: 100px;
           font-size: 17px;
           border: none;
        }
      
       hr{
           margin-left: 100px;
           width: 1310px;
        }
        .box{
            border: 0.5px solid grey;
            height: auto;
            width: 1295px;
            border-radius: 16px;
            margin-left: 90px;  
            margin-top: 20px; 
            box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.5);
            padding: 20px;
        }
       
       .box2{
            padding-top: 20px;
            margin-left: 40px;
            margin-right: 40px;
            
        }
        .line {
        position: relative;
        }

        .line::after {
            content: '';
            position: absolute;
            left: 0;
            bottom: 0;
            width: 7%; /* Adjust the width as needed */
            height: 5px; /* Adjust the thickness of the underline */
            background-color: rgb(208, 68, 136);
        }
        table{
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
   </style>
   
</head>
<body class="ubuntu-medium">
    <%@ include file="AdminHeader.jsp" %>

  <div class="social_media_group box_shadow">

    <ul>
      <li>
        <a href="https://www.facebook.com" target="_blank">
          <img src="https://www.punemetrorail.org/assets/images/facebook_174848.png">
        </a>
      </li>
      <li>
        <a href="https://www.youtube.com" target="_blank">
          <img src="https://www.punemetrorail.org/assets/images/youtube_3938026.png">
        </a>
      </li>
      <li>
        <a href="https://www.thread.com" target="_blank">
          <img src="https://www.punemetrorail.org/assets/images/threads.png">
        </a>
      </li>
      <li>
        <a href="https://www.instagram.com" target="_blank">
          <img src="https://www.punemetrorail.org/assets/images/instagram_2111463.png">
        </a>
      </li>
      <li>
        <a href="https://www.twitter.com" target="_blank">
          <img src="https://www.punemetrorail.org/assets/images/x_logo%202.png">
        </a>
      </li>

    </ul>
  </div>
    <div id="heading">
        <i><h2 class="line">Complaints</h2></i>
    </div>
    <main>
        <div class="box">
                <h6>Complains by the users</h6>
                    <table border="2">
                                <thead>
                                    <tr>
                                        <th>C_ID</th>
                                        <th>Name</th>
                                        <th>Mobile No.</th>
                                        <th>Email</th>
                                        <th>Station Name</th>
                                        <th>Complaint</th>
                                        <th>Date and Time</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                    String url = "jdbc:mysql://localhost:3306/pune_metro";
                                    String user = "root";
                                    String pass = "";
                        
                                    try {
                                        Class.forName("com.mysql.jdbc.Driver");
                                        Connection con = DriverManager.getConnection(url, user, pass);
                                        Statement stmt = con.createStatement();
                                        String query = "SELECT * FROM complaints";
                                        ResultSet rs = stmt.executeQuery(query);
                                        
                                        while(rs.next()) {
                                            out.println("<tr><td>" + rs.getString("id")+ "</td><td>" + rs.getString("name")+ "</td><td>" + rs.getString("mobile") + "</td><td>" + rs.getString("email") + "</td><td>" + rs.getString("stationName") + "</td><td>" + rs.getString("complaint") + "</td><td>" + rs.getString("created_at") + "</td></tr>");
                                        }
                                    } catch(Exception e) {
                                        out.println("Error: " + e.getMessage());
                                    }
                                    %>
                                </tbody>
                            </table>
            </div>              
        </div> 
    </main><br>
    <script src="index.js"></script> 
    <%@ include file="AdminFooter.jsp" %>
    
</body>
</html>

<%
    } else {
        // If user is not logged in, redirect to login page
        response.sendRedirect("Login.jsp");
    }
%>
