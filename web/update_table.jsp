<%-- 
    Document   : update_table
    Created on : 16 juin 2024, 09:10:32
    Author     : Manda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
    if(request.getParameter("submit")!=null){
        String id_table = request.getParameter("id_table");
        String designation_table = request.getParameter("designation_table");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/gestion_restaurant", "root","");
        pst = con.prepareStatement("update table_resto set designation = ? where id_table = ?");
        pst.setString(1, designation_table);
        pst.setString(2, id_table);
        pst.executeUpdate();
        String location = "http://localhost:8080/Gestion_restaurant/index.jsp";
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
                <form method="post" action="#" class="pt-3">
                    <%
                        Connection con;
                        PreparedStatement pst;
                        ResultSet rs;

                        Class.forName("com.mysql.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost/gestion_restaurant", "root","");
                        
                        String id = request.getParameter("id");
                        
                        pst = con.prepareStatement("select * from table_resto where id_table=?");
                        pst.setString(1, id);
                        rs = pst.executeQuery();
                        
                        while(rs.next()){
                        
                    %>
                    <div align="left">
                        <label class="form-label">Identification table</label>
                        <input type="text" class="form-control" placeholder="Identifiant" value="<%=rs.getString("id_table")%>" name="id_table" id="id_table" readonly>
                    </div>

                    <div align="left">
                        <label class="form-label">Designation table</label>
                        <input type="text" class="form-control" placeholder="Designation" value="<%=rs.getString("designation")%>" name="designation_table" id="designation_table" required>
                    </div>

                    <%
                        }
                    %>

                    <div align="right">
                        <input type="submit" class="btn btn-outline-success mt-2" name="submit" id="submit" value="Modifier">
                        <input type="reset" class="btn btn-outline-warning mt-2" name="annuler" id="annuler" value="Annuler">
                    </div>
                </form>
            </div>
                </center>
    </body>
</html>
