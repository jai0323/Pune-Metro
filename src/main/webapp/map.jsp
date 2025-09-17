<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html lang="en"> 
<head> 
<meta charset="UTF-8">
 <title>Pune Metro Route Finder</title> 
 <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css"/> 
 <link rel="stylesheet" href="map/map.css"/>
  </head>
   <body> 
      <%@ include file="header.jsp" %>
   <header>Pune Metro Route Finder </header> 
   	<div class="container-map"> <div class="form-box"> 
   <label for="source">From:</label> <select id="source">
   </select> <label for="destination">To:</label> 
   <select id="destination"></select> <button onclick="findRoute()">Find Route</button> 
   <div class="route-box" id="result"></div> 
   </div> <div id="map"></div>
    </div> 
    <script src="https://unpkg.com/leaflet/dist/leaflet.js"></script> 
    <script src="map/script.js">
    </script>
     </body>
     <%@ include file="footer.jsp" %> 
     </html>