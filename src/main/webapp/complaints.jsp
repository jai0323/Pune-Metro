<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="styles.css" />
    
    <title>Complaints</title>
    <link rel="icon" type="images/jpg" href="https://www.punemetrorail.org/assets/images/logo.png">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500&display=swap" rel="stylesheet">
    <style>
        #heading{
           font-size: 30px;
           margin-left: 100px;
           
       }
       #heading h2{
           font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
           color: #55528dce;
       }
       .selection{
           margin-left: 100px;
           margin-top: 50px;
       }
       .selection button{
           border-top-left-radius: 10px;   
           border-top-right-radius: 10px; 
           height: 40px;
           width: 100px;
           font-size: 17px;
           border: none;
        }
      
       hr{
           margin-left: 100px;
           width: 1310px;
        }
       .box{
            background-color: #ffffff00;
           border: 0.5px solid grey;
           height: 550px;
           width: 1330px;
           border-radius: 16px;
           margin-left: 90px;  
           margin-top: 20px; 
           box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.5);
        }
       .box2{
            padding-top: 20px;
            margin-left: 40px;
            margin-right: 40px;
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
        .plan-your-jrny-box {
    position: absolute;
    right: 100px;
    top: 450px;
    transform: translateY(-50%);
    width: 400px;
    height: 363px;
    border-radius: 10px 10px 10px 10px;
    background-color: #fff;
    z-index: 990;
    padding: 10px;
    box-shadow: 0px 2px 4px 2px rgba(183, 189, 203, 0.3);
}
.plan-your-jrny-box1
{
    padding: 0px 24px 24px 24px;
    margin: 16px 0px 0px;
}

.plan-your-jrny-box-heading{
    font-size: 15px;
    margin-top: 0px;
}

.plan-your-jrny-box-selection select{
    padding: 9.6px 36px 9.6px 12px;
    width: 355px;
    height: 45px;
    margin: 12px 0px 12px 0px;
    font: 16px;
    border: 2px solid black;
    border-radius: 5px;

}
.plan-your-jrny-box-selection input
{
    width: 235px;
    height: 45px;
    background-color: #C868A8;
    color: white;
    border-radius: 5px;
    border: none;
    font-size: 15px;
    margin-top: 40px;
    font-weight: bold;
    transition: transform 0.4s ease-in-out;
    cursor: pointer; 
}
.plan-your-jrny-box-selection input:hover {
    transform: scale(1.05); /* Scale up slightly on hover */
}
.plan-your-jrny-box-label
{
    color: #C868A8;
    font-weight: bold;
}
.plan-your-jrny-box-reset
{
    text-decoration: none;
    color: blue;
    transition: transform 0.4s ease-in-out; 
    cursor: pointer;

}
.plan-your-jrny-box-reset a:hover {
    transform: scale(1.05); /* Scale up slightly on hover */
}
/* Style for select tags */
.plan-your-jrny-box-selection select {
    font-size: 16px;
}

/* Style for option tags */
.plan-your-jrny-box-selection option {
    color: #000; /* Dark black color */
}

/* Hover effect for options */
.plan-your-jrny-box-selection option:hover {
    background-color: #d31717; /* Light gray background color */
    cursor: pointer;
}
body{
    font-family: "Ubuntu", sans-serif;
    font-weight: 500;
}


        /*body{
            font-family: Arial, sans-serif;
            background-color:rgba(226, 223, 223, 0.674);
            color:rgb(5, 5, 5);
            background-image: url('https://www.punemetrorail.org/assets/images/banner2.jpg'); 
            background-size: cover;
            background-position: center; 
            background-repeat: no-repeat; 
            background-attachment: fixed; 
        }*/
   </style>
</head>
<body>
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
        <i><h2 class="line">Complaints</h2></i>
        </div>
        <main>   
            <div class="box">
                <div class="box2">
                    <form action="submitComplaint.jsp" method="post">
                            <h5>Register Your Complaints here</h5>
                            <label for="item">Name  :</label>
                            <input type="text" id="name" name="name" required><br>
                            <label for="item">Contact Number :</label>
                            <input type="text" id="mobile" name="mobile" required><br>
                            <label for="item">Email Id :</label>
                            <input type="text" id="email" name="email" required><br>
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
                            </select><br>
                            <label for="description">Complaint in Brief:</label>
                            <textarea id="complaint" name="complaint" rows="4" required></textarea><br>
                            </div>
                            <input type="submit" value="Submit">
                    </form>
                </div>
            </div>
    </main><br>
      
    <script src="index.js"></script>  
</body>
<%@ include file="footer.jsp" %>
</html>