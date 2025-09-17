<%@ page import="java.util.*" language="java" %> 
<%@ page import="jakarta.servlet.http.*" %> 

<!DOCTYPE html> 
<html> 
<head> 
    <title>Welcome to Pune Metro</title> 
    <meta http-equiv="Content-Type" content="text/html; charset=us-ascii" /> 
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Ubuntu:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap" rel="stylesheet">
    
    <link rel="icon" type="images/jpg" href="https://www.punemetrorail.org/assets/images/logo.png">

    <style>
        #helpcontact
        {
            margin-left: 100px;
            margin-top: 50px;
        }
        #contact
        {
            width: 600px;
            border: solid 2px;
            border-radius: 10px;
            height: 200px;
            margin-bottom: 100px;
            margin-top: 50px
            ;
        }
        #info 
        {
            margin: 40px;
        }
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
    </style>
    
</head> 
<body class="ubuntu-medium" id="sizecontainer"> 
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
        <i><h2 class="line">Help And Contact</h2></i>
        </div>
    


    <div id="helpcontact">
        

    <div id="contact">
        
        <div id="info">
            <span>Schedule meeting with the Managing Director</span> <br>
    <span style="color: #55528d; font-size: 25px">Shri. Shravan Hardikar (IAS)</span><br>
    <span>Contact : Sushma Prabhu (PS To Managing Director)  020-29707192</span><br>

    <span>Phone: 020-26051072 / 74</span><br>
    
    <span>Time: 10:30 AM To 6:30 PM</span><br>
        </div>
    
    </div>
    </div>
</body>
<script src="index.js"></script> 
<%@ include file="footer.jsp" %>

</html>
