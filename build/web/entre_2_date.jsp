<%-- 
    Document   : entre_2_date
    Created on : 30 juin 2024, 14:35:05
    Author     : Manda
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <div class="col-sm-8">
            <div class="panel-body">
                <table id="tbl-table" class="table table-responsive table-bordered" cellpadding="0" width="100%">
                    <thead>
                        <tr>
                            <th>Nom client</th>
                            <th>date</th>
                        </tr>
                        
                        <%
                                Connection con;
                                PreparedStatement pst;
                                ResultSet rs;

                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost/gestion_restaurant", "root","");
                                
                            String query = "select * from facture where date_facture between '2024-06-01' and '2024-06-29'";
                            Statement st = con.createStatement();
                            
                            rs = st.executeQuery(query);
                            while(rs.next()){
                                String id = rs.getString("id_facture");
                        %>
                        <tr>
                            <td><%=rs.getString("nom_cli")%></td>
                            <td><%=rs.getString("date_facture")%></td> 
                        </tr>
                        <%
                            }
                        %>
                    </thead>
                </table>
                    
                    
                  
    </body>
</html>
