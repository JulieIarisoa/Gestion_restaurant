
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(request.getParameter("submit1")!=null){
        String id_reserver = request.getParameter("id_reserver");
        String id_table = request.getParameter("id_table");
        String date_reserver = request.getParameter("date_reserver");
        String nom_cli = request.getParameter("nom_cli");
        
        
        SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
        Date date_rer = formater.parse(date_reserver);
        
        java.sql.Date sqlDate_rer = new java.sql.Date(date_rer.getTime());
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/gestion_restaurant", "root","");
        pst = con.prepareStatement("insert into reserver(id_reserver, id_table, date_reservation, date_reserver, nom_cli) values(?,?,NOW(),?,?)");
        pst.setString(1, id_reserver);
        pst.setString(2, id_table);
        pst.setDate(3, sqlDate_rer);
        pst.setString(4, nom_cli);
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
<%
        String date_reserver = request.getParameter("date_reserver");
        
        
        SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
        Date date_rer = formater.parse(date_reserver);
        
        java.sql.Date sqlDate_rer = new java.sql.Date(date_rer.getTime());
        
            Connection con;
            PreparedStatement pst;
            ResultSet rs;

            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/gestion_restaurant", "root","");
            /*String query9 = "select table_resto.designation as design,table_resto.id_table from table_resto join reserver on(table_resto.id_table = reserver.id_table) where table_resto.id_table != (select id_table from reserver where date_reserver=?) group by table_resto.id_table order by table_resto.id_table ";*/
            String query9 = "select * from table_resto where id_table not in (select id_table from reserver where date_reserver=? )";
            /*Statement st9 = con.createStatement();*/
             pst = con.prepareStatement(query9);
             pst.setDate(1, sqlDate_rer);
            rs = pst.executeQuery();
        %>
        
        
        
        
        
        <center>
        <div class="p-3 w-25 mt-5 bg-light shadow-sm">
            <h5>Reserver table</h5>
        
        <form action="#" method="POST">
                    <div align="left">
            <label>Identifiant reservation</label>
            <input type="text" class="form-control" placeholder="Identifiant" name="id_reserver" id="id_reserver" required>
                    </div>
                    <div align="left">
            <label>Date reserver</label>
            <input type="date" class="form-control" placeholder="date reserver" value="<%=request.getParameter("date_reserver")%>" name="date_reserver" id="date_reserver" readonly>
                    </div>
                    <div align="left">
            <label>Nom client</label>
            <input type="text" class="form-control" placeholder="Nom du client" name="nom_cli" id="nom_cli" required>
                    </div>
                    <div align="left">
            <label>Table reserve</label>
           <select class="form-control" placeholder="Designation" name="id_table" id="id_table">
                <%
                    while(rs.next()){
                    String id_new = rs.getString("id_table");
                    System.out.println(id_new);
                %>
                    <option value="<%=rs.getString("id_table")%>"><%=rs.getString("designation")%></option>
                <%
                    }

    %>
            </select>
            
                    </div>
                <div align="right">
                    <input type="submit" class="btn btn-outline-success mt-2" name="submit1" id="submit1" value="Ajouter">
                    <input type="reset" class="btn btn-outline-warning mt-2" name="annuler" id="annuler" value="Annuler">
                </div>
        </form>
    </body>
</html>
