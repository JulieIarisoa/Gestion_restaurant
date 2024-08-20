<%-- 
    Document   : list_client
    Created on : 28 juin 2024, 17:02:59
    Author     : Manda
--%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
<%
        String date_reserver = request.getParameter("date_reserver");
        String date_reserver1 = request.getParameter("date_reserver1");
        
        
        SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
        Date date_rer = formater.parse(date_reserver);
        Date date_rer1 = formater.parse(date_reserver1);
        
        java.sql.Date sqlDate_rer = new java.sql.Date(date_rer.getTime());
        java.sql.Date sqlDate_rer1 = new java.sql.Date(date_rer1.getTime());%>
    <body>
        <div class="col-sm-8 bg-light shadow-sm rounded-3 m-3">
            <div class="panel-body">
            <center><h5  class="h5 pt-3">Liste des clients entre   <%=sqlDate_rer%> et   <%=sqlDate_rer1%></h5></center>
                <table id="tbl-table" class="table table-responsive table-bordered" cellpadding="0" width="100%">
                    <thead>
                        <tr>
                            <th>Identifiant</th>
                            <th>Nom client</th>
                            <th>Date facture</th>
                        </tr><%
        
            Connection con;
            PreparedStatement pst;
            ResultSet rs;

            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/gestion_restaurant", "root","");
            String query9 = null;
            query9 = "select * from facture where date_facture between ? and ? or  date_facture between ? and ?";
            /*Statement st9 = con.createStatement();*/
             pst = con.prepareStatement(query9);
             pst.setDate(1, sqlDate_rer);
             pst.setDate(2, sqlDate_rer1);
             pst.setDate(3, sqlDate_rer1);
             pst.setDate(4, sqlDate_rer);
            rs = pst.executeQuery();
            System.out.println(sqlDate_rer);
        %>
        
        
                <%
                    while(rs.next()){
                    String id_new = rs.getString("id_facture");
                %>
                        <tr>
                            <td><%=rs.getString("id_facture")%></td>
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
