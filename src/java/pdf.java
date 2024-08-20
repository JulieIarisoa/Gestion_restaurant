/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Manda
 */
@WebServlet(urlPatterns = {"/pdf"})
public class pdf extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, DocumentException, ClassNotFoundException, SQLException {
        response.setContentType("application/pdf");
        
        try(OutputStream out = response.getOutputStream()){
            
            Connection con;
            PreparedStatement pst;
            ResultSet rs;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/gestion_restaurant", "root","");
            String query = "select * from table_resto";
            Statement st = con.createStatement();
            rs = st.executeQuery(query);
            Document doc = new Document();
            PdfWriter pdf = PdfWriter.getInstance(doc,out);
            doc.open();
            doc.add(new Paragraph("NOM DU RESTAURANT"));
            doc.add(new Paragraph("Code facture:" + "A0056"));
            doc.add(new Paragraph("Nom du client: Maria"));
            doc.add(new Paragraph("Table: 06"));
            doc.add(new Paragraph("Votre facture en détail"));
            while(rs.next()){
                doc.add(new Paragraph(rs.getString(1)+"     "+rs.getString(2)));
            }
            
            
            
            
            PdfPTable table = new PdfPTable(3);
            PdfPCell cell1 = new PdfPCell(new Paragraph("header1"));
            PdfPCell cell2 = new PdfPCell(new Paragraph("header2"));
            PdfPCell cell3 = new PdfPCell(new Paragraph("header3"));
            
            table.addCell(cell1);
            table.addCell(cell2);
            table.addCell(cell3);
            
            for(int i=0; i<5; i++){
                table.addCell("row" + (i + 1) + ", column 1");
                table.addCell("row" + (i + 1) + ", column 2");
                table.addCell("row" + (i + 1) + ", column 3");
            }
            
            doc.add(table);
            doc.close();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (DocumentException ex) {
            Logger.getLogger(pdf.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(pdf.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(pdf.class.getName()).log(Level.SEVERE, null, ex);
        }
    }


}
