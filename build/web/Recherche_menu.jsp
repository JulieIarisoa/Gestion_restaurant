<%-- 
    Document   : menu
    Created on : 16 juin 2024, 04:22:17
    Author     : Manda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>
<%
    if(request.getParameter("submit")!=null){
        String id_plat = request.getParameter("id_plat");
        String nom_plat = request.getParameter("nom_plat");
        String val = request.getParameter("pu");
        int pu = Integer.parseInt(val);
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/gestion_restaurant", "root","");
        pst = con.prepareStatement("insert into menu(id_plat, nom_plat, pu) values(?,?,?)");
        pst.setString(1, id_plat);
        pst.setString(2, nom_plat);        
        pst.setInt(3, pu);
        pst.executeUpdate();
        %>
        <script>
            alert("coucou");
        </script><%
    }

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Table</title>
        <link href="bootstrap-5.0.2-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap-5.0.2-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <a href="index.jsp">Table</a>
        <a href="#">Menu</a>
        <a href="#">Reserver</a>
        <a href="#">Commande</a>
    <div class="row">
        <div class="col-rm-4">
            <form class="card" method="post" action="#">
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
                    <input type="submit" class="btn btn-info" name="submit" id="submit" value="Ajouter">
                    <input type="reset" class="btn btn-warning" name="annuler" id="annuler" value="Annuler">
                </div>
            </form>
        </div>
        
        
        

        <div class="col-sm-8">
            <div class="panel-body">
                <table id="tbl-table" class="table table-responsive table-bordered" cellpadding="0" width="100%">
                    <thead>
                        <tr>
                            <th>Identifiant</th>
                            <th>Nom plat</th>
                            <th>Prix unitaire</th>
                            <th>Edit</th>
                            <th>Delete</th>
                        </tr>
                        
                        <%
                            Connection con;
                            PreparedStatement pst;
                            ResultSet rs;

                            Class.forName("com.mysql.jdbc.Driver");
                            con = DriverManager.getConnection("jdbc:mysql://localhost/gestion_restaurant", "root","");
                            
                            String query = "select * from menu";
                            Statement st = con.createStatement();
                            
                            rs = st.executeQuery(query);
                            while(rs.next()){
                                String id = rs.getString("id_plat");
                        %>
                        <tr>
                            <td><%=rs.getString("id_plat")%></td>
                            <td><%=rs.getString("nom_plat")%></td>
                            <td><%=rs.getString("pu")%></td>
                            <td><a href="update_menu.jsp?id=<%=id%>">Edit</a></td>  
                            <td><a href="delete_menu.jsp?id=<%=id%>">Delete</a></td>
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
