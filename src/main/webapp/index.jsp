<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" language="java" %> 
<%@ page import="javax.servlet.http.*" %>

<!DOCTYPE html> 
<html> 
<head> 
    <title>Welcome to Pune Metro</title> 
    <meta http-equiv="Content-Type" content="text/html; charset=us-ascii" /> 
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin >
    <link href="https://fonts.googleapis.com/css2?family=Ubuntu:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap" rel="stylesheet">
    <script src="https://maps.googleapis.com/maps/api/js?callback=initMap" async defer></script>

    <link rel="icon" type="images/jpg" href="https://www.punemetrorail.org/assets/images/logo.png">
    
</head> 
<body class="ubuntu-medium" id="sizecontainer"> 

  <div id="loading-screen">
    <img src="images/loadingimg.gif" alt="" id="loadingimg">
    <br>
    <p>Just a second...</p>
  </div>

  
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

  <div>
  
  <div class="plan-your-jrny-box">
    <div class="plan-your-jrny-box1">
        <div class="plan-your-jrny-box-heading">
            <h2>PLAN YOUR JOURNEY</h2>        
        </div>
        <div class="plan-your-jrny-box-selection">
            <label for="" class="plan-your-jrny-box-label">From</label><br>
            <select name="source" id="source">
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
            </select><br>
            <label for="" class="plan-your-jrny-box-label">To</label><br>
            <select name="destination" id="destination">
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
            </select><br>
            <input type="submit" value="Show Route & Fare" id="calculateFareButton" onclick="redirectToFareCalculatorPage()">
            <i class="fa-solid fa-repeat plan-your-jrny-box-reset" style="margin-left: 42px;"></i>
            <a href="index.jsp" class="plan-your-jrny-box-reset">Reset</a>
        </div>
    </div>
</div>

<div class="quote">
    <div class="quote1">
        Fast and Secure:
        <br>
        <span class="quote2" >
            Pune Metro, Your 
            <br>
            Commute Companion
        </span>
    </div>
</div>
</div>


<section>
    <div class="slider">
        <div class="slide" style="background-image: url('https://www.punemetrorail.org/assets/images/banner2.jpg')"></div>
        <div class="slide" style="background-image: url('https://www.punemetrorail.org/assets/images/banner3.jpg')"></div>
        <div class="slide" style="background-image: url('https://www.punemetrorail.org/assets/images/banner.jpg')"></div>
        <div class="slide" style="background-image: url('https://www.punemetrorail.org/assets/images/banner3.jpg')"></div>
        <div class="slide" style="background-image: url('https://www.punemetrorail.org/assets/images/banner.jpg')"></div> 
    </div>
</section>


<div id="notification">
  <marquee direction="left" behavior="scroll" scrollamount="3">
   *For job inqury click here
</marquee>
</div>
    
    <div id="serviceandnews">

      <div class="container" id="newdcontainer">
        <div id="map" ></div>
            
        <button onclick="findNearestStation()" id="findNearestStationBtn" style="margin-top:10px;">Find Nearest Station</button>

      </div>
       

      <div id="servicetabs">
        <div class="time-table">
          <a href="timetable.jsp">
            <div class="time-table1">
              <img src="https://www.punemetrorail.org/assets/images/time_table.svg" alt="">
              Train Time Table 
              <i class="fa-solid fa-angle-right"></i>
            </div>
          </a>
        </div>
        
        <div class="metro-card">
          <a href="metrocard/metrocard_login.jsp">
            <div class="metro-card1">
              <img src="https://www.punemetrorail.org/assets/images/card.svg" alt="">
              Metro Card
              <i class="fa-solid fa-angle-right"></i>
            </div>
          </a>
        </div>
        <div class="fare-chart">
          <a href="farecalculator/farecalculator.jsp">
            <div class="fare-chart1">
              <img src="https://www.punemetrorail.org/assets/images/fare.svg" alt="">
              Fare Chart
              <i class="fa-solid fa-angle-right"></i>
            </div>
          </a>
        </div>
        <div class="lostandfound">
          <a href="LostFound.jsp">
            <div class="lostandfound1">
              <img src="images/bag-cross-svgrepo-com.svg" alt="">
              Lost & Found
              <i class="fa-solid fa-angle-right"></i>
            </div>
          </a>
        </div>
        <div class="Ticket">
          <a href="News.jsp">
            <div class="Ticket1">
              <img src="./images/train.svg"alt="">
              News
              <i class="fa-solid fa-angle-right"></i>
            </div>
          </a>
        </div>
        
        <div class="Complaint">
          <a href="complaints.jsp">
            <div class="Complaint1">
              <img src="images/complain.svg" alt="">
              Complaint
              <i class="fa-solid fa-angle-right"></i>
            </div>
          </a>
        </div>
      </div>
  </div>
  
      
      
  <script src="index.js"></script>    

</body>
<%@ include file="footer.jsp" %>

</html>
