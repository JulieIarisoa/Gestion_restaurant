<%-- 
    Document   : delete_menu
    Created on : 16 juin 2024, 10:51:05
    Author     : Manda
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.*" %>
<%
        String id_plat = request.getParameter("id");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/gestion_restaurant", "root","");
        pst = con.prepareStatement("delete from menu where id_plat = ?");
        pst.setString(1, id_plat);
        pst.executeUpdate();
        
        String location = "http://localhost:8080/Gestion_restaurant/menu.jsp";
        response.sendRedirect(location);
        %>
        <script>
            alert("coucou");
        </script>
