<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.*" %>
<%
    // Invalidate the session
    HttpSession adminSession = request.getSession(false);
    if (session != null) {
        adminSession.invalidate(); // Invalidates the session
    }
    // Redirect the user to the login page
    response.sendRedirect("metrocard_login.jsp");
%>
