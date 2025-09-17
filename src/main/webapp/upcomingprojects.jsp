<%@ page import="java.util.*" language="java" %> 
<%@ page import="javax.servlet.http.HttpSession"%> 

<!DOCTYPE html> 

<html> 
<head> 
    <title>Pune Metro-Projects</title> 
    <meta http-equiv="Content-Type" content="text/html; charset=us-ascii" /> 
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Ubuntu:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap" rel="stylesheet">
    
    <link rel="icon" type="images/jpg" href="https://www.punemetrorail.org/assets/images/logo.png">
    <style>
        #mahametro
        {
            width: 1200px;
            height: auto;
            margin-left: 100px;
            margin-bottom: 150px;
        }
        #mahametro p
        {
            font-size: 17px;
            margin-top: 40px;
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
    <i><h2 class="line">Project</h2></i>
    </div>

     <div id="mahametro">
          <p>
            Pune & Pimpri-Chinchwad is the next largest urban conglomerate to Mumbai Metropolitan Region in Maharashtra. These cities are considered to be an educational hub due to the establishment of large number of educational institutes across the city. Pune & PimpriChinchwad have been experiencing tremendous growth in population and employment since the last two decades. The cities have been stretching their limits to the widest extent possible, thus urban sprawl has become evident. The growth in various industries, particularly automobile, IT and IT enabled services, in and around Pune & Pimpri-Chinchwad has added further impetus to the urban sprawl and increase in population and employment. The district also has an importance as an important military base. The urbanization of this Pune &PimpriChinchwad will receive a big impetus in the next 30 years due to the ambitious development plan of the 7000 sq. km Pune Metropolitan Region

The population of Pimpri-Chinchwad as per 2011 Census is 17.27 lakhs. Pimpri-Chinchwad provides employment to industrial workers and of late has emerged as an affordable urban destination for residential purposes. The increasing demand for industrial and residential areas led to continuous addition of areas and upgradation of the erstwhile Municipal Council to Corporation. For the last two decades, the decadal growth rate of population has been in the range of 100% while the previous two decades witnessed population growth in the range of 150%

The metro system will connect different parts of the city area with the developed and developing areas. Although the city has relatively low population compared to other metropolitan cities, a planning for a modern transportation system for Pune city shall help it to grow in terms of industrialization and commercialization

At present, the public transport system in Pune &PimpriChinchwad consists mainly of buses, and a few services of Bus Rapid Transit (BRT) System and suburban rail at present. The public transport share has been completely overthrown by the tremendous growth in private vehicle transport. The vicious cycle of increase in private vehicle ownership (mostly two-wheelers and cars) has become unstoppable due to the increased transport demand and lack of convenient public transport options. In a nutshell, in the absence of augmentation of mass transit services, Pune may head towards unsustainable urban transport scenario. In order to augment public transport system to cater to the rapid increase in demand for transportation services and make urban transportation in Pune &PimpriChinchwad sustainable, the implementation of metro rail was envisaged, and Metro Master Plan was prepared by Delhi Metro Rail Corporation (DMRC) in 2008.
 
           
    </p>
     </div>
</body>
<%@ include file="footer.jsp" %>

</html>
