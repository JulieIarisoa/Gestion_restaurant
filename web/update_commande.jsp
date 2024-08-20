<%-- 
    Document   : update_commande
    Created on : 17 juin 2024, 08:25:08
    Author     : Manda
--%>

<%-- 
    Document   : update_table
    Created on : 16 juin 2024, 09:10:32
    Author     : Manda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
    if(request.getParameter("submit_m")!=null){
        String id_commande = request.getParameter("id_commande");
        String id_plat = request.getParameter("id_plat");
        String type_commande = request.getParameter("type_commande");
        String id_table = request.getParameter("id_table");
        String qte = request.getParameter("qte");

        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/gestion_restaurant", "root","");
        pst = con.prepareStatement("update commande1 set id_plat = ?, type_commande=?, id_table=?,qte=? where id_commade1 = ?");
        pst.setString(1, id_plat);
        pst.setString(2, type_commande);
        pst.setString(3, id_table);
        pst.setString(4, qte);
        pst.setString(5, id_commande);
        pst.executeUpdate();
        System.out.println(id_commande);
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
            <h5>Modifier Commande</h5>
                <form method="post" action="#">
                    <%
                        Connection con;
                        PreparedStatement pst;
                        ResultSet rs;

                        Class.forName("com.mysql.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost/gestion_restaurant", "root","");
                        
                        String id = request.getParameter("id");
                        
                        pst = con.prepareStatement("select * from commande1 where id_commade1=?");
                        pst.setString(1, id);
                        rs = pst.executeQuery();
                        
                        while(rs.next()){
                        
                    %>
                        <div align="left">
                            <label class="form-label">Identification commande</label>
                            <input type="text" class="form-control" placeholder="Identifiant" name="id_commande" id="id_commande" value="<%=rs.getString("id_commade1")%>" readonly>
                        </div>

                        <div align="left">
                            <label class="form-label">Identification plat</label>
                            <input type="text" class="form-control" placeholder="identifiant" name="id_plat" id="id_plat" value="<%=rs.getString("id_plat")%>" required>
                        </div>


                        <div align="left">
                            <label class="form-label">Type commande</label>
                            <input type="text" class="form-control" placeholder="type commande" name="type_commande" id="type_commmande" value="<%=rs.getString("type_commande")%>" required>
                        </div>

                        <div align="left">
                            <label class="form-label">Indentification table</label>
                            <input type="text" class="form-control" placeholder="identification table" name="id_table" id="id_table" value="<%=rs.getString("id_table")%>" required>
                        </div>


                        <div align="left">
                            <label class="form-label">Quantité</label>
                            <input type="number" class="form-control" placeholder="quantite commande" name="qte" id="qte" value="<%=rs.getString("qte")%>" required>
                        </div>
                    <%
                        }
                    %>

                    <div align="right">
                        <input type="submit" class="btn btn-outline-success mt-2" name="submit_m" id="submit_m" value="Modifier">
                        <input type="reset" class="btn btn-outline-warning mt-2" name="annuler" id="annuler" value="Annuler">
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
