<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Payment Success - Pune Metro</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- CSS -->
    <link rel="stylesheet" href="farecalculator.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="icon" type="images/jpg" href="https://www.punemetrorail.org/assets/images/logo.png">
    <link href="https://fonts.googleapis.com/css2?family=Ubuntu:wght@400;500;700&display=swap" rel="stylesheet">
</head>

<body class="ubuntu-medium">
    <%@ include file="header.jsp" %>

    <div id="farecalculatorheading">
        <h2>Payment Confirmation</h2>
    </div>

    <div class="fare-calculator-box">
        <div class="fare-calculator-box1">

            <div class="fare-calculator-box-selection" style="text-align:center;">
                <i class="fa-solid fa-circle-check" style="font-size:60px; color:green;"></i>
                <h2 style="margin-top:15px; color:green;">Payment Successful!</h2>

                <%
                    String orderId = request.getParameter("order_id");
                    String status = request.getParameter("txStatus"); // Cashfree returns txStatus
                    if(status == null) {
                        status = "SUCCESS"; // fallback if not provided
                    }
                %>

                <p style="margin-top:10px; font-size:18px;">
                    Thank you for booking your Pune Metro ticket.<br>
                    <b>Order ID:</b> <%= orderId != null ? orderId : "N/A" %><br>
                    <b>Status:</b> <%= status %>
                </p>

                <a href="index.jsp">
                    <button style="padding:10px 20px; background:#55528D; color:white; border:none; border-radius:5px; margin-top:20px;">
                        Back to Home
                    </button>
                </a>
            </div>
        </div>
    </div>

    <div style="text-align:center; margin-top:40px;">
        <hr id="hrline">
        <img src="images/fare_chart_english.jpg" alt="" id="fareimg" style="max-width:600px;">
    </div>

    <%@ include file="footer.jsp" %>
</body>
</html>
