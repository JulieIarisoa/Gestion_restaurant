<%-- 
    Document   : new_facture
    Created on : 29 juin 2024, 14:16:35
    Author     : Manda
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
        response.setContentType("text/html;charset=UTF-8");
        String client = "client";
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/gestion_restaurant", "root","");
        pst = con.prepareStatement("insert into facture(nom_cli, date_facture) values(?,NOW())");
        pst.setString(1, client);
        pst.executeUpdate();
        
        String location = "http://localhost:8080/Gestion_restaurant/new_commande.jsp";
        response.sendRedirect(location);
        %>
