<%@ page import ="java.sql.*"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.lang.*"%>
<%@ page import="jakarta.servlet.http.*" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Metro Card</title>
    <link rel="stylesheet" href="headerfooter.css">
    <link rel="stylesheet" href="metrocard_loginstyles.css">
    <style>
        .thistory {
            display: flex;
            
            justify-content: center;
            margin-bottom: 20px;
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
            border: 0.5px solid grey;
            height: auto;
            width: 1295px;
            border-radius: 16px;
            margin-left: 90px;  
            margin-top: 20px; 
            box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.5);
            padding: 20px;
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
        table{
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
        .sub-title {
            font-size: 60px;
            font-weight: 600;
            color: #fff;
        }

        .tab-titles {
            display: flex;
            margin-left: 100px;
            margin-top: 50px;
            margin-top: 50px;
        }
        .tab-titles button{
            border-top-left-radius: 10px;   
            border-top-right-radius: 10px; 
            height: 40px;
            width: 110px;
            margin-right: 10px;
            font-size: 17px;
            border: none;
            
        }
        .active-button {
            background-color: #55528D !important; /* Change background color to purple */
            color: white !important; /* Change text color to white */
        }
        .tab-links {
            margin-right: 50px;
            font-size: 18px;
            font-weight: 500;
            cursor: pointer;
            position: relative;
        }

        .tab-links::after {
            content: '';
            width: 0;
            height: 3px;
            background:rgb(208, 68, 136);
            position: absolute;
            left: 0;
            bottom: -8px;
            transition: 0.5s;
        }
        .tab-links.active-link::after {
            width: 100%;
        }

        .tab-contents ul li {
            list-style: none;
            margin: 10px 0;
        }

        .tab-contents {
            display: none;
        }

        .tab-contents.active-tab {
            display: block;
        }
    
    </style>
    
</head>

<body>
    <%@ include file="header.html" %>   
    
    <div id="heading">
        <i><h2 class="line">Transactin History</h2></i>
        </div>
    
    <div class="box">
    <div class="transaction-history">
        <% 
            if (session != null) {
                // Retrieve cardNumber and name attributes from session
                int cardNumber = (int) session.getAttribute("cardNumber");
                String name = (String) session.getAttribute("name");
    
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pune_metro", "root", "password");
                    PreparedStatement ps = con.prepareStatement("SELECT * FROM transaction WHERE cardno = ?");
                    ps.setInt(1, cardNumber);
    
                    ResultSet rs = ps.executeQuery();
    
                    // Display transaction details in tabular format

                    
        %>
        <p>Hello, <%= name %>! Here are the transaction details for your card number <%= cardNumber %></p><br>

                    <style>
                        .transaction-table {
                            border-collapse: collapse;
                            width: 100%;
                        }
    
                        .transaction-table th, .transaction-table td {
                            border: 1px solid #dddddd;
                            padding: 8px;
                            text-align: left;
                        }
    
                        .transaction-table th {
                            background-color: #f2f2f2;
                        }
                    </style>
    
                    <table class="transaction-table">
                        <thead>
                            <tr>
                                <th>Transaction ID</th>
                                <th>Card Number</th>
                                <th>Amount</th>
                                <th>Transaction Mode</th>
                                <th>Transaction Date</th>
                            </tr>
                        </thead>
                        <tbody>
        <%
                        while (rs.next()) { %>
                            
                            <tr>
                                <td><%= rs.getInt("t_id") %></td>
                                <td><%= rs.getInt("cardno") %></td>
                                <td><%= rs.getDouble("amount") %></td>
                                <td><%= rs.getString("t_mode") %></td>
                                <td><%= rs.getString("transaction_date") %></td>
                            </tr>
        <%}%>
                        </tbody>
                    </table>
        <%
                    con.close();
                } catch (Exception e) {
                    // Show a user-friendly error message
                    out.println("An error occurred while processing your request. Please try again later."+e.getMessage());
                    // Log the detailed error for debugging
                    e.printStackTrace(); // This will print the error stack trace to the server logs
                }
            } else {
                out.println("Session expired or not available. Please login again.");
            }
        %>
    </div>
    </div>
    
    
</div> 
</div>
</body>
<script src="index.js"></script>    



</html>

   
    
