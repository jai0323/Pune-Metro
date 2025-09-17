<%@ page import="java.util.*" %>
<%
    String paymentSessionId = (String) request.getAttribute("paymentSessionId");
    String amount = (String) request.getAttribute("amount");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PuneMetro Payment</title>
    <script src="https://sdk.cashfree.com/js/v3/cashfree.js"></script>
</head>
<body>
    <h2>Processing Payment</h2>
    <p>Amount: Rs.<%= amount %></p>
    <button id="renderBtn">Pay Now</button>

    <script>
        // Initialize Cashfree SDK
        const cashfree = Cashfree({ mode: "sandbox" }); // change to 'production' for live

        document.getElementById("renderBtn").addEventListener("click", () => {
            const checkoutOptions = {
                paymentSessionId: "<%= paymentSessionId %>", // session from servlet
                redirectTarget: "_modal", // opens in popup modal
            };

            cashfree.checkout(checkoutOptions).then((result) => {
                if(result.error){
                    console.error("Payment error or popup closed:", result.error);
                    alert("Payment failed or closed!");
                }
                if(result.redirect){
                    console.log("Payment redirect needed");
                }
                if(result.paymentDetails){
                    console.log("Payment completed", result.paymentDetails);
                    window.location.href = "PaymentSuccess.jsp?order_id=" + result.paymentDetails.orderId;
                }
            });
        });
    </script>
</body>
</html>
