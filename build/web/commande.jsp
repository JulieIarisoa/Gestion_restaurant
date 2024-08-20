<%-- 
    Document   : index
    Created on : 16 juin 2024, 04:22:17
    Author     : Manda
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>





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
                  <a class="nav-link" href="facture.jsp">Client</a>
                </li>
              </ul>
            </div>
          </nav>
        

    <div class="row">
        <div  class="col-sm-3">
        </div>
        
        <div class="col-sm-8">
            <div class="panel-body bg-light shadow-sm rounded-3 m-3 p-3">
    <center><h3  class="h3 pt-3" id="commande">Liste des commandes</h3></center>
    <div align="right">
            <a href="new_facture.jsp">
                <button class="btn btn-outline-success mt-2">Nouveau commande</button>
            </a>
    </div>
                    <table id="tbl-table" class="table table-responsive table-bordered" cellpadding="0" width="100%">
                        <thead>
                            <tr>
                                <th>Identifiant</th>
                                <th>Identification plat</th>
                                <th>Type de commande</th>
                                <th>Identification table</th>
                                <th>Quantité</th>
                                <th>Edit</th>
                                <th>Delete</th>
                            </tr>

                            <%
                                Connection con;
                                PreparedStatement pst;
                                ResultSet rs;

                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost/gestion_restaurant", "root","");

                                String query1 = "select * from commande1 order by id_commade1 desc";
                                Statement st1 = con.createStatement();

                                rs = st1.executeQuery(query1);
                                while(rs.next()){
                                    String id = rs.getString("id_commade1");
                            %>
                            <tr>
                                <td><%=rs.getString("id_commade1")%></td>
                                <td><%=rs.getString("id_plat")%></td>
                                <td><%=rs.getString("type_commande")%></td>
                                <td><%=rs.getString("id_table")%></td>
                                <td><%=rs.getString("qte")%></td>
                                <td><a href="update_commande.jsp?id=<%=id%>"><button class="btn btn-outline-primary">Edit</button></a></td>  
                                <td><a href="delete_commande.jsp?id=<%=id%>"><button class="btn btn-outline-danger">Delete</button></a></td>
                            </tr>
                            <%
                                }
                            %>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
    </div>
    
    
    </body>
</html>
