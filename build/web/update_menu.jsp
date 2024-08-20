<%-- 
    Document   : update_table
    Created on : 16 juin 2024, 09:10:32
    Author     : Manda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
    if(request.getParameter("submit")!=null){
        String id_plat = request.getParameter("id_plat");
        String nom_plat = request.getParameter("nom_plat");
        String pu = request.getParameter("pu");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/gestion_restaurant", "root","");
        pst = con.prepareStatement("update menu set nom_plat = ?, pu = ? where id_plat = ?");
        pst.setString(1, nom_plat);
        pst.setString(2, pu);
        pst.setString(3, id_plat);
        pst.executeUpdate();
        String location = "http://localhost:8080/Gestion_restaurant/menu.jsp";
        response.sendRedirect(location);
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="bootstrap-5.0.2-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap-5.0.2-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <style>
            body{
                background-image: url("image/bg.jpg");
            }
            ::-webkit-scrollbar{
                width: 1px;
                background-image: url("image/bg.jpg");
            }
        </style>
    </head>
    <body>
        <center>
        <div class="p-3 w-25 mt-5 bg-light shadow-sm">
            <h5>Modifier menu</h5>
                <form method="post" action="#">
                    <%
                        Connection con;
                        PreparedStatement pst;
                        ResultSet rs;

                        Class.forName("com.mysql.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost/gestion_restaurant", "root","");
                        
                        String id = request.getParameter("id");
                        
                        pst = con.prepareStatement("select * from menu where id_plat=?");
                        pst.setString(1, id);
                        rs = pst.executeQuery();
                        
                        while(rs.next()){
                        
                    %>
                    <div align="left">
                        <label class="form-label">Identification plat</label>
                        <input type="text" class="form-control" placeholder="Identifiant" value="<%=rs.getString("id_plat")%>" name="id_plat" id="id_plat" readonly>
                    </div>

                    <div align="left">
                        <label class="form-label">Nom plat</label>
                        <input type="text" class="form-control" placeholder="Designation" value="<%=rs.getString("nom_plat")%>" name="nom_plat" id="nom_plat" required>
                    </div>
                    
                    <div align="left">
                        <label class="form-label">Prix unitaire</label>
                        <input type="text" class="form-control" placeholder="Prix Unitaire" value="<%=rs.getString("pu")%>" name="pu" id="pu" required>
                    </div>

                    <%
                        }
                    %>

                    <div align="right">
                        <input type="submit" class="btn btn-outline-success mt-2" name="submit" id="submit" value="Modifier">
                        <input type="reset" class="btn btn-outline-warning mt-2" name="annuler" id="annuler" value="Annuler">
                    </div>
                </form>
            </div>
        </center>
    </body>
</html>
