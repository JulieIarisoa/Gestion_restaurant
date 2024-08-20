<%-- 
    Document   : index
    Created on : 16 juin 2024, 04:22:17
    Author     : Manda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>
<%
    if(request.getParameter("submit")!=null){
        String id_table = request.getParameter("id_table");
        String designation_table = request.getParameter("designation_table");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/gestion_restaurant", "root","");
        pst = con.prepareStatement("insert into table_resto(id_table, designation) values(?,?)");
        pst.setString(1, id_table);
        pst.setString(2, designation_table);
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
        <link href="bootstrap-icons-1.8.0/bootstrap-icons-1.8.0/bootstrap-icons.css" rel="stylesheet" type="text/css"/>
        
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
            <form  method="post" action="#">
                <center><h5  class="h5">Ajouter table</h5></center>
                <div align="left">
                    <label class="form-label">Identification table</label>
                    <input type="text" class="form-control" name="id_table" id="id_table" required>
                </div>
                
                <div align="left">
                    <label class="form-label ">Designation table</label>
                    <input type="text" class="form-control" name="designation_table" id="designation_table" required>
                </div>
                
                
                <div align="right">
                <i class="fas fa-hand-holding-used"></i>
                    <input type="submit" class="btn btn-outline-success mt-2" name="submit" id="submit" value="Ajouter">
                    <input type="reset" class="btn btn-outline-warning mt-2" name="annuler" id="annuler" value="Annuler">
                </div>
            </form>
        </div>
        
        
        

        <div class="col-sm-8 bg-light shadow-sm rounded-3 m-3">
            <div class="panel-body">
                <center><h3  class="h3 pt-3">Liste des tables</h3></center>
                <table id="tbl-table" class="table table-responsive table-bordered" cellpadding="0" width="100%">
                    <thead>
                        <tr>
                            <th>Identifiant</th>
                            <th>designation</th>
                            <th>Edit</th>
                            <th>Delete</th>
                        </tr>
                        
                        <%
                            Connection con;
                            PreparedStatement pst;
                            ResultSet rs;

                            Class.forName("com.mysql.jdbc.Driver");
                            con = DriverManager.getConnection("jdbc:mysql://localhost/gestion_restaurant", "root","");
                            
                            String query = "select * from table_resto";
                            Statement st = con.createStatement();
                            
                            rs = st.executeQuery(query);
                            while(rs.next()){
                                String id = rs.getString("id_table");
                        %>
                        <tr>
                            <td><%=rs.getString("id_table")%></td>
                            <td><%=rs.getString("designation")%></td>
                            <td><a href="update_table.jsp?id=<%=id%>" class="nav-link p-0"><button class="btn btn-outline-primary">Edit</button></a></td>  
                            <td><a href="delete_table.jsp?id=<%=id%>" class="nav-link p-0"><button class="btn btn-outline-danger">Delete</button></a></td>
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
