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
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="adminTicket.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="icon" type="images/jpg" href="https://www.punemetrorail.org/assets/images/logo.png">
    <link href="https://fonts.googleapis.com/css2?family=Ubuntu:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap" rel="stylesheet">

</head>
<body class="ubuntu-medium">
    <%@ include file="AdminHeader.jsp" %>

    <div id="farecalculatorheading">
        <h2 class="line">Fare Calculator</h2>
    </div>
    <div class="fare-calculator-box">
        <div class="fare-calculator-box1">
            <div class="fare-calculator-box-selection">
                <!-- Your fare calculator form content here -->
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
                <input type="submit" value="Know Your Fare" onclick="calculateFare()">
            
            </div>
            <div class="source-destination">
                <!-- Your source and destination content here -->
                <div style="width: 600px;">
                    <label for="" class="s-d" id="fromlabel">From :</label> <span id="selectedSource" class="s-d"></span>
                    <label for="" class="s-d" id="tolabel">To :</label> <span id="selectedDestination" class="s-d"></span>
                </div>
                <div class="totalfare">
                    <img src="https://www.punemetrorail.org/assets/images/ticket_fare.svg" class="fareimg">
                    <label for="" id="fare">Total fare:</label>
                    <i class="fa-solid fa-indian-rupee-sign" style="color: #ca5ca6; margin-top: 24px; size: 20px;"></i> <span id="fareResult"></span><span id="rs" style="margin-left: 5px;"></span>
                </div>
            </div>
            <input type="submit" value="Generate Ticket" id="generateTicketButton" style="display: none;" onclick="generateTicket()">
        </div>
    </div>

   <div class="container">
    <div id="ticketInterface" style="display: none;">
        <div class="ticketbox">
            <h3><strong>Pune Metro</strong></h3>
            <p><strong>Date & Time:</strong> <span id="ticketDateTime"></span></p>
            <p><strong>From:</strong> <span id="ticketSource"></span></p>
            <p><strong>To:</strong> <span id="ticketDestination"></span></p>
            <p><strong>Total Fare:</strong> <span id="ticketFare"></span> <span id="ticketCurrency">&#8377;</span></p>
            <div id="qrCode"></div>   
        </div>
        <div class="pbutton">
            <button id="printButton" onclick="printTicket()">Print Ticket</button>
        </div>
    </div>
</div>
    
    
    
<script>
    function calculateFare() {
        var source = document.getElementById('source');
        var destination = document.getElementById('destination');

        let srcindex = source.selectedIndex;
        let destindex = destination.selectedIndex;

        var srcoption = source.options[source.selectedIndex];
        var srcvalue = srcoption.textContent;

        var destoption = destination.options[destination.selectedIndex];
        var destvalue = destoption.textContent;

        document.getElementById('selectedSource').innerText = srcvalue;
        document.getElementById('selectedDestination').innerText = destvalue;

        if (srcindex == destindex) {
            document.getElementById('fareResult').innerText = '0';
            document.getElementById("generateTicketButton").style.display = "none"; // Hide the Generate Ticket button if source and destination are the same
        } else {
            let diff = Math.abs(srcindex - destindex);
            let fare = 5 * diff;

            if (fare <= 10) {
                document.getElementById('fareResult').innerText = '10Rs';
            } else if (fare >= 35) {
                document.getElementById('fareResult').innerText = '35Rs';
            } else {
                document.getElementById('fareResult').innerText = fare + 'Rs';
            }
            // Show the Generate Ticket button after calculating fare
            document.getElementById("generateTicketButton").style.display = "block";
        }
    }

    function generateTicket() {
        var source = document.getElementById("source").options[document.getElementById("source").selectedIndex].text;
        var destination = document.getElementById("destination").options[document.getElementById("destination").selectedIndex].text;
        var fare = document.getElementById("fareResult").innerText;
        var currentDateTime = new Date().toLocaleString();

        // Send ticket data to the server using AJAX
        var xhr = new XMLHttpRequest();
        var url = "SaveTicket.jsp"; // Change this to your server-side script URL
        var data = JSON.stringify({
            source: source,
            destination: destination,
            fare: fare,
            datetime: currentDateTime
        });
        
        xhr.open("POST", url, true);
        xhr.setRequestHeader("Content-Type", "application/json");
        
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                // Response from the server
                console.log(xhr.responseText);
                // Proceed with other actions (if needed)
            }
        };
        
        xhr.send(data);

        // Update ticket interface
        document.getElementById("ticketDateTime").innerText = currentDateTime;
        document.getElementById("ticketSource").innerText = source;
        document.getElementById("ticketDestination").innerText = destination;
        document.getElementById("ticketFare").innerText = fare;
        // Generate QR code (dummy)
        var qrCodeDiv = document.getElementById("qrCode");
        qrCodeDiv.innerHTML = '<img src="https://api.qrserver.com/v1/create-qr-code/?data=' + source + destination + fare + '&size=100x100">';
        // Show the ticket interface
        document.getElementById("ticketInterface").style.display = "block";
        // Hide the Generate Ticket button
        document.getElementById("generateTicketButton").style.display = "none";        
    }

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
        response.sendRedirect("Login.jsp");
    }
%>

