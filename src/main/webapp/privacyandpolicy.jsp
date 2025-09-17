<%@ page import="java.util.*" language="java" %> 
<%@ page import="jakarta.servlet.http.HttpSession"%> 

<!DOCTYPE html> 

<html> 
<head> 
    <title>Pune Metro-Privacy Policy</title> 
    <meta http-equiv="Content-Type" content="text/html; charset=us-ascii" /> 
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Ubuntu:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap" rel="stylesheet">
    
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
        #mahametro
        {
            width: 1200px;
            height: auto;
            margin-left: 100px;
            margin-bottom: 150px;
        }
        #mahametro p
        {
            font-size: 16px;
            margin-top: 40px;
        }
        
    </style>
    
</head> 
<body class="ubuntu-medium" id="sizecontainer"> 

 <%@ include file="header.jsp" %>
 <div id="heading">
    <i><h2 class="line">Privacy & Policy</h2></i>
    </div>

     <div id="mahametro">
          <p>

            This privacy policy has been compiled to better serve those who are concerned with how their 'Personally identifiable information' (PII) is being used online. PII, as used in US privacy law and information security, is information that can be used on its own or with other information to identify, contact, or locate a single person, or to identify an individual in context. Please read our privacy policy carefully to get a clear understanding of how we collect, use, protect or otherwise handle your Personally Identifiable Information in accordance with our website.

                <br><br><b>What personal information do we collect from the people that visit our blog, website or app?</b>

                <br>When registering on our site, as appropriate, you may be asked to enter your name, email address, mailing address, phone number or other details to help you with your experience.

                <br><br><b>When do we collect information?</b>

                <br>We collect information from you when you register on our site, fill out a form or enter information on our site.

                <br><br><b>How do we use your information?</b>

                <br>We may use the information we collect from you when you register, sign up for our newsletter, respond to a survey or are registering as a friend / fan, surf the website, or use certain other site features in the following ways:

                <br>To allow us to better service you in responding to your customer feedback.

                <br>To administer a contest, promotion, survey or other site feature.

                <br>To send periodic emails regarding your order or other products and services.

                <br><br><b>How do we protect visitor information?</b>

                <br>We do not use vulnerability scanning and/or scanning to PCI standards.

                <br>We use regular Malware Scanning.

                <br>We do not use an SSL certificate

                <br>We only provide articles and information, we never ask for personal or private information like debit or credit card numbers and / or bank details.

                <br><br><b>Do we use 'cookies'?</b>

                <br>We do not use cookies for tracking purposes You can choose to have your computer warn you each time a cookie is being sent, or you can choose to turn off all cookies. You do this through your browser (like Internet Explorer) settings. Each browser is a little different, so look at your browser's Help menu to learn the correct way to modify your cookies. If you disable cookies off, some features will be disabled that make your site experience more efficient and some of our services will not function properly.

                <br><br><b>Third Party Disclosure</b>

                <br>We do not sell, trade, or otherwise transfer to outside parties your personally identifiable information.

                <br><br><b>Third party links</b>

                <br>We do not include or offer third party products or services on our website.


          </p>
     </div>
</body>
<%@ include file="footer.jsp" %>

</html>
