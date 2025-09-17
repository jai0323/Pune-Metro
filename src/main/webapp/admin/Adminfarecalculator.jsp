<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>

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
    <title>Fare Calculator</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="farecalculator.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="icon" type="images/jpg" href="https://www.punemetrorail.org/assets/images/logo.png">

    <link href="https://fonts.googleapis.com/css2?family=Ubuntu:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap" rel="stylesheet">
</head>
<%
    String fareResult = "";
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
            conn = DriverManager.getConnection(url, "root", "");

            // SQL query to fetch the fare
            String sql = "SELECT fare FROM Fare_table WHERE source_station = ? AND destination_station = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, source);
            pstmt.setString(2, destination);

            rs = pstmt.executeQuery();
            if (rs.next()) {
                fareResult = rs.getString("fare");
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


<body class="ubuntu-medium">
    <%@ include file="AdminHeader.jsp" %>
    <div id="farecalculatorheading">
        <h2>Fare Calculator</h2>
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
                    <option value="GarwareCollege">Garware College</option>
                    <option value="Deccan Gymkhana">Deccan Gymkhana</option>
                    <option value="Chhatrapati Sambhaji Udyan">Chhatrapati Sambhaji Udyan</option>
                    <option value="PMC">PMC</option>
                    <option value="MangalwarPeth">Mangalwar Peth</option>
                    <option value="Pune Railway Station">Pune Railway Station</option>
                    <option value="Ruby Hall Clinic">Ruby Hall Clinic</option>
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
                    <option value="GarwareCollege">Garware College</option>
                    <option value="Deccan Gymkhana">Deccan Gymkhana</option>
                    <option value="Chhatrapati Sambhaji Udyan">Chhatrapati Sambhaji Udyan</option>
                    <option value="PMC">PMC</option>
                    <option value="MangalwarPeth">Mangalwar Peth</option>
                    <option value="Pune Railway Station">Pune Railway Station</option>
                    <option value="Ruby Hall Clinic">Ruby Hall Clinic</option>
                </select>
                <input type="submit" value="Know Your Fare">
                
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
                <span id="fareResult"><%= fareResult %>
            </div>
        </div>
            
        </div>
    </div>
    <div class="timetableimg">
        <button onclick="englishbutton()" id="englishbutton">English</button>
        <button onclick="marathibutton()" id="marathibutton">&#2350;&#2352;&#2366;&#2336;&#2368;</button>
    </div>
    <div>
        <hr>
        <img src="https://www.punemetrorail.org/assets/images/fare_chart_english.jpg" alt="" id="fareimg">
    </div>
   
    <script src="index.js"></script>
    <script>
        english = document.getElementById('englishbutton');
        english.style.backgroundColor = '#55528D';
        english.style.color ='white';
        marathi = document.getElementById('marathibutton');
        marathi.style.backgroundColor='white';
    
    var img = document.getElementById('fareimg');
    function englishbutton()
    {
        english = document.getElementById('englishbutton');
        marathi = document.getElementById('marathibutton');
    
        english.style.backgroundColor = '#55528D';
        english.style.color='white'
        marathi.style.backgroundColor = 'white';
        marathi.style.color='black';
    
        img.src='images/pune_metro_timetable.jpg';
        
    }
    function marathibutton()
    {
        marathi = document.getElementById('marathibutton');
        english = document.getElementById('englishbutton');
    
        english.style.backgroundColor = 'white';
        english.style.color='black'
        marathi.style.backgroundColor = '#55528D';
        marathi.style.color='white'
    
    
        img.src='images/pune_metro_timetable(m).jpg';
    }
      
    </script>    

</body>
<%@ include file="AdminFooter.jsp" %>

</html>
<%
    } else {
        // If user is not logged in, redirect to login page
        response.sendRedirect("AdminLogin.jsp");
    }
%>