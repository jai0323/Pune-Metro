package com.punemetro;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.net.*;
import org.json.JSONObject;

@WebServlet("/CreateOrderServlet")
public class CreateOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
		String client_id = System.getenv("client_id");
		String client_secret = System.getenv("client_secret");


        String orderId = "ORDER" + System.currentTimeMillis();
        String orderAmount = request.getParameter("amount");
//        String customerName = request.getParameter("name");
//        String customerEmail = request.getParameter("email");
//        String customerPhone = request.getParameter("phone");
        
        String customerName = "Jai Shobhit";
        String customerEmail = "jai.shobhit@mitwpu.edu.in";
        String customerPhone = "9927155685";

        if(orderAmount == null || orderAmount.trim().isEmpty()) {
            response.getWriter().println("Amount cannot be empty");
            return;
        }
        URL url = new URL("https://sandbox.cashfree.com/pg/orders");
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setRequestProperty("x-client-id", "client_id");
        conn.setRequestProperty("x-client-secret", "client_secret");
        conn.setRequestProperty("x-api-version", "2022-09-01");
        conn.setRequestProperty("Content-Type", "application/json");
        conn.setDoOutput(true);
        
        JSONObject customerDetails = new JSONObject();
        customerDetails.put("customer_id","CUST101");
        customerDetails.put("customer_name", customerName);
        customerDetails.put("customer_email", customerEmail);
        customerDetails.put("customer_phone", customerPhone);

        JSONObject orderMeta = new JSONObject();
        orderMeta.put("return_url", "http://localhost:8080/PuneMetro/PaymentSuccess.jsp?order_id=" + orderId);

        JSONObject jsonBody = new JSONObject();
        jsonBody.put("order_id", orderId);
        jsonBody.put("order_amount", Double.parseDouble(orderAmount));
        jsonBody.put("order_currency", "INR");
        jsonBody.put("customer_details", customerDetails);
        jsonBody.put("order_note", "Pune Metro Ticket");
        jsonBody.put("order_meta", orderMeta);

        try(OutputStream os = conn.getOutputStream()) {
            byte[] input = jsonBody.toString().getBytes("utf-8");
            os.write(input,0,input.length);
        }

        int status = conn.getResponseCode();
        InputStream is = (status < 400) ? conn.getInputStream() : conn.getErrorStream();
        BufferedReader br = new BufferedReader(new InputStreamReader(is,"utf-8"));
        StringBuilder responseStr = new StringBuilder();
        String responseLine;
        while((responseLine = br.readLine()) != null) {
            responseStr.append(responseLine.trim());
        }

        JSONObject jsonResponse = new JSONObject(responseStr.toString());

        if(jsonResponse.has("payment_session_id")) {
        	
        	String paymentSessionId = jsonResponse.getString("payment_session_id");
        	System.out.println("\nSeesion id: - "+paymentSessionId);
//        	if(paymentSessionId.endsWith("paymentpayment")){
//        		paymentSessionId = paymentSessionId.replace("paymentpayment", "");
//        	}
        	// Instead of response.sendRedirect(paymentLink);
        	request.setAttribute("paymentSessionId", paymentSessionId);
        	request.setAttribute("amount", orderAmount);  // pass the actual amount
        	System.out.println("\n amount"+request.getSession().getAttribute("order_amount"));
        	RequestDispatcher rd = request.getRequestDispatcher("PaymentPage.jsp");
        	rd.forward(request, response);
            // Redirect to PaymentPage.jsp
            
        } else {
            response.setContentType("application/json");
            response.getWriter().println("Error creating order: "+ jsonResponse.toString());
        }
    }
}
