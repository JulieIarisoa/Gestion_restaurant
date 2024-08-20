<%-- 
    Document   : delete_reserver.jsp
    Created on : 17 juin 2024, 09:28:59
    Author     : Manda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.*" %>
<%
        String id_reserver = request.getParameter("id");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/gestion_restaurant", "root","");
        pst = con.prepareStatement("delete from reserver where id_reserver = ?");
        pst.setString(1, id_reserver);
        pst.executeUpdate();
        String location = "http://localhost:8080/Gestion_restaurant/reserver.jsp";
        response.sendRedirect(location);
        %>