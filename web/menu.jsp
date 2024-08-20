<%-- 
    Document   : menu
    Created on : 16 juin 2024, 04:22:17
    Author     : Manda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>
<%
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/gestion_restaurant", "root","");
    if(request.getParameter("submit")!=null){
        String id_plat = request.getParameter("id_plat");
        String nom_plat = request.getParameter("nom_plat");
        String val = request.getParameter("pu");
        int pu = Integer.parseInt(val);
        
        pst = con.prepareStatement("insert into menu(id_plat, nom_plat, pu) values(?,?,?)");
        pst.setString(1, id_plat);
        pst.setString(2, nom_plat);        
        pst.setInt(3, pu);
        pst.executeUpdate();
    }

%>











<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Table</title>
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
                  <a class="nav-link" href="index.jsp">Table</a>
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
                    <a class="nav-link" href="#plusvendu">10plats plus vendu</a>
                </li>
                <li class="nav-item m-2">
                  <a class="nav-link" href="facture.jsp">Client</a>
                </li>
              </ul>
                <form class="d-flex" action="#Recherch">
                    <input type="text" class="form-control me-2" placeholder="Rechercher..." name="rech_plat" id="rech_plat" required>
                    <input type="submit" class="btn btn-primary" value="Rechercher" name="Rechercher">
                </form>
            </div>
          </nav>
        
    <div class="row">
        <div class=" w-25 p-3 h-50 m-4 bg-light shadow-lg rounded-3">
            <form method="post" action="#">
                <center><h5  class="h5">Ajouter menu</h5></center>
                <div align="left">
                    <label class="form-label">Identification plat</label>
                    <input type="text" class="form-control" placeholder="Identifiant" name="id_plat" id="id_plat" required>
                </div>
                
                <div align="left">
                    <label class="form-label">Nom plat</label>
                    <input type="text" class="form-control" placeholder="Nom plat" name="nom_plat" id="nom_plat" required>
                </div>
                
                <div align="left">
                    <label class="form-label">Prix unitaire</label>
                    <input type="text" class="form-control" placeholder="Prix unitaire" name="pu" id="pu" required>
                </div>
                
                <div align="right">
                    <input type="submit"  class="btn btn-outline-success mt-2" name="submit" id="submit" value="Ajouter">
                    <input type="reset"  class="btn btn-outline-warning mt-2" name="annuler" id="annuler" value="Annuler">
                </div>
            </form>
                
        </div>
        
        
        

        <div class="col-sm-8">
            <div class="panel-body bg-light shadow-sm rounded-3 m-3 p-3">
        
            <center><h3  class="h3 pt-3">Liste des menus</h3>
            </center>
    
        <%
                                String query9 = "select commande1.id_plat, SUM(menu.pu*commande1.qte) as tot from commande1,facture,menu where commande1.id_plat = menu.id_plat and commande1.id_facture=facture.id_facture";
                                Statement st9 = con.createStatement();

                                rs = st9.executeQuery(query9);%>
                                
                                
                           <%
                                while(rs.next()){
                                    String id_new = rs.getString("id_plat");
                            %>
                           
                            <label>Recette total accumulé:</label>
                            <input type="text" value="<%=rs.getString("tot")+" Ariary"%>">
                            <%
                                }
                            %>
                <table id="tbl-table" class="table table-responsive table-bordered mt-3" cellpadding="0" width="100%">
                    <thead>
                        <tr>
                            <th>Identifiant</th>
                            <th>Nom plat</th>
                            <th>Prix unitaire</th>
                            <th>Edit</th>
                            <th>Delete</th>
                        </tr>
                        
                        <%

                            
                            String query = "select * from menu order by id_plat desc";
                            Statement st = con.createStatement();
                            
                            rs = st.executeQuery(query);
                            while(rs.next()){
                                String id = rs.getString("id_plat");
                        %>
                        <tr>
                            <td><%=rs.getString("id_plat")%></td>
                            <td><%=rs.getString("nom_plat")%></td>
                            <td><%=rs.getString("pu")%></td>
                            <td><a href="update_menu.jsp?id=<%=id%>"><button class="btn btn-outline-primary">Edit</button></a></td>  
                            <td><a href="delete_menu.jsp?id=<%=id%>"><button class="btn btn-outline-danger">Delete</button></a></td>  
                        </tr>
                        <%
                            }
                        %>
                    </thead>
                </table>
                    
                        </div>
                    
                    
            
    <div id="plusvendu" class="h-100 m-5">
            <div class="panel-body  bg-light shadow-sm rounded-3 m-3 p-3">
        <center>
            <h3  class="h3 pt-3">Les dix plats les plus vendu</h3>
        </center>
                <table id="tbl-table"  class="table table-responsive table-bordered" cellpadding="0" width="100%">
                    <thead>
                        <tr>
                            <th>Identifiant</th>
                            <th>Nom plat</th>
                            <th>Prix unitaire</th>
                            <th>Nombre commande</th>
                        </tr>
                        
                        <%
                            
                            /*String queryplat = "select menu.id_plat, menu.nom_plat, menu.pu from menu join commande on(menu.id_plat = commande.id_plat) limit 3";*/
                            String queryplat = "select commande1.id_plat,count(commande1.id_plat) as nb, menu.nom_plat, menu.pu from commande1 join menu on (commande1.id_plat = menu.id_plat) group by id_plat order by nb desc limit 10";
                            Statement stp = con.createStatement();
                            
                            rs = stp.executeQuery(queryplat);
                            while(rs.next()){
                                String id = rs.getString("id_plat");
                        %>
                        <tr>
                            <td><%=rs.getString("id_plat")%></td>
                            <td><%=rs.getString("nom_plat")%></td>
                            <td><%=rs.getString("pu")%></td>
                            <td><%=rs.getString("nb")%></td>
                        </tr>
                        <%
                            }
                        %>
                    </thead>
                </table>
                    
    </div>    
                    
                    
                    
                    
                    
<%
    if(request.getParameter("Rechercher")!=null){
        String recherche = request.getParameter("rech_plat");
        
        pst = con.prepareStatement("select * from menu Where nom_plat like'%"+recherche+"%' order by id_plat desc");
        rs = pst.executeQuery();
%>

    <div id="Recherch" class="h-100  m-5">
            <div class="panel-body bg-light shadow-sm rounded-3 m-3 p-3">
        <center>
            <h3  class="h3 pt-3">Liste des menus chercher:</h3>
        </center>
                <table id="tbl-table"  class="table table-responsive table-bordered" cellpadding="0" width="100%">
                    <thead>
                        <tr>
                            <th>Identifiant</th>
                            <th>Nom plat</th>
                            <th>Prix unitaire</th>
                            <th>Edit</th>
                            <th>Delete</th>
                        </tr>
                        <%
        while(rs.next()){
            String id_menu = rs.getString("id_plat");%>
                        <tr>
                            <td><%=rs.getString("id_plat")%></td>
                            <td><%=rs.getString("nom_plat")%></td>
                            <td><%=rs.getString("pu")%></td>
                            <td><a href="update_menu.jsp?id=<%=id_menu%>"><button class="btn btn-outline-primary">Edit</button></a></td>  
                            <td><a href="delete_menu.jsp?id=<%=id_menu%>"><button class="btn btn-outline-danger">Delete</button></a></td>
                        </tr>
                        <%
                            }
    }

%>
                </table>
            </div>
            </div>
        </div>
    </div>
    </body>
</html>
