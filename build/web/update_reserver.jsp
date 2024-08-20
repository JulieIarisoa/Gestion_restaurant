<%-- 
    Document   : update_reserver.jsp
    Created on : 17 juin 2024, 09:31:32
    Author     : Manda
--%>


<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/gestion_restaurant", "root","");
        
    if(request.getParameter("submit")!=null){
        String id_reserver = request.getParameter("id_reserver");
        String id_table = request.getParameter("id_table");
        String date_reserver = request.getParameter("date_reserver");
        String nom_cli = request.getParameter("nom_cli");
        
        
        SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
        Date date_rer = formater.parse(date_reserver);
        
        java.sql.Date sqlDate_rer = new java.sql.Date(date_rer.getTime());
        
        pst = con.prepareStatement("update reserver set id_table=?, date_reserver=?, nom_cli=? where id_reserver=?");
        pst.setString(1, id_table);
        pst.setDate(2, sqlDate_rer);
        pst.setString(3, nom_cli);
        pst.setString(4, id_reserver);
        pst.executeUpdate();
        String location = "http://localhost:8080/Gestion_restaurant/reserver.jsp";
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
            <h5>Modifier table</h5>
        
                <form method="post" action="#">
                    <%
                        
                        String id = request.getParameter("id");
                        
                        pst = con.prepareStatement("select * from reserver where id_reserver=?");
                        pst.setString(1, id);
                        rs = pst.executeQuery();
                        
                        while(rs.next()){
                        
                    %>
                <div align="left">
                    <label class="form-label">Identification reserver</label>
                    <input type="text" class="form-control" placeholder="Identifiant" value="<%=rs.getString("id_reserver")%>" name="id_reserver" id="id_reserver" readonly>
                </div>
                
                <div align="left">
                    <label class="form-label">identification table</label>
                    <input type="text" class="form-control" placeholder="Designation" value="<%=rs.getString("id_table")%>" name="id_table" id="id_table" required>
                </div>
                
                <div align="left">
                    <label class="form-label">date reserver</label>
                    <input type="date" class="form-control" placeholder="date reserver" value="<%=rs.getString("date_reserver")%>" name="date_reserver" id="date_reserver" required>
                </div>
                
                <div align="left">
                    <label class="form-label">Nom du client</label>
                    <input type="text" class="form-control" placeholder="Nom du client" value="<%=rs.getString("nom_cli")%>" name="nom_cli" id="nom_cli" required>
                </div>
                
                <div align="right">
                    <input type="submit" class="btn btn-outline-success mt-2" name="submit" id="submit" value="Modifier">
                    <input type="reset" class="btn btn-outline-warning mt-2" name="annuler" id="annuler" value="Annuler">
                </div>
                    <%
                        }
                    %>

                </form>
            </div>
        </div>
    </body>
</html>
