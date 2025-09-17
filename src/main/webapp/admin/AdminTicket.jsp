<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>

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
    <title>Pune Metro- Admin Ticket</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/styles.css">
    <link rel="stylesheet" href="adminTicket.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="icon" type="images/jpg" href="https://www.punemetrorail.org/assets/images/logo.png">
    <link href="https://fonts.googleapis.com/css2?family=Ubuntu:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap" rel="stylesheet">

</head>
<body class="ubuntu-medium">
    <%@ include file="AdminHeader.jsp" %>
    <%
    String fareResult = "";
    String datetime = "";
    String source = request.getParameter("source");
    String destination = request.getParameter("destination");
    if (source != null && destination != null && !source.isEmpty() && !destination.isEmpty()) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            // Database connection details
            String url = "jdbc:mysql://localhost:3306/pune_metro";
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, "root", "password");

            // SQL query to fetch the fare
            String sql = "SELECT fare FROM Fare_table WHERE source_station = ? AND destination_station = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, source);
            pstmt.setString(2, destination);

            rs = pstmt.executeQuery();
            if (rs.next()) {
                fareResult = rs.getString("fare");

                // Insert selected values into the ticket table
                String insertSql = "INSERT INTO tickets (source_station, destination_station, fare) VALUES (?, ?, ?)";
                pstmt = conn.prepareStatement(insertSql);
                pstmt.setString(1, source);
                pstmt.setString(2, destination);
                pstmt.setString(3, fareResult);
                pstmt.executeUpdate(); // Execute the insertion query

                pstmt = conn.prepareStatement("SELECT created_at FROM tickets WHERE source_station = ? AND destination_station = ? AND fare = ? ORDER BY created_at DESC LIMIT 1");
                pstmt.setString(1, source);
                pstmt.setString(2, destination);
                pstmt.setString(3, fareResult);
                rs = pstmt.executeQuery();
                if (rs.next()) {
                    datetime = rs.getString("created_at");
                }
            } else {
                fareResult = "No fare information available.";
            }
        } catch (Exception e) {
            fareResult = "Database connection or query error: " + e.getMessage();
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) {}
            try { if (pstmt != null) pstmt.close(); } catch (Exception e) {}
            try { if (conn != null) conn.close(); } catch (Exception e) {}
        }
    }
%>


    <div id="farecalculatorheading">
        <h2 class="line">Fare Calculator</h2>
    </div>
    <div class="fare-calculator-box">
        <div class="fare-calculator-box1">
            <form method="post">
                <div class="fare-calculator-box-selection">
                    <label for="" class="plan-your-jrny-box-label">From</label>
                    <select name="source" id="source">
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
                        <option value="Garware College">Garware College</option>
                        <option value="Deccan Gymkhana">Deccan Gymkhana</option>
                        <option value="Chhatrapati Sambhaji Udyan">Chhatrapati Sambhaji Udyan</option>
                        <option value="PMC">PMC</option>
                        <option value="Mangalwar Peth">Mangalwar Peth</option>
                        <option value="Pune Railway Station">Pune Railway Station</option>
                        <option value="Ruby Hall Clinic">Ruby Hall Clinic</option>
                        <option value="Bund Garden">Bund Garden</option>
                        <option value="Kalyani Nagar">Kalyani Nagar</option>
                        <option value="Ramwadi">Ramwadi</option>

                    </select>
                    <label for="" class="plan-your-jrny-box-label">To</label>
                    <select name="destination" id="destination">
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
                        <option value="Garware College">Garware College</option>
                        <option value="Deccan Gymkhana">Deccan Gymkhana</option>
                        <option value="Chhatrapati Sambhaji Udyan">Chhatrapati Sambhaji Udyan</option>
                        <option value="PMC">PMC</option>
                        <option value="Mangalwar Peth">Mangalwar Peth</option>
                        <option value="Pune Railway Station">Pune Railway Station</option>
                        <option value="Ruby Hall Clinic">Ruby Hall Clinic</option>
                        <option value="Bund Garden">Bund Garden</option>
                        <option value="Kalyani Nagar">Kalyani Nagar</option>
                        <option value="Ramwadi">Ramwadi</option>
                    </select>
                    <input type="submit" value="Generate Ticket">
                    
                </div>
            </form>
            
            
            <div class="source-destination">
                <div style="width: 600px;">
                    <label for="" class="s-d" id="fromlabel">From :</label><span id="selectedSource" class="s-d"><%= source %></span> 
                    <label for="" class="s-d" id="tolabel">To :</label> <span id="selectedSource" class="s-d"><%= destination %></span> 
                </div>
                <div class="totalfare">
                    <img src="https://www.punemetrorail.org/assets/images/ticket_fare.svg" class="fareimg">
                    <label for="" id="fare">Total fare:</label>
                    <i class="fa-solid fa-indian-rupee-sign" style="color: #ca5ca6; margin-top: 24px; size: 20px;"></i> 
                    <span id="fareResult"><%= fareResult %></span>
                </div>
            </div>
           
        
        </div>
    </div>

   <center>
   <div class="container" >
    <div id="ticketInterface" >
        <div class="ticketbox">
            <h3><strong>Pune Metro</strong></h3>
            <p><strong>Date & Time:</strong> <span id="ticketDateTime"><%= datetime %></span></p>
            <p><strong>From:</strong> <span id="ticketSource"><%= source %></span></p>
            <p><strong>To:</strong> <span id="ticketDestination"><%= destination %></span></p>
            <p><strong>Total Fare:</strong> <span id="ticketFare"><%= fareResult %></span> <span id="ticketCurrency">&#8377;</span></p>
            <img src="" id="qrCodeImage">
        </div>
        
    </div>
    <div class="pbutton" style="padding:10px;">
        <button id="printButton" onclick="printTicket()" >Print Ticket</button>
    </div>
</div>
   
   </center> 
       
<script>
    var img=document.getElementById('qrCodeImage');
    var source='Source : <%= source %>';
    var destination='Destination :<%= destination %>';
    var fare='Fare : <%= fareResult %>';
    var dateTime ='Date_Time : <%= datetime %>';
    img.src="https://api.qrserver.com/v1/create-qr-code/?size=150x150&data="+(source)+(destination)+(fare)+(dateTime);
    
</script>
    
<script>

    function printTicket() {
        var printContents = document.getElementById("ticketInterface").innerHTML;
        var originalContents = document.body.innerHTML;
        document.body.innerHTML = printContents;
        window.print();
        document.body.innerHTML = originalContents;
    }
</script>
<script src="index.js"></script> 
<%@ include file="AdminFooter.jsp" %>

</body>
</html>

<%
    } else {
        // If user is not logged in, redirect to login page
        response.sendRedirect("AdminLogin.jsp");
    }
%>
