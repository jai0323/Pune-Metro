<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="jakarta.servlet.http.*" %>
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
    <title>Pune Metro-TimeTable</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="farecalculator.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="icon" type="images/jpg" href="https://www.punemetrorail.org/assets/images/logo.png">
    
    <link href="https://fonts.googleapis.com/css2?family=Ubuntu:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap" rel="stylesheet">
</head>
        
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
.timetableimg{
    margin-left: 100px;
    margin-top: 10px;
    
}
.timetableimg button{
    
    border-top-left-radius: 10px;   
    border-top-right-radius: 10px; 
    height: 40px;
    width: 100px;
    font-size: 17px;
    border: none;
}
hr{
    margin-left:0px;
    width: 1310px;
}
.border-image{
    display: block;
}
#timetableheading h1 {
    margin-left: 100px;
    font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
    color: #55528dce;
}        
    </style>
</head>
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

<body>

    <div id="heading">
        <i><h2 class="line">Train Time Table</h2></i>
        </div>
        <div class="timetableimg">
            <button onclick="englishbutton()" id="englishbutton">English</button>
            <button onclick="marathibutton()" id="marathibutton">&#2350;&#2352;&#2366;&#2336;&#2368;</button><hr>
        </div>
        
        <div>
            
            <img src="images/pune_metro_timetable.jpg" alt="" id="fareimg">
        </div>
    

</body>

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
  
</script><br>
<script src="index.js"></script>    
<%@ include file="AdminFooter.jsp" %>

</html>
<%
    } else {
        // If user is not logged in, redirect to login page
        response.sendRedirect("AdminLogin.jsp");
    }
%>
