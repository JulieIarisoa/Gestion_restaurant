<%-- 
    Document   : delete_table.jsp
    Created on : 16 juin 2024, 09:10:13
    Author     : Manda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.*" %>
<%
        String id_table = request.getParameter("id");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/gestion_restaurant", "root","");
        pst = con.prepareStatement("delete from table_resto where id_table = ?");
        pst.setString(1, id_table);
        pst.executeUpdate();
        String location = "http://localhost:8080/Gestion_restaurant/index.jsp";
        response.sendRedirect(location);
        %>
