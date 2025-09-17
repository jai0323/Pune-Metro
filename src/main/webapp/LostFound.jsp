<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <title>Pune Metro-Lost & Found</title>
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
            background:#ea47b4;
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
    <%@ include file="header.jsp" %>
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
            <button class="tab-links active-link active-button" onclick="openTab(this,'Sitem')">Search Item</button>
            <button class="tab-links" onclick="openTab(this,'Lost')">Lost</button>
            <button class="tab-links" onclick="openTab(this,'Found')">Found</button>
            <button class="tab-links" onclick="openTab(this,'FItems')">Found Items</button>
        </div>
        <hr>
        <div class="tab-contents" id="Lost">
            <div class="box">
                <form action="submitLost.jsp" method="post">
                    <h6>Report your Lost Item</h6>
                    <label for="item">Name  :</label>
                    <input type="text" id="name" name="name" required><br>
                    <label for="item">Email Id :</label>
                    <input type="text" id="email" name="email" required><br>
                    <label for="item">Contact Number :</label>
                    <input type="text" id="mobile" name="mobile" required><br>
                    <label for="item">Item :</label>
                    <div class="plan-your-jrny-box-selection">
                        <select name="item" id="item">
                            <option value="0">-- Select Item --</option>
                            <option value="Mobile">Mobile</option>
                            <option value="Watch">Watch</option>
                            <option value="Jawellery">Jawellery</option>
                            <option value="Laptop Bag">Laptop Bag</option>
                            <option value="BackPack">BackPack</option>
                            <option value="Briefcase">Briefcase</option>
                            <option value="Camera Bag">camera Bag</option>
                            <option value="Wallet">Wallet</option>
                            <option value="Ladies Purse">Ladies Purse</option>
                            <option value="Rolling Suitcases">Rolling Suitcase</option>
                        </select>
                    </div>
                    <label for="description">ItemDescription:</label>
                    <textarea id="description" name="description" rows="4" required></textarea><br>
                    <label for="contact">Your Address / Contact Datails :</label>
                    <textarea id="contact" name="contact" rows="2" required></textarea><br>
                    <label for="item">Station Name :</label>
                    <div class="plan-your-jrny-box-selection">
                        <select name="S_name" id="S_name">
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
                    </div><br>
                    <p>
                        Lost and Found Terms and Conditions*<br>
                        <b>1. Submission of Lost Items:</b> Individuals who have lost items within the metro premises are encouraged to report the lost item to the Lost and Found department as soon as possible. Lost items can be reported in person at our designated Lost and Found center or through our online Lost Item Report form available on the website.<br><br>
                        <b>2. Proof of Ownership:</b> In order to claim a lost item, the individual must provide sufficient proof of ownership. This may include but is not limited to original purchase receipts, serial numbers, distinctive markings, or any other identifying information that establishes ownership.<br><br>
                        <b>3. Verification Process:</b> Upon submission of a lost item report, the Lost and Found department will conduct a verification process to confirm ownership of the reported item. This may involve contacting the individual for further information or documentation if necessary.<br><br>
                        <b>4. Claiming Lost Items:</b> Once ownership of the lost item is verified, the rightful owner will be notified via the contact information provided in the lost item report. The owner must then visit the Lost and Found center in person to claim the item. If the owner is unable to claim the item personally, they may authorize a representative to do so on their behalf. The representative must provide a letter of authorization along with valid identification.<br><br>
                        <b>5. Retention Period:</b> Lost items will be kept in the Lost and Found center for a period of [insert duration, e.g., 90 days] from the date of submission of the lost item report. After this period, unclaimed items may be disposed of, donated to charity, or otherwise dealt with at the discretion of the metro authority.<br><br>
                        <b>6. Dispute Resolution:</b> In the event of a dispute over the ownership of a lost item, the metro authority reserves the right to request additional evidence or documentation to resolve the dispute. The decision of the metro authority regarding the ownership of the lost item shall be final.<br><br>
                        <b>7. Limitation of Liability:</b> The metro authority shall not be held liable for any lost items that are not reclaimed within the specified retention period. Additionally, the metro authority shall not be liable for any damages or losses arising from the use of the Lost and Found service.<br><br>
                        <b>8. Changes to Terms and Conditions:</b> The metro authority reserves the right to modify or update these terms and conditions at any time without prior notice. It is the responsibility of the individual to review the terms and conditions periodically for any changes.<br><br>
        
                        By submitting a lost item report, the individual acknowledges and agrees to abide by these terms and conditions.
                    </p>
                    <input type="submit" value="Submit">
                </form>
            </div>
        </div>
    </main>
        <div class="tab-contents" id="Found">
            <div class="box">
                <form action="submitFound.jsp" method="post">
                    <h6>Report Found Item</h6>
                    <label for="item">Name  :</label>
                    <input type="text" id="name" name="name" required><br>
                    <label for="item">Contact Number :</label>
                    <input type="text" id="mobile" name="mobile" required><br>
                    <label for="item">Item :</label>
                    <div class="plan-your-jrny-box-selection">
                        <select name="item" id="item">
                            <option value="0">-- Select Item --</option>
                            <option value="Mobile">Mobile</option>
                            <option value="Watch">Watch</option>
                            <option value="Jawellery">Jawellery</option>
                            <option value="Laptop Bag">Laptop Bag</option>
                            <option value="BackPack">BackPack</option>
                            <option value="Briefcase">Briefcase</option>
                            <option value="Camera Bag">camera Bag</option>
                            <option value="Wallet">Wallet</option>
                            <option value="Ladies Purse">Ladies Purse</option>
                            <option value="Rolling Suitcases">Rolling Suitcase</option>
                        </select>
                    </div>
                    <label for="description">Item Description:</label>
                    <textarea id="description" name="description" rows="4" required></textarea><br>
                    <label for="item">Station Name :</label>
                    <div class="plan-your-jrny-box-selection">
                        <select name="S_name" id="S_name">
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
                            <option value="Nal Stop">Nal Stop</option>
                            <option value="Garware College">Garware College</option>
                            <option value="Deccan Gymkhana">Deccan Gymkhana</option>
                            <option value="Chhatrapati Sambhaji Udyan">Chhatrapati Sambhaji Udyan</option>
                            <option value="PMC">PMC</option>
                            <option value="Mangalwar Peth">MangalwarPeth</option>
                            <option value="Pune Railway Station">PuneRailwayStation</option>
                            <option value="Ruby Hall Clinic">RubyHallClinic</option>
                            <option value="Bund Garden">Bund Garden</option>
                            <option value="Kalyani Nagar">Kalyani Nagar</option>
                            <option value="Ramwadi">Ramwadi</option>

                        </select><br>
                    </div>
                    <input type="submit" value="Submit">
                </form>
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
                        String url = "jdbc:mysql://localhost:3306/pune_metro";
                        String user = "root";
                        String pass = "password";
            
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
        
        <div class="tab-contents active-tab" id="Sitem">
            <div class="box">
                <form action="LostFound.jsp" method="post">
                    <h6>Search Your Lost Item here</h6> 
                        <label for="item">Item :</label>
                            <div class="plan-your-jrny-box-selection">
                                <select name="item" id="item">
                                    <option value="0">-- Select Item --</option>
                                    <option value="Mobile">Mobile</option>
                                    <option value="Watch">Watch</option>
                                    <option value="Jawellery">Jawellery</option>
                                    <option value="Laptop Bag">Laptop Bag</option>
                                    <option value="BackPack">BackPack</option>
                                    <option value="Briefcase">Briefcase</option>
                                    <option value="Camera Bag">camera Bag</option>
                                    <option value="Wallet">Wallet</option>
                                    <option value="Ladies Purse">Ladies Purse</option>
                                    <option value="Rolling Suitcases">Rolling Suitcase</option>
                                </select>
                            </div>
                        <label for="item">Station Name :</label>
                            <div class="plan-your-jrny-box-selection">
                                <select name="S_name" id="S_name">
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
                            </div>
                    <input type="submit" value="Search">
                </form><br>
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
                    String items = request.getParameter("item");
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection(url, user, pass);
                        
                        // Prepare a statement with a placeholder
                        String query = "SELECT * FROM founditems WHERE item = ?";
                        PreparedStatement pst = con.prepareStatement(query);
                        pst.setString(1, items); // Set the value for the placeholder
                        
                        ResultSet rs = pst.executeQuery(); // Execute the query
                        
                        while(rs.next()) {
                            // Retrieve and display data from the result set
                            out.println("<tr><td>" + rs.getString("id") + "</td><td>" + rs.getString("item") + "</td><td>" + rs.getString("description") + "</td><td>" + rs.getString("stationName") + "</td><td>" + rs.getString("created_at") + "</td></tr>");
                        }
                        
                        // Close resources
                        rs.close();
                        pst.close();
                        con.close();
                    } catch(Exception e) {
                        out.println("Error: " + e.getMessage());
                    }
                    
                    %>
                </tbody>
            </table>
        </div>
        </div>
        <br>
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
        
        <script src="index.js"></script> 
</body>
<%@ include file="footer.jsp" %>
</html>