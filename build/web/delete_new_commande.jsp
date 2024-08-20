<%-- 
    Document   : delete_commande
    Created on : 17 juin 2024, 08:17:09
    Author     : Manda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
        String id_commande = request.getParameter("id");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/gestion_restaurant", "root","");
        pst = con.prepareStatement("delete from commande1 where id_commade1 = ? and etat='new'");
        pst.setString(1, id_commande);
        pst.executeUpdate();
        String location = "http://localhost:8080/Gestion_restaurant/new_commande.jsp";
        response.sendRedirect(location);
        %>