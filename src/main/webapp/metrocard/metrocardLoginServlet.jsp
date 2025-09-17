<%@ page import ="java.sql.*"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.lang.*"%>
<%@ page import="javax.servlet.http.*" %>
<%
 response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0); 
try{
    

    String usrname=request.getParameter("usrname");
    String pwd=request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/pune_metro","root","password");
    PreparedStatement ps= con.prepareStatement("select address,cardno,name,password,expdate from registration where username=? and password=?");
    ps.setString(1,usrname);
    ps.setString(2,pwd);
    ResultSet rs;
    rs =ps.executeQuery();
    String n,ad,expdate;
    int cd;
    if(rs.next()){
         cd=rs.getInt("cardno"); 
         n=rs.getString("name");
         ad=rs.getString("address");
         expdate=rs.getString("expdate");

         

         // Storing data in the session
         session.setAttribute("cardNumber", cd);
         session.setAttribute("name", n);
    %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Metro Card</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="headerfooter.css">
    <link rel="stylesheet" href="metrocard_loginstyles.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
    
    <style>  
       /* Body with Pune Metro background */
		body {
		    font-family: 'Poppins', sans-serif;
		    margin: 0;
		    padding: 0;
		    color: #333;
		    background-image: url('https://www.punemetrorail.org/assets/images/banner3.jpg'); 
		    background-size: cover;
		    background-position: center; 
		    background-repeat: no-repeat; 
		    background-attachment: fixed; 
		    display: flex;
		    flex-direction: column;
		    justify-content: center;
		    align-items: center;
		    min-height: 100vh;
		}
		
		/* Header and Footer Centering */
		header, footer {
		    width: 100%;
		    display: flex;
		    justify-content: center;
		    align-items: center;
		}
		
		/* Metro Card Container */
.metro-card-container {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100%;
    min-height: 100vh;
    padding: 20px;
}

/* Card - Big Credit Card Style */
.metro-cardc {
    position: relative;
    width: 520px;  /* Larger width */
    height: 250px; /* Larger height */
    border-radius: 22px;
    overflow: hidden;
    text-align: left;
    background: rgba(255, 255, 255, 0.15); /* Transparent glassy effect */
    backdrop-filter: blur(12px);
    color: #fff;
    box-shadow: 0 15px 45px rgba(0, 0, 0, 0.35);
    transition: transform 0.4s ease, box-shadow 0.4s ease;
    cursor: pointer;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    padding: 25px;
    font-family: 'Poppins', sans-serif;
}

/* Card Hover Effect */
.metro-cardc:hover {
    transform: translateY(-10px) scale(1.05);
    box-shadow: 0 25px 60px rgba(0, 0, 0, 0.45);
}

/* Card Header - top info/logo */
.card-header h1 {
    margin: 0;
    font-size: 1.4rem;
    font-weight: 700;
    letter-spacing: 1px;
    text-shadow: 0 2px 5px rgba(0,0,0,0.3);
}

/* Card Body */
.card-body {
    padding: 25px 20px;
    padding-right: 280px; /* Space for QR code */
    font-size: 1rem;
    position: relative;
}

.card-body p {
    margin: 2px 0;
    font-weight: 500;
    font-size: 1.08rem;
}

/* QR Code Styling */
.card-body img {
    width: 140px;   /* Bigger QR code */
    height: 140px;  
    border-radius: 14px;
    border: 2px solid rgba(255, 255, 255, 0.6);
    box-shadow: 0 5px 20px rgba(0,0,0,0.35);
    position: absolute;
    bottom: 25px;
    right: 20px;
    transition: transform 0.3s ease;
}

.card-body img:hover {
    transform: scale(1.1);
}

/* Card Footer - buttons below card */
.card-footer {
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-top: 20px;
    gap: 12px;
}

/* Buttons */
.card-footer form input[type="submit"],
.card-footer button {
    width: 200px;         /* Fixed width for uniform buttons */
    padding: 12px 0;      /* Vertical padding */
    border-radius: 25px;  /* Rounded edges */
    font-size: 1.05rem;
    font-weight: 600;
    border: none;
    cursor: pointer;
    background-color: #55528D; /* Solid purple background */
    color: #fff;               /* White text */
    text-align: center;
    transition: all 0.3s ease;
}

/* Hover Effect */
.card-footer form input[type="submit"]:hover,
.card-footer button:hover {
    transform: scale(1.05);
    background-color: #3e3b6d; /* Slightly darker purple on hover */
}



		
     </style>
    
</head>
<body>
    <%@ include file="header.jsp" %>    
    <div class="metro-card-container">
    <div class="metro-cardc">
        <!-- Card Top (Header / Logo area) -->
        <div class="card-header" style="display: flex; align-items: center; gap: 10px;">
            <img src="../images/logo.png" alt="Metro Logo" style="height: 40px; width: 40px;">
            <h1>Metro Card</h1>
        </div>
        <!-- Card Middle (Card Details) -->
        <div class="card-body">
        	<p>
			    <strong>Card Number:</strong><br>
			    <%
			        // Convert integer card number to string
			        String cardNum = String.valueOf(cd);
			
			        // Ensure it has at least 9 digits for grouping (pad with leading zeros if needed)
			        while(cardNum.length() < 9) {
			            cardNum = "0" + cardNum;
			        }
			
			        // Split into 3 groups of 3 digits: XXX-XXX-XXX
			        String formattedCard = cardNum.substring(0, 3) + "-" + 
			                               cardNum.substring(3, 6) + "-" + 
			                               cardNum.substring(6);
			
			        out.print(formattedCard);
			    %>
			</p>
        	
            <p><strong>Card Holder:</strong> <% out.println(n); %></p>
            <p><strong>Valid upto:</strong> <% out.println(expdate); %></p>
            
            <!-- QR Code positioned like a card chip -->
            <img src="" id="img" alt="QR Code">
        </div>
    
            
        </div> 
            <div class="card-footer">
            <form action="transactionHistory.jsp" method="post">
                <input type="submit" value="Transaction History">
            </form> <br>
           
            <form action="Logout.jsp" method="post">
                <input type="submit" value="Logout">
            </form>  <br>
             <button id="downloadBtn"">Download Metro Card</button>
                          
        </div>
    </div>
</body> 
<script src="index.js"></script>    
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
<script>
    // Generate QR code from QRServer API
    let img = document.getElementById('img');
    var name = '<%= n %>';
    var cardno = '<%= cd %>';
    var qrData = encodeURIComponent(name + " | " + cardno);

    // Use PNG format
    img.crossOrigin = "anonymous"; // important to avoid CORS issue
    img.src = "https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=" + qrData + "&format=png";

    // Download Metro Card including QR
    document.getElementById("downloadBtn").addEventListener("click", function() {
        const card = document.querySelector(".metro-cardc");
        html2canvas(card, { useCORS: true, allowTaint: true }).then(canvas => {
            const link = document.createElement("a");
            link.download = "MetroCard.png";
            link.href = canvas.toDataURL("image/png");
            link.click();
        });
    });
</script>

      <%@ include file="footer.jsp" %>
</html>

    <%   
    }else{
    %>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Metro Card</title>
        <link rel="stylesheet" href="failedstyles.css">
        <link rel="stylesheet" href="headerfooter.css">
    </head>
    <%@ include file="header.jsp" %> 
    <body>

        <div class="boxcontainer">
            <h2>Login Failed</h2>
            <a href="metrocard_login.jsp" class="buttons">Login</a>
        </div>
        
        </body>
        </html>
        <script src="index.js"></script>    
        <%@ include file="footer.jsp" %>


       <%
    }
    
}catch(Exception e){
    out.println(e);
}
%>