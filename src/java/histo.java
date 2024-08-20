/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.data.general.DefaultPieDataset;

/**
 *
 * @author Manda
 */
@WebServlet(urlPatterns = {"/histo"})
public class histo extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        DefaultPieDataset dataset = new DefaultPieDataset();
        
        String url = "jdbc:mysql://localhost/gestion_restaurant";
        String user = "root";
        String password = "";
        
        String query = "SELECT DATE_FORMAT( facture.date_facture, '%Y-%m') AS mois, SUM(menu.pu*commande1.qte) AS total_recettes FROM commande1,facture,menu WHERE commande1.id_plat = menu.id_plat and commande1.id_facture=facture.id_facture and facture.date_facture>= DATE_FORMAT(DATE_SUB( CURDATE(), INTERVAL 6 MONTH), '%Y-%m-01') GROUP BY DATE_FORMAT(facture.date_facture, '%Y-%m') ORDER BY mois";
        
        try(Connection con = DriverManager.getConnection(url,user,password);
            PreparedStatement stmt = con.prepareStatement(query);
            ResultSet rs = stmt.executeQuery()){
            
            while(rs.next()){
                String mois = rs.getString("mois");
                Double totaleRecettes = rs.getDouble("total_recettes");
                dataset.setValue(mois, totaleRecettes);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        
        JFreeChart chart = ChartFactory.createPieChart("Recettes Mensuelles des 6 derniers Mois",dataset,true,true,false);
        
        response.setContentType("image/png");
        ChartUtilities.writeChartAsPNG(response.getOutputStream(), chart, 800, 600);
    }
}
