<%@ page import="java.util.*" language="java" %> 

<!DOCTYPE html> 

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

<body class="ubuntu-medium">
    <%@ include file="header.jsp" %>

    <div id="farecalculatorheading">
        <h2>Fare Calculator</h2>
    </div>
    <div class="fare-calculator-box">
        <div class="fare-calculator-box1">
            
            <div class="fare-calculator-box-selection">
                <label for="" class="plan-your-jrny-box-label" id="fromlabelque">From</label>
                <select name="" id="source">
                    <option value="0">-- Select Station --</option>
                    <option value="1">PCMC</option>
                    <option value="2">Sant Tukaram Nagar</option>
                    <option value="3">Bhosari</option>
                    <option value="4">Kasarwadi</option>
                    <option value="5">Phugewadi</option>
                    <option value="6">Dapodi</option>
                    <option value="7">Bopodi</option>
                    <option value="11">Shivaji Nagar</option>
                    <option value="12">Civil Court</option>
                    <option value="17">Vanaz</option>
                    <option value="18">Anand Nagar</option>
                    <option value="19">Ideal Colony</option>
                    <option value="20">Nal Stop</option>
                    <option value="21">Garware College</option>
                    <option value="22">Deccan Gymkhana</option>
                    <option value="23">Chhatrapati Sambhaji Udyan</option>
                    <option value="24">PMC</option>
                    <option value="25">Mangalwar Peth</option>
                    <option value="26">Pune Railway Station</option>
                    <option value="27">Ruby Hall Clinic</option>
                </select>
                <label for="" class="plan-your-jrny-box-label" id="tolabelque">To</label>
                <select name="" id="destination">
                    <option value="0">-- Select Station --</option>
                    <option value="1">PCMC</option>
                    <option value="2">Sant Tukaram Nagar</option>
                    <option value="3">Bhosari</option>
                    <option value="4">Kasarwadi</option>
                    <option value="5">Phugewadi</option>
                    <option value="6">Dapodi</option>
                    <option value="7">Bopodi</option>
                    <option value="11">Shivaji Nagar</option>
                    <option value="12">Civil Court</option>
                    <option value="17">Vanaz</option>
                    <option value="18">Anand Nagar</option>
                    <option value="19">Ideal Colony</option>
                    <option value="20">Nal Stop</option>
                    <option value="21">Garware College</option>
                    <option value="22">Deccan Gymkhana</option>
                    <option value="23">Chhatrapati Sambhaji Udyan</option>
                    <option value="24">PMC</option>
                    <option value="25">Mangalwar Peth</option>
                    <option value="26">Pune Railway Station</option>
                    <option value="27">Ruby Hall Clinic</option>
                </select>
                <input type="submit" value="Know Your Fare" onclick="calculateFare()" id="submitbutton">
                
            </div>
            <div class="source-destination">
                <div style="width: 600px; display:flex; gap:30px">
                    <label for="" class="s-d" id="fromlabelres">From :</label> <span id="selectedSource" class="s-d"></span>
                    <label for="" class="s-d" id="tolabelres">To :</label> <span id="selectedDestination" class="s-d"></span>
                
                </div>
                <div>
	                <div class="totalfare">
	                    <img src="https://www.punemetrorail.org/assets/images/ticket_fare.svg" class="fareimg">
	                    <label for="" id="fare">Total fare:</label>
	                    <i class="fa-solid fa-indian-rupee-sign" style="color: #ca5ca6; margin-top: 24px; size: 20px;">
	                    </i> <span id="fareResult"></span><span id="rs" style="margin-left: 5px;"></span>
	
	                </div>
	                
					<!-- Book Ticket Button -->
					<div style="margin-top:20px; margin-left:100px;">
					    <form action="CreateOrderServlet" method="post">
						    <input type="hidden" name="amount" id="amountField">
						    <input type="hidden" name="name" value="Metro User">
						    <input type="hidden" name="email" value="testuser@gmail.com">
						    <input type="hidden" name="phone" value="9999999999">
						    <button type="submit" style="padding:10px 20px; background:#55528D; color:white; border:none; border-radius:5px;">
						        Book Ticket
						    </button>
						</form>
					</div>
                </div>
            </div>
            
        </div>
    </div>
    <div class="timetableimg">
        <button onclick="englishbutton()" id="englishbutton">English</button>
        <button onclick="marathibutton()" id="marathibutton">&#2350;&#2352;&#2366;&#2336;&#2368; </button>
    </div>
    <div>
        <hr id="hrline">
        <img src="images/fare_chart_english.jpg" alt="" id="fareimg">
    </div>
    <script src="farecalculator.js"></script>
    
</body>

<%@ include file="footer.jsp" %>

</html>
