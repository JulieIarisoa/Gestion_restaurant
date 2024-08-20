<%-- 
    Document   : commande_emporter
    Created on : 27 juin 2024, 11:11:16
    Author     : Manda
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/gestion_restaurant", "root","");
        
    if(request.getParameter("submit")!=null){
        String id_facture = request.getParameter("id_facture");
        String nom_cli = request.getParameter("nom_cli");
        
        pst = con.prepareStatement("update commande1 set  etat='ok', id_facture=?,id_table='emporter' where etat='new'");
        pst.setString(1, id_facture);
        pst.executeUpdate();
        
        
        pst = con.prepareStatement("update facture set  nom_cli=? where id_facture=?");
        pst.setString(1, nom_cli);
        pst.setString(2, id_facture);
        pst.executeUpdate();
        
        String location = "http://localhost:8080/Gestion_restaurant/commande.jsp";
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
            <h5>Commande en porter</h5>
            <form method="post" action="#">
               <%
                        
                        String id = request.getParameter("id");
                        
                        pst = con.prepareStatement("select * from facture where id_facture=?");
                        pst.setString(1, id);
                        rs = pst.executeQuery();
                        
                        while(rs.next()){%>
                        
                    <div align="left">
                        <label class="form-label">Facture n°:</label>
                        <input type="text" class="form-control" placeholder="Identifiant" value="<%=rs.getString("id_facture")%>" name="id_facture" id="id_facture" readonly>
                    </div>
                
                    <%
                        }
                    %>
                <div align="left">
                    <label class="form-label">Nom client</label>
                    <input type="text" class="form-control" placeholder="nom client" name="nom_cli" id="nom_cli" required>
                </div>
                
                <div align="right">
                    <input type="submit" class="btn btn-outline-success mt-2" name="submit" id="submit" value="Ajouter">
                    <input type="reset" class="btn btn-outline-warning mt-2" name="annuler" id="annuler" value="Annuler">
                </div>
            </form>
        </div-->
    </body>
</html>
