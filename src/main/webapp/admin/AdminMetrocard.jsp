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
    <title>Admin FoundLost</title>
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
            <button class="tab-links active-link active-button" onclick="openTab(this,'Ritem')">Recharge Card</button>
            <button class="tab-links" onclick="openTab(this,'LItems')">Metrocard Users</button>
            <button class="tab-links" onclick="openTab(this,'FItems')">Search User</button>
            <button class="tab-links" onclick="openTab(this,'Retditems')">Metro card Reports</button>
        </div>
        <hr>
        <div class="tab-contents" id="LItems">
            <div class="box">
                <h6>Metrocard Users</h6>
                <table border="2">
                    <thead>
                        <tr>
                            <th>C_ID</th>
                            <th>Name</th>
                            <th>Mobile No.</th>
                            <th>Email</th>
                            <th>Address</th>
                            <th>Card Number</th>
                            <th>age</th>
                            <th>R_Date</th>
                            <th>Valid till</th>
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
                            String query = "SELECT * FROM registration";
                            ResultSet rs = stmt.executeQuery(query);
                            
                            while(rs.next()) {
                                out.println("<tr><td>" + rs.getString("id")+ "</td><td>" + rs.getString("name")+ "</td><td>" + rs.getString("phone") + "</td><td>" + rs.getString("email") + "</td><td>" + rs.getString("address") + "</td><td>" + rs.getString("cardno") + "</td><td>" + rs.getString("age") +"</td><td>" + rs.getString("created_at") + "</td><td>" + rs.getString("expdate") +"</td></tr>");
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
                    <form action="AdminMetrocard.jsp" method="post">
                        <div class="dateselection">
                        <label for="from">from :</label>
                        <input type="date" id="from" name="from" pattern="\d{4}-\d{2}-\d{2}" placeholder="YYYY-MM-DD" required>
                        <label for="to">to :</label>
                        <input type="date" id="to" name="to" pattern="\d{4}-\d{2}-\d{2}" placeholder="YYYY-MM-DD" required>
                    </div>
                        <input type="submit" value="Generate Report">
                    </form>
                    <% 
        String from = request.getParameter("from");
        String to = request.getParameter("to");
        
        if (from != null && to != null) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection(url, user, pass);
                
                // Count new users
                String newUserQuery = "SELECT COUNT(*) AS newUserCount FROM registration WHERE created_at BETWEEN ? AND ?";
                PreparedStatement newUserStmt = con.prepareStatement(newUserQuery);
                newUserStmt.setString(1, from);
                newUserStmt.setString(2, to);
                ResultSet newUserRs = newUserStmt.executeQuery();
                if(newUserRs.next()) {
                    out.println("<p>Total Number of Users: " + newUserRs.getInt("newUserCount") + "</p>");
                }

                // Sum of balances
                String balanceQuery = "SELECT SUM(balance) AS totalBalance FROM registration WHERE created_at BETWEEN ? AND ?";
                PreparedStatement balanceStmt = con.prepareStatement(balanceQuery);
                balanceStmt.setString(1, from);
                balanceStmt.setString(2, to);
                ResultSet balanceRs = balanceStmt.executeQuery();
                if(balanceRs.next()) {
                    out.println("<p>Total Amount Generated : " + balanceRs.getDouble("totalBalance") + "</p>");
                }

                // Count of offline transactions
                String offlineTransQuery = "SELECT COUNT(*) AS offlineCount FROM transaction WHERE t_mode='offline' AND date BETWEEN ? AND ?";
                PreparedStatement offlineStmt = con.prepareStatement(offlineTransQuery);
                offlineStmt.setString(1, from);
                offlineStmt.setString(2, to);
                ResultSet offlineRs = offlineStmt.executeQuery();
                if(offlineRs.next()) {
                    out.println("<p>Offline Transactions: " + offlineRs.getInt("offlineCount") + "</p>");
                }

                // Count of online transactions
                String onlineTransQuery = "SELECT COUNT(*) AS onlineCount FROM transaction WHERE t_mode='online' AND date BETWEEN ? AND ?";
                PreparedStatement onlineStmt = con.prepareStatement(onlineTransQuery);
                onlineStmt.setString(1, from);
                onlineStmt.setString(2, to);
                ResultSet onlineRs = onlineStmt.executeQuery();
                if(onlineRs.next()) {
                    out.println("<p>Online Transactions: " + onlineRs.getInt("onlineCount") + "</p>");
                }


                // Additional queries for transactions can be added here following the same pattern

            } catch(Exception e) {
                out.println("Error: " + e.getMessage());
            }
        }
    %>
            </div>
        </div>

        <div class="tab-contents" id="FItems">
            <div class="box"> 
    
                <h6>Search User here</h6>
                <form action="AdminMetrocard.jsp" method="post">
                    <label for="c_no">Enter Card Number :</label>
                    <input type="text" id="c_no" name="c_no" required><br><br>
                    <input type="submit" value="Search">
                </form>
                
                <table border="2">
                    <thead>
                        <tr>
                            <th>U_ID</th>
                            <th>Name</th>
                            <th>Mobile No.</th>
                            <th>Email</th>
                            <th>Address</th>
                            <th>Card Number</th>
                            <th>Age</th>
                            <th>Valid till</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                       
                
                        // Retrieve card number from the form
                        String cardNumber = request.getParameter("c_no");
                
                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection(url, user, pass);
                            String query = "SELECT * FROM registration WHERE cardno=?";
                            
                            // Use prepared statement to avoid SQL injection
                            PreparedStatement pstmt = con.prepareStatement(query);
                            pstmt.setString(1, cardNumber);
                            
                            ResultSet rs = pstmt.executeQuery();
                
                            while(rs.next()) {
                                out.println("<tr><td>" + rs.getString("id") + "</td><td>" + rs.getString("name") + "</td><td>" + rs.getString("phone") + "</td><td>" + rs.getString("email") + "</td><td>" + rs.getString("address") + "</td><td>" + rs.getString("cardno") + "</td><td>" + rs.getString("age") + "</td><td>" + rs.getString("expdate") +"</td></tr>");
                            }
                
                            con.close();
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
                <form action="AdminMetrocard.jsp" method="post">
                    <h1>Recharge Card</h1>
                    <label for="item">Enter Card Number :</label>
                    <input type="text" id="id" name="c_no" required><br>
                    
                    <label for="item">Amount :</label>
                    <input type="text" id="mobile" name="amount" required><br>

                    <label for="item">Transaction Mode :</label>
                    <div class="plan-your-jrny-box-selection">
                        <select name="t_mode" id="t_mode">
                            <option value="0">-- Select Mode --</option>
                            <option value="online">ONLINE</option>
                            <option value="offline">OFFLINE</option>
                            
                        </select>
                    </div><br>
                    
                        <input type="submit" value="Add Balance">
                    </form><br>
                    <table border="1">
                        <tbody>
                            <%
                            String c_no = request.getParameter("c_no");
                            String amount = request.getParameter("amount");
                            String t_mode = request.getParameter("t_mode");
                            if (c_no != null && !c_no.isEmpty() && amount != null && !amount.isEmpty() && t_mode != null && !t_mode.isEmpty()) {
                                try {
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection con = DriverManager.getConnection(url, user, pass);
                                                            
                                    // Update balance for the metro card
                                    String updateQuery = "UPDATE registration SET balance = ? WHERE cardno = ?";
                                    PreparedStatement updatePst = con.prepareStatement(updateQuery);
                                    updatePst.setString(1, amount); // Set the amount to add to the balance
                                    updatePst.setString(2, c_no); // Set the metro card number
                                    int rowsUpdated = updatePst.executeUpdate(); // Execute the update query

                                    PreparedStatement updateexpp = con.prepareStatement("UPDATE registration SET expdate = DATE_ADD(NOW(), INTERVAL 1 MONTH) WHERE cardno = ?;");
                                    updateexpp.setString(1, c_no);
                                    int r = updateexpp.executeUpdate(); 

                                    PreparedStatement updateexp = con.prepareStatement("UPDATE metrocard SET expiry_date = DATE_ADD(NOW(), INTERVAL 1 MONTH) WHERE cardno = ?;");
                                    updateexp.setString(1, c_no);
                                    int q = updateexp.executeUpdate(); 

                                    String transactionQuery = "INSERT INTO transaction (cardno, amount, t_mode) VALUES (?, ?, ?)";
                                        PreparedStatement transactionPst = con.prepareStatement(transactionQuery);
                                        transactionPst.setString(1, c_no); // Set the metro card number
                                        transactionPst.setString(2, amount); // Set the recharge amount
                                        transactionPst.setString(3, t_mode); // Set the transaction mode
                                        int rowsInserted = transactionPst.executeUpdate(); // Execute the insert query
                                        
                                        // Close resources
                                        transactionPst.close();
                                                            
                                    if (rowsUpdated > 0) {
                                        out.println("Balance added successfully to card number " + c_no);
                                        
                                    } else {
                                        out.println("Failed to add balance. Metro card number not found.");
                                    }
                                                            
                                    // Close resources
                                    updatePst.close();
                                    con.close();
                                } catch (ClassNotFoundException | SQLException e) {
                                    out.println("Error: " + e.getMessage());
                                }
                            } else {
                                out.println("Please fill in all the required fields.");
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