/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.awt.Color;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.renderer.category.BarRenderer;
import org.jfree.data.statistics.HistogramDataset;

/**
 *
 * @author Manda
 */
@WebServlet(urlPatterns = {"/Histogramme"})
public class Histogramme extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            response.setContentType("image/png");
        try(OutputStream out = response.getOutputStream()){
            HistogramDataset dataset = new HistogramDataset();
            double[] values = {2.0,2.0,2.0,4.0,5.0,6.0,5.0,8.0,9.0,8.0,7.0,6.0,0.0,3.3,4.0, 6.0, 2.0,1.2,1.3,4.0,4.3,4.3};

            dataset.addSeries("Histogram", values, 10);
            JFreeChart histo = ChartFactory.createHistogram("histogram exemple", "values","frequency", dataset, PlotOrientation.VERTICAL, true, true, true);
            ChartUtilities.writeChartAsPNG(out, histo, 800, 600);
            }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
