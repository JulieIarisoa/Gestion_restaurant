<%-- 
    Document   : commande_sur_table
    Created on : 27 juin 2024, 11:14:51
    Author     : Manda
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/gestion_restaurant", "root","");
        
    if(request.getParameter("submit")!=null){
        String id_facture = request.getParameter("id_facture");
        String id_table = request.getParameter("id_table");
        String nom_cli = request.getParameter("nom_cli");
        
        pst = con.prepareStatement("update commande1 set id_table=?, type_commande='Sur table', etat='ok', id_facture=? where etat='new'");
        pst.setString(1, id_table);
        pst.setString(2, id_facture);
        pst.executeUpdate();
        
        
        pst = con.prepareStatement("update facture set nom_cli=? where id_facture=?");
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
            <h5>Commande sur table</h5>
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
                
                <div align="left">
                    <label class="form-label">Indentification table</label>
                    <!--input type="text" class="form-control" placeholder="identification table" name="id_table" id="id_table" required-->
                </div>
                <div align="left">
                
        <%
            /*String query9 = "select table_resto.designation,table_resto.id_table from table_resto join reserver on(table_resto.id_table = reserver.id_table) where table_resto.id_table not in (select id_table from reserver where date_reserver='2024-06-30') group by table_resto.id_table order by table_resto.id_table ";*/
             String query9 = "select * from table_resto where id_table not in (select id_table from reserver where date_reserver= CURRENT_DATE() )";
            Statement st9 = con.createStatement();
            rs = st9.executeQuery(query9);
        %>
        <select name="id_table" id="id_table" class="form-control" required>
            <%
                while(rs.next()){
                String id_new = rs.getString("id_table");
            %>
                <option value="<%=rs.getString("id_table")%>"><%=rs.getString("designation")%></option>
            <%
                }
            %>
        </select></div>
                <div align="right">
                    <input type="submit" class="btn btn-outline-success mt-2" name="submit" id="submit" value="Ajouter">
                    <input type="reset" class="btn btn-outline-warning mt-2" name="annuler" id="annuler" value="Annuler">
                </div>
            </form>
        </div-->
    </body>
</html>
