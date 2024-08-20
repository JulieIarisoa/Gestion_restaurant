<%-- 
    Document   : Histogramme
    Created on : 29 juin 2024, 15:34:52
    Author     : Manda
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.jfree.chart.ChartUtilities"%>
<%@page import="org.jfree.chart.plot.PlotOrientation"%>
<%@page import="org.jfree.chart.JFreeChart"%>
<%@page import="org.jfree.chart.ChartFactory"%>
<%@page import="org.jfree.data.statistics.HistogramDataset"%>
<%@page contentType="image/png"%>
<%
                            Connection con;
                            PreparedStatement pst;
                            ResultSet rs;

                            Class.forName("com.mysql.jdbc.Driver");
                            con = DriverManager.getConnection("jdbc:mysql://localhost/gestion_restaurant", "root","");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <%
        /*String query = "select commande1.id_plat,count(commande1.id_plat) as nb from commande1 join menu on (commande1.id_plat = menu.id_plat) group by id_plat";*/
        String query = "select qte from commande1 ";
    Statement st = con.createStatement();
    rs = st.executeQuery(query);
    Integer id1 = null;
    HistogramDataset dataset = new HistogramDataset();
    while(rs.next()){
            String id = rs.getString("qte");
            id1 = Integer.parseInt(id);
            double[] values = {};
            /*double[] values = {10.0,15.5,20.0,25.3,30.1,50.2,60.9,5.2,73.6,99.1};*/
            dataset.addSeries("Histogram", values, 10);
            JFreeChart histo = ChartFactory.createHistogram("histogram exemple", "values","frequency", dataset, PlotOrientation.VERTICAL, true, true, true);
            ChartUtilities.writeChartAsPNG(response.getOutputStream(), histo, 800, 600);
    }
            System.out.println(id1);
        %>
    </body>
</html>
