<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="jakarta.servlet.http.*" %>
<%
    // Invalidate the session
    HttpSession adminSession = request.getSession(false);
    if (session != null) {
        adminSession.invalidate(); // Invalidates the session
    }
    // Redirect the user to the login page
    response.sendRedirect("AdminLogin.jsp");
%>
