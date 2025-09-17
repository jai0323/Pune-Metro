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
    <title>Admin Lost and Found</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500&display=swap" rel="stylesheet">
    <link rel="icon" type="images/jpg" href="https://www.punemetrorail.org/assets/images/logo.png">
    <style>
          #heading{
            font-size: 30px;
            margin-left: 100px;
            
        }
        #heading h2{
            font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
            color: #55528dce;
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
        label {
            font-weight: bold;
        }
        input[type="text"], textarea {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #eb60bd;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #55528D;
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
        .sub-title {
            font-size: 60px;
            font-weight: 600;
            color: #fff;
        }

        .tab-titles {
            display: flex;
            margin-left: 100px;
            margin-top: 50px;
            margin-top: 50px;
        }
        .tab-titles button{
            border-top-left-radius: 10px;   
            border-top-right-radius: 10px; 
            height: 40px;
            width: 110px;
            margin-right: 10px;
            font-size: 17px;
            border: none;
            
        }
        .active-button {
            background-color: #55528D !important; /* Change background color to purple */
            color: white !important; /* Change text color to white */
        }
        .tab-links {
            margin-right: 50px;
            font-size: 18px;
            font-weight: 500;
            cursor: pointer;
            position: relative;
        }

        .tab-links::after {
            content: '';
            width: 0;
            height: 3px;
            background:rgb(208, 68, 136);
            position: absolute;
            left: 0;
            bottom: -8px;
            transition: 0.5s;
        }
        .tab-links.active-link::after {
            width: 100%;
        }

        .tab-contents ul li {
            list-style: none;
            margin: 10px 0;
        }

        .tab-contents {
            display: none;
        }

        .tab-contents.active-tab {
            display: block;
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
    <i><h2 class="line">Lost & Found</h2></i>
    </div> 
    <main>
        <div class="tab-titles">
            <button class="tab-links active-link active-button" onclick="openTab(this,'Ritem')">Return</button>
            <button class="tab-links" onclick="openTab(this,'LItems')">Lost</button>
            <button class="tab-links" onclick="openTab(this,'FItems')">Found</button>
            <button class="tab-links" onclick="openTab(this,'Retditems')">Returned Items</button>
        </div>
        <hr>
        <div class="tab-contents" id="LItems">
            <div class="box">
                <h6>Lost Items</h6>
                <table border="1">
                    <thead>
                        <tr>
                            <th>L_ID</th>
                            <th>Name</th>
                            <th>Mobile No.</th>
                            <th>Item</th>
                            <th>Description</th>
                            <th>Station Name</th>
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
                            String query = "SELECT * FROM lostItems";
                            ResultSet rs = stmt.executeQuery(query);
                            
                            while(rs.next()) {
                                out.println("<tr><td>" + rs.getString("id")+ "</td><td>" + rs.getString("name")+ "</td><td>" + rs.getString("mobile") + "</td><td>" + rs.getString("item") + "</td><td>" + rs.getString("description") + "</td><td>" + rs.getString("stationName") + "</td><td>" + rs.getString("created_at") + "</td></tr>");
                            }
                        } catch(Exception e) {
                            out.println("Error: " + e.getMessage());
                        }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </main>
        <div class="tab-contents" id="Retditems">
            <div class="box">
                    <h6>Returned Items</h6>
                    <table border="1">
                        <thead>
                            <tr>
                                <th>R_ID</th>
                                <th>Name</th>
                                <th>Mobile No.</th>
                                <th>Item</th>
                                <th>Station Name</th>
                                <th>Date and Time</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                
                            try {
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection con = DriverManager.getConnection(url, user, pass);
                                Statement stmt = con.createStatement();
                                String query = "SELECT * FROM returneditems";
                                ResultSet rs = stmt.executeQuery(query);
                                
                                while(rs.next()) {
                                    out.println("<tr><td>" + rs.getString("id") + "</td><td>" + rs.getString("name") + "</td><td>" + rs.getString("mobile") +"</td><td>" + rs.getString("item") + "</td><td>" + rs.getString("stationName") + "</td><td>" + rs.getString("created_at") + "</td></tr>");
                                }
                            } catch(Exception e) {
                                out.println("Error: " + e.getMessage());
                            }
                            %>
                        </tbody>
                    </table>
            </div>
        </div>

        <div class="tab-contents" id="FItems">
            <div class="box"> 
    
                <h6>List Of Found Items</h6>
                <table border="1">
                    <thead>
                        <tr>
                            <th>F_ID</th>
                            <th>Item Name</th>
                            <th>Description</th>
                            <th>Station Name</th>
                            <th>Date and Time</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
            
                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection(url, user, pass);
                            Statement stmt = con.createStatement();
                            String query = "SELECT * FROM founditems";
                            ResultSet rs = stmt.executeQuery(query);
                            
                            while(rs.next()) {
                                out.println("<tr><td>" + rs.getString("id") + "</td><td>" + rs.getString("item") + "</td><td>" + rs.getString("description") + "</td><td>" + rs.getString("stationName") + "</td><td>" + rs.getString("created_at") + "</td></tr>");
                            }
                        } catch(Exception e) {
                            out.println("Error: " + e.getMessage());
                        }
                        %>
                    </tbody>
                </table>
                
            </div>
        </div>
        
        <div class="tab-contents active-tab" id="Ritem">
            <div class="box">
                <form action="AdminLostFound.jsp" method="post">
                    <h1>Return Item</h1>
                    <label for="item">Enter Found ID :</label>
                    <input type="text" id="id" name="id" required><br>
                    <label for="item">Enter Name :</label>
                    <input type="text" id="name" name="name" required><br>
                    <label for="item">Enter Mobile No. :</label>
                    <input type="text" id="mobile" name="mobile" required><br>
                    
                        <input type="submit" value="Returned">
                    </form><br>
                    <table border="1">
                        <tbody>
                            <%
                            String id = request.getParameter("id");
                            String name = request.getParameter("name");
                            String mobile = request.getParameter("mobile");
                          

                            if (id != null && !id.isEmpty()) { // Check if ID parameter is not null or empty

                                try {
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection con = DriverManager.getConnection(url, user, pass);
                                    
                                    // Insert into returneditems
                                    String insertQuery = "INSERT INTO returneditems (id, name, mobile, item, stationName) SELECT id, ?, ?, item, stationName FROM founditems WHERE id = ?";
                                    PreparedStatement insertPst = con.prepareStatement(insertQuery);
                                    insertPst.setString(1, name); // Set the value for the name placeholder
                                    insertPst.setString(2, mobile); // Set the value for the mobile placeholder
                                    insertPst.setString(3, id); // Set the value for the ID placeholder

                                    int rowsInserted = insertPst.executeUpdate(); // Execute the insert query
                                    
                                    // Delete from founditems
                                    String deleteQuery = "DELETE FROM founditems WHERE id = ?";
                                    PreparedStatement deletePst = con.prepareStatement(deleteQuery);
                                    deletePst.setString(1, id); // Set the value for the ID placeholder
                                    int rowsDeleted = deletePst.executeUpdate(); // Execute the delete query

                                    if (rowsInserted > 0 && rowsDeleted > 0) {
                                        out.println("Item Returned Successfully");
                                    } else {
                                        out.println("No item found with the provided ID");
                                    }
                                    
                                    // Close resources
                                    insertPst.close();
                                    deletePst.close();
                                    con.close();
                                } catch (ClassNotFoundException | SQLException e) {
                                    out.println("Error: " + e.getMessage());
                                }
                            } else {
                                out.println("ID parameter is missing or empty");
                            }
                            %>

                           

                        </tbody>
                    </table>
            </div>
        </div>
        <script>
            var tabLinks = document.getElementsByClassName('tab-links');
            var tabContents = document.getElementsByClassName('tab-contents');
        
            function openTab(clickedButton, tabName) {
                // Remove 'active-button' class from all buttons
                var buttons = document.querySelectorAll('.tab-links');
                buttons.forEach(function(button) {
                    button.classList.remove('active-button');
                });
                
                // Add 'active-button' class to the clicked button
                clickedButton.classList.add('active-button');
        
                for (var tabLink of tabLinks) {
                    tabLink.classList.remove('active-link');
                }
                for (var tabContent of tabContents) {
                    tabContent.classList.remove('active-tab');
                }
                clickedButton.classList.add('active-link');
                document.getElementById(tabName).classList.add('active-tab');
            }
        </script>
              <script src="index.js"></script> <br>
              <%@ include file="AdminFooter.jsp" %>
</body>
</html>
<%
    } else {
        // If user is not logged in, redirect to login page
        response.sendRedirect("AdminLogin.jsp");
    }
%>