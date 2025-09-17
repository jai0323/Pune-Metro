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
    <title>Admin Reports</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="icon" type="images/jpg" href="https://www.punemetrorail.org/assets/images/logo.png">
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
    <i><h2 class="line">Reports</h2></i>
    </div> 
    <main>
        <div class="tab-titles">
            <button class="tab-links active-link active-button" onclick="openTab(this,'Ritem')">Tickets</button>
            <button class="tab-links" onclick="openTab(this,'LItems')">Station To Station</button>
            <button class="tab-links" onclick="openTab(this,'FItems')">Station Reports</button>
            <button class="tab-links" onclick="openTab(this,'Retditems')">Revenew</button>
        </div>
        <hr>
        <div class="tab-contents" id="LItems">
            <div class="box">
                <h6>Station to tation Reports</h6>
                    <form action="AdminReports.jsp" method="post">
                        <label for="statio_from">Station From :</label>
                        <div class="plan-your-jrny-box-selection">
                            <select name="statio_from" id="statio_from">
                                <option value="0">-- Select Station --</option>
                                <option value="PCMC">PCMC</option>
                                <option value="Sant Tukaram Nagar">Sant Tukaram Nagar</option>
                                <option value="Bhosari">Bhosari</option>
                                <option value="Kasarwadi">Kasarwadi</option>
                                <option value="Phugewadi">Phugewadi</option>
                                <option value="Dapodi">Dapodi</option>
                                <option value="Bopodi">Bopodi</option>
                                <option value="Shivaji Nagar">Shivaji Nagar</option>
                                <option value="Civil Court">Civil Court</option>
                                <option value="Vanaz">Vanaz</option>
                                <option value="Anand Nagar">Anand Nagar</option>
                                <option value="Ideal Colony">Ideal Colony</option>
                                <option value="NalStop">Nal Stop</option>
                                <option value="GarwareCollege">Garware College</option>
                                <option value="Deccan Gymkhana">Deccan Gymkhana</option>
                                <option value="Chhatrapati Sambhaji Udyan">Chhatrapati Sambhaji Udyan</option>
                                <option value="PMC">PMC</option>
                                <option value="MangalwarPeth">Mangalwar Peth</option>
                                <option value="Pune Railway Station">Pune Railway Station</option>
                                <option value="Ruby Hall Clinic">Ruby Hall Clinic</option>
                            </select>
                        </div>
                        <label for="Station_to">Station To :</label>
                        <div class="plan-your-jrny-box-selection">
                            <select name="Station_to" id="Station_to">
                                <option value="0">-- Select Station --</option>
                                <option value="PCMC">PCMC</option>
                                <option value="Sant Tukaram Nagar">Sant Tukaram Nagar</option>
                                <option value="Bhosari">Bhosari</option>
                                <option value="Kasarwadi">Kasarwadi</option>
                                <option value="Phugewadi">Phugewadi</option>
                                <option value="Dapodi">Dapodi</option>
                                <option value="Bopodi">Bopodi</option>
                                <option value="Shivaji Nagar">Shivaji Nagar</option>
                                <option value="Civil Court">Civil Court</option>
                                <option value="Vanaz">Vanaz</option>
                                <option value="Anand Nagar">Anand Nagar</option>
                                <option value="Ideal Colony">Ideal Colony</option>
                                <option value="NalStop">Nal Stop</option>
                                <option value="GarwareCollege">Garware College</option>
                                <option value="Deccan Gymkhana">Deccan Gymkhana</option>
                                <option value="Chhatrapati Sambhaji Udyan">Chhatrapati Sambhaji Udyan</option>
                                <option value="PMC">PMC</option>
                                <option value="MangalwarPeth">Mangalwar Peth</option>
                                <option value="Pune Railway Station">Pune Railway Station</option>
                                <option value="Ruby Hall Clinic">Ruby Hall Clinic</option>
                            </select>
                        </div>
                        <div class="dateselection">
                            <label for="froms">from :</label>
                            <input type="date" id="from" name="froms" pattern="\d{4}-\d{2}-\d{2}" placeholder="YYYY-MM-DD" required>
                            <label for="to">to :</label>
                            <input type="date" id="to" name="tos" placeholder="YYYY-MM-DD" pattern="\d{4}-\d{2}-\d{2}" required><br>
                        </div>
                        <input type="submit" value="Generate Report">
                    </form><br>
                    <table border="1">
                        <tbody>
                            <%
                                String url = "jdbc:mysql://localhost:3306/pune_metro";
                                String user = "root";
                                String pass = "";
                                Connection con = null;
                                con = DriverManager.getConnection(url, user, pass);
                                

                                String stationFrom = request.getParameter("statio_from"); // Corrected parameter name
                                String stationTo = request.getParameter("Station_to"); // Corrected parameter name
                                String fromDates = request.getParameter("froms"); // Corrected parameter name
                                String toDates = request.getParameter("tos"); // Corrected parameter name
                                
                                try {
                                    // Establish database connection
                                    Class.forName("com.mysql.jdbc.Driver");
                                    
                                   
                                    // Query to get the number of users and total fare generated between given dates
                                    String query = "SELECT COUNT(*) AS num_passengers, SUM(fare) AS total_fare FROM tickets WHERE source_station = ? AND destination_station = ? AND DATE(created_at) BETWEEN ? AND ?";
                                    
                                    // Prepare and execute the SQL statement
                                    PreparedStatement reportPst = con.prepareStatement(query);
                                    reportPst.setString(1, stationFrom);
                                    reportPst.setString(2, stationTo);
                                    reportPst.setString(3, fromDates);
                                    reportPst.setString(4, toDates);
                                    ResultSet reportResult = reportPst.executeQuery();
                                    
                                    // Display the result
                                    if (reportResult.next()) {
                                        int numUsers = reportResult.getInt("num_passengers");
                                        double totalFare = reportResult.getDouble("total_fare");
                                        out.println("Number of Passengers traveled between " + fromDates + " and " + toDates + ": <h1>" + numUsers + "</h1>");
                                        out.println("Total fare generated between " + fromDates + " and " + toDates + ": <h1>" + totalFare + "</h1>");
                                    } else {
                                        out.println("No data available for the selected date range.");
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
                <h6>Reports</h6>
                <form action="AdminReports.jsp" method="post">
                    <div class="dateselection">
                    <label for="rev_from">from :</label>
                    <input type="date" id="rev_from" name="rev_from" pattern="\d{4}-\d{2}-\d{2}" placeholder="YYYY-MM-DD" required>
                    <label for="rev_to">to :</label>
                    <input type="date" id="rev_to" name="rev_to" pattern="\d{4}-\d{2}-\d{2}" placeholder="YYYY-MM-DD" required>
                </div>
                    <input type="submit" value="Generate Report">
                </form><br>
                <table border="1">
                    <tbody>
                        <%
                        // Extracting dates from the form
                        String revfromDate = request.getParameter("rev_from");
                        String revtoDate = request.getParameter("rev_to");

                        try {
                            // Establish database connection
                            Class.forName("com.mysql.jdbc.Driver");
                           
                        
                            // Query to get the total fare generated between given dates from both tickets and transactions
                            String reportQuery = "SELECT SUM(fare) AS total_fare FROM (SELECT fare FROM tickets WHERE DATE(created_at) BETWEEN ? AND ? UNION ALL SELECT amount FROM transaction WHERE DATE(transaction_date) BETWEEN ? AND ?) AS combined_fares";
                            
                            // Prepare and execute the SQL statement
                            PreparedStatement reportPst = con.prepareStatement(reportQuery);
                            reportPst.setString(1, revfromDate);
                            reportPst.setString(2, revtoDate);
                            reportPst.setString(3, revfromDate);
                            reportPst.setString(4, revtoDate);
                            ResultSet reportResult = reportPst.executeQuery();
                            
                            // Display the result
                            if (reportResult.next()) {
                                double totalFare = reportResult.getDouble("total_fare");
                                out.println("Total fare generated between " + revfromDate + " and " + revtoDate + ": <h1> " + totalFare + "</h1>");
                            } else {
                                out.println("No data available for the selected date range.");
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
    
                <h6>Station Reports</h6>
                <form action="AdminReports.jsp" method="post">
                    <label for="Station_Report">Station To :</label>
                    <div class="plan-your-jrny-box-selection">
                        <select name="Station_Report" id="Station_Report">
                            <option value="0">-- Select Station --</option>
                            <option value="PCMC">PCMC</option>
                            <option value="Sant Tukaram Nagar">Sant Tukaram Nagar</option>
                            <option value="Bhosari">Bhosari</option>
                            <option value="Kasarwadi">Kasarwadi</option>
                            <option value="Phugewadi">Phugewadi</option>
                            <option value="Dapodi">Dapodi</option>
                            <option value="Bopodi">Bopodi</option>
                            <option value="Shivaji Nagar">Shivaji Nagar</option>
                            <option value="Civil Court">Civil Court</option>
                            <option value="Vanaz">Vanaz</option>
                            <option value="Anand Nagar">Anand Nagar</option>
                            <option value="Ideal Colony">Ideal Colony</option>
                            <option value="NalStop">Nal Stop</option>
                            <option value="GarwareCollege">Garware College</option>
                            <option value="Deccan Gymkhana">Deccan Gymkhana</option>
                            <option value="Chhatrapati Sambhaji Udyan">Chhatrapati Sambhaji Udyan</option>
                            <option value="PMC">PMC</option>
                            <option value="MangalwarPeth">Mangalwar Peth</option>
                            <option value="Pune Railway Station">Pune Railway Station</option>
                            <option value="Ruby Hall Clinic">Ruby Hall Clinic</option>
                        </select>
                    </div>
                    <div class="dateselection">
                        <label for="s_from">from :</label>
                        <input type="date" id="s_from" name="s_from" pattern="\d{4}-\d{2}-\d{2}" placeholder="YYYY-MM-DD" required><br>
                        <label for="s_to">to :</label>
                        <input type="date" id="s_to" name="s_to" pattern="\d{4}-\d{2}-\d{2}" placeholder="YYYY-MM-DD" required><br><br>
                    </div>
                    <input type="submit" value="Generate Report">
                </form>
                
                <table border="2">
                   
                    <tbody>

                        <%
                    // Extracting dates from the form
                    String rstation = request.getParameter("Station_Report");
                    String sfromDate = request.getParameter("s_from");
                    String stoDate = request.getParameter("s_to");

                    try {
                        // Establish database connection
                        Class.forName("com.mysql.jdbc.Driver");
                        
                    
                        // Query to get the number of users and total fare generated between given dates and station
                        String reportQuery = "SELECT COUNT(DISTINCT ticket_id) AS num_users, SUM(fare) AS total_fare FROM tickets WHERE DATE(created_at) BETWEEN ? AND ? AND source_station = ?";
                        
                        // Prepare and execute the SQL statement
                        PreparedStatement reportPst = con.prepareStatement(reportQuery);
                        reportPst.setString(1, sfromDate);
                        reportPst.setString(2, stoDate);
                        reportPst.setString(3, rstation);
                        ResultSet reportResult = reportPst.executeQuery();
                        
                        // Display the result
                        if (reportResult.next()) {
                            int numUsers = reportResult.getInt("num_users");
                            double totalFare = reportResult.getDouble("total_fare");
                            out.println("Number of users traveled between " + sfromDate + " and " + stoDate + " from station " + rstation + ": <h1> " + numUsers + "</h1>");
                            out.println("Total fare generated between " + sfromDate + " and " + stoDate + " from station " + rstation + ": <h1> " + totalFare + "</h1>");
                        } else {
                            out.println("No data available for the selected date range and station.");
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
                <h6>Reports</h6>
                    <form action="AdminReports.jsp" method="post">
                        <div class="dateselection">
                        <label for="from">from :</label>
                        <input type="date" id="from" name="from" pattern="\d{4}-\d{2}-\d{2}" placeholder="YYYY-MM-DD" required>
                        <label for="to">to :</label>
                        <input type="date" id="to" name="to" pattern="\d{4}-\d{2}-\d{2}" placeholder="YYYY-MM-DD" required>
                    </div>
                        <input type="submit" value="Generate Report">
                    </form><br>
                    <table border="1">
                        <tbody>
                            <%

                            // Extracting dates from the form
                            String fromDate = request.getParameter("from");
                            String toDate = request.getParameter("to");

                            try {
                                // Establish database connection
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection(url, user, pass);
                               
                            
                                // Query to get the number of users and total fare generated between given dates
                                String reportQuery = "SELECT COUNT(DISTINCT ticket_id) AS num_users, SUM(fare) AS total_fare FROM tickets WHERE DATE(created_at) BETWEEN ? AND ?";
                                
                                // Prepare and execute the SQL statement
                                PreparedStatement reportPst = con.prepareStatement(reportQuery);
                                reportPst.setString(1, fromDate);
                                reportPst.setString(2, toDate);
                                ResultSet reportResult = reportPst.executeQuery();
                            
                                // Display the result
                                if (reportResult.next()) {
                                    int numUsers = reportResult.getInt("num_users");
                                    double totalFare = reportResult.getDouble("total_fare");
                                    out.println("Number of users traveled between " + fromDate + " and " + toDate + ": <h1> " + numUsers + "</h1>");
                                    out.println("Total fare generated between " + fromDate + " and " + toDate + ": <h1> " + totalFare + "</h1>");
                                } else {
                                    out.println("No data available for the selected date range.");
                                }
                            } catch(Exception e) {
                                out.println("Error: " + e.getMessage());
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