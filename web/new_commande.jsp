<%-- 
    Document   : new_commande
    Created on : 29 juin 2024, 06:40:39
    Author     : Manda
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<%
    if(request.getParameter("command")!=null){
        response.setContentType("text/html;charset=UTF-8");
        String id_plat = request.getParameter("id");
        String qte = request.getParameter("qte");
        
        Integer quat = Integer.parseInt(qte);
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/gestion_restaurant", "root","");
        pst = con.prepareStatement("insert into commande1(id_plat, qte) values(?,?)");
        pst.setString(1, id_plat);
        pst.setString(2, qte);
        pst.executeUpdate();
        
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
    
    
    
    
    <div class="row">
        <div  class="col-sm-3">
        </div>
        <div class="col-sm-8 bg-light shadow-sm rounded-3 m-3">
            <div class="panel-body">
    <center><h3  id="new" class="h3 pt-3">Menu pour les nouveaux commandes</h3></center>
                    
                    
                    
                    
                    <%
        response.setContentType("text/html;charset=UTF-8");
        String client = "client";
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/gestion_restaurant", "root","");
                                String query = "select * from facture order by id_facture desc limit 1";
                                Statement st = con.createStatement();

                                rs = st.executeQuery(query);%>
                                
                                
                        <div >
                           <%
                                while(rs.next()){
                                    String id_newfact = rs.getString("id_facture");
                            %>
                           
                            <label> Facture n°: <%=rs.getString("id_facture")%></label>
                        </div>
<%
                                String query9 = "select menu.id_plat, menu.nom_plat, commande1.id_commade1, commande1.qte from menu join commande1 on(menu.id_plat = commande1.id_plat) where commande1.etat='new'";
                                Statement st9 = con.createStatement();

                                rs = st9.executeQuery(query9);%>
                                
                                
                    <div class="row">
                        <div class=" col-sm-8">
                            <b>Les plats commander: </b>
                           <%
                                while(rs.next()){
                                    String id_new = rs.getString("id_plat");
                                    String id_c = rs.getString("id_commade1");
                            %>
                           
                            <p> -<%=rs.getString("nom_plat")%>: <%=rs.getString("qte")%> <a href="delete_new_commande.jsp?id=<%=id_c%>"><button class="btn btn-outline-danger">Delete</button></a> </p>
                            <%
                                }
                            %>
                        </div>
                        
                        
                        
                        
                        
                        
                        
                        
                        
                       
                         
                        <div class="col-sm-4">
                            <a href="commande_emporter.jsp?id=<%=id_newfact%>"><button  class="btn btn-outline-success mt-2">Emporter</button></a> 
                            <a href="commande_sur_table.jsp?id=<%=id_newfact%>"><button  class="btn btn-outline-success mt-2">Sur table</button></a>
                        </div><%
                                }
                            %>
                    </div>
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    <table id="tbl-table" class="table table-responsive table-bordered" cellpadding="0" width="100%">
                        <thead>
                            <tr>
                                <th>Nom plat</th>
                                <th>Prix unitaire</th>
                                <th>Identifiant</th>
                                <th>Qantité</th>
                                <th>Action</th>
                            </tr>

                            <%
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost/gestion_restaurant", "root","");

                                String query2 = "select * from menu";
                                Statement st2 = con.createStatement();

                                rs = st2.executeQuery(query2);
                                while(rs.next()){
                                    String id = rs.getString("id_plat");
                            %>
                            <tr>
                                <td><%=rs.getString("nom_plat")%></td>
                                <td><%=rs.getString("pu")%></td>
                                    <form method="post" action="#">
                                <td>
                                        <input value="<%=id%>" name="id" id="id" readonly>
                                </td>
                                <td>
                                        <input type="number" name="qte" id="qte" required>
                                </td>
                                <td>
                                        <input type="submit"  class="btn btn-outline-success mt-2" name="command" id="command" value="Commander"/>
                                </td>
                                    </form>
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
