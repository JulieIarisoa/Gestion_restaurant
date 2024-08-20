<%-- 
    Document   : Pdf
    Created on : 17 juin 2024, 15:14:54
    Author     : Manda
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <nav class="navbar navbar-expand-sm bg-dark">
            <div class="container-fluid">
              <!-- Links -->
              <ul class="navbar-nav">
                <li class="nav-item m-2">
                    <a class="nav-link" href="index.jsp"><i class="glyphicon glyphicon-cloud"></i>Table</a>
                </li>
                <li class="nav-item m-2">
                  <a class="nav-link" href="menu.jsp">Menu</a>
                </li>
                <li class="nav-item m-2">
                  <a class="nav-link" href="reserver.jsp">Reserver</a>
                </li>
                <li class="nav-item m-2">
                  <a class="nav-link" href="commande.jsp">Commande</a>
                </li>
                <li class="nav-item m-2">
                  <a class="nav-link" href="facture.jsp">Autre</a>
                </li>
              </ul>
              <form class="d-flex" action="#">
                    <input type="text" class="form-control me-2" placeholder="Rechercher client..." name="rech_plat" id="rech_plat" required>
                    <input type="submit" class="btn btn-primary" value="Rechercher" name="Rechercher">
                </form>
            </div>
          </nav>
        
        
    <div class="row">
        <div class=" w-25 p-3 h-50 m-4 bg-light shadow-lg rounded-3">
            <form  method="post" action="list_client.jsp">
            <center><h5  class="h5 pt-3">Recherche entre 2 date</h5></center>
            <form method="post" action="list_client.jsp">
                <div align="left">
                    <label class="form-label">date 1</label>
                    <input type="date" class="form-control" placeholder="date reserver" name="date_reserver" id="date_reserver" required>
                </div>
                <div align="left">
                    <label class="form-label">date 2</label>
                    <input type="date" class="form-control" placeholder="date reserver1" name="date_reserver1" id="date_reserver1" required>
                </div>
                    <input type="submit" class="btn btn-outline-success mt-2" name="submit" id="submit" value="Lister">
            </form>
        
            
            
            <form  method="post" action="list_client1.jsp">
            <center><h5  class="h5 pt-3">Recherche en une date</h5></center>
            <form method="post" action="list_client.jsp">
                <div align="left">
                    <label class="form-label">date rechercher</label>
                    <input type="date" class="form-control" placeholder="date reserver" name="date_reserver" id="date_reserver" required>
                </div>
                    <input type="submit" class="btn btn-outline-success mt-2" name="submit1" id="submit1" value="Lister">
            </form>
        </div>
        
        
        
        
        
        
        <div class="col-sm-8 bg-light shadow-sm rounded-3 m-3">
            
                    <img src="histo" alt="Recettes MEnsuelles des 6 Derniers Mois">
            </div>
                    
                    
<%
    if(request.getParameter("Rechercher")!=null){
        String recherche = request.getParameter("rech_plat");
%>
        
            <div class="col-sm-8 bg-light shadow-sm rounded-3 m-3">
            <center><h5  class="h5 pt-3">Liste de tous les clients</h5></center>
                <table id="tbl-table" class="table table-responsive table-bordered" cellpadding="0" width="100%">
                    <thead>
                        <tr>
                            <th>Identifiant facture</th>
                            <th>Nom client</th>
                        </tr>
<%
                            Connection con;
                            PreparedStatement pst;
                            ResultSet rs;

                            Class.forName("com.mysql.jdbc.Driver");
                            con = DriverManager.getConnection("jdbc:mysql://localhost/gestion_restaurant", "root","");
                            
        pst = con.prepareStatement("select * from facture Where nom_cli like'%"+recherche+"%'");
        rs = pst.executeQuery();
        while(rs.next()){
            String id_menu = rs.getString("id_facture");%>
                        <tr>
                            <td><%=rs.getString("id_facture")%></td>
                            <td><%=rs.getString("nom_cli")%></td>
                            <td><a href="generer_facture_pdf.jsp?id=<%=id_menu%>"><button class="btn btn-outline-danger">Pdf</button></td>
                        </tr>
                        <%
                            }
    }

%>
        </div>
    </body>
</html>
