<%-- 
    Document   : reserver
    Created on : 17 juin 2024, 09:13:17
    Author     : Manda
--%>


<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reserver</title>
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
        <div class=" w-25 p-3 h-50 m-4 bg-light shadow-lg rounded-3">
            
            <center><h5  class="h5 pt-3">Reserver table</h5></center>
            <form method="post" action="reservation_table.jsp">
                <div align="left">
                    <label class="form-label">date reserver</label>
                    <input type="date" class="form-control" placeholder="date reserver" name="date_reserver" id="date_reserver" required>
                </div>
                <div align="right">
                    <input type="submit" class="btn btn-outline-success mt-2" name="submit" id="submit" value="reserver">
                    <input type="reset"  class="btn btn-outline-warning mt-2" name="annuler" id="annuler" value="Annuler">
                </div>
            </form>
        </div>
        

        <div class="col-sm-8">
            <div class="panel-body bg-light shadow-sm rounded-3 m-3 p-3">
    <center><h3  class="h3 pt-3">Liste de reservation des tables</h3></center>
                <table id="tbl-table" class="table table-responsive table-bordered" cellpadding="0" width="100%">
                    <thead>
                        <tr>
                            <th>Identifiant reserver</th>
                            <th>Identifiant table</th>
                            <th>date reservation</th>
                            <th>date reservé</th>
                            <th>Nom client</th>
                            <th>Edit</th>
                            <th>Delete</th>
                        </tr>
                        
                        <%
                            Connection con;
                            PreparedStatement pst;
                            ResultSet rs;

                            Class.forName("com.mysql.jdbc.Driver");
                            con = DriverManager.getConnection("jdbc:mysql://localhost/gestion_restaurant", "root","");
                            
                            String query = "select * from reserver";
                            Statement st = con.createStatement();
                            
                            rs = st.executeQuery(query);
                            while(rs.next()){
                                String id = rs.getString("id_reserver");
                        %>
                        <tr>
                            <td><%=rs.getString("id_reserver")%></td>
                            <td><%=rs.getString("id_table")%></td>
                            <td><%=rs.getString("date_reservation")%></td>
                            <td><%=rs.getString("date_reserver")%></td>
                            <td><%=rs.getString("nom_cli")%></td>
                            <td><a href="update_reserver.jsp?id=<%=id%>"><button class="btn btn-outline-primary">Edit</button></a></td>  
                            <td><a href="delete_reserver.jsp?id=<%=id%>"><button class="btn btn-outline-danger">Delete</button></a></td>
                        </tr>
                        <%
                            }
                        %>
                    </thead>
                </table>
            </div>
        </div>
    </div>
    </body>
</html>
