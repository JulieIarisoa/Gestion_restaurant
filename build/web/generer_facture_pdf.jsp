<%-- 
    Document   : generer_facture_pdf
    Created on : 29 juin 2024, 15:30:34
    Author     : Manda
--%>

<%@page import="com.itextpdf.text.Chunk"%>
<%@page import="com.itextpdf.text.Font"%>
<%@page import="com.itextpdf.text.BaseColor"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.itextpdf.text.Document"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="com.itextpdf.text.pdf.PdfPCell"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.pdf.PdfPTable"%>
<%@page import="com.itextpdf.text.pdf.PdfPTable"%>
<%@page contentType="application/pdf" pageEncoding="UTF-8"%>
        <%
            
            Connection con;
            PreparedStatement pst;
            ResultSet rs;
            Class.forName("com.mysql.jdbc.Driver");
            Integer id = Integer.parseInt(request.getParameter("id"));
            con = DriverManager.getConnection("jdbc:mysql://localhost/gestion_restaurant", "root","");
            
            Document doc = new Document();
            PdfWriter pdf = PdfWriter.getInstance(doc,response.getOutputStream());
            doc.open();
            
            
            
            Font titreF = new Font(Font.FontFamily.TIMES_ROMAN,16,Font.NORMAL,BaseColor.BLACK);
            Font sou_titreF = new Font(Font.FontFamily.TIMES_ROMAN,14,Font.NORMAL,BaseColor.BLACK);
            Chunk titre = new Chunk("                                           NOM DU RESTAURANT",titreF);
            doc.add(new Paragraph(titre));
            doc.add(new Paragraph(" "));
            String query2 = "select facture.id_facture, UPPER(facture.nom_cli) as nom_cli,commande1.id_table from commande1,facture where commande1.id_facture=facture.id_facture and commande1.id_facture="+id;
            Statement st2 = con.createStatement();
            rs = st2.executeQuery(query2);
            if(rs.next()){
                Chunk code_fact = new Chunk("                                                         Code Facture: A00"+rs.getString("id_facture") ,sou_titreF);
                Chunk nom_cli = new Chunk("Nom du client: "+rs.getString("nom_cli"),sou_titreF);
                Chunk design = new Chunk("Designation: "+rs.getString("id_table"),sou_titreF);
                    doc.add(new Paragraph(code_fact));
                    doc.add(new Paragraph(nom_cli));
                    doc.add(new Paragraph(design));
            }
            
            
                Chunk detail = new Chunk("                                                         Votre facture en détail" ,sou_titreF);
                doc.add(new Paragraph(detail));
                doc.add(new Paragraph(" "));
                
                
                
            PdfPTable table = new PdfPTable(4);
            PdfPCell cell1 = new PdfPCell(new Paragraph(" Menu"));
            PdfPCell cell2 = new PdfPCell(new Paragraph(" PU (Ar) "));
            PdfPCell cell3 = new PdfPCell(new Paragraph(" Unité"));
            PdfPCell cell4 = new PdfPCell(new Paragraph(" Total (Ar) "));
            table.addCell(cell1);
            table.addCell(cell2);
            table.addCell(cell3);
            table.addCell(cell4);
            Integer tot = null;
            String query = "select menu.nom_plat, menu.pu, commande1.qte, menu.pu*commande1.qte as sous_tot from commande1,facture,menu where commande1.id_plat = menu.id_plat and commande1.id_facture=facture.id_facture and commande1.id_facture="+id;
            Statement st = con.createStatement();
            rs = st.executeQuery(query);
            for(int i=0; i<1000000; i++){
            while(rs.next()){
                table.addCell(rs.getString("nom_plat"));
                table.addCell(rs.getString("pu"));
                table.addCell(rs.getString("qte"));
                table.addCell(rs.getString("sous_tot"));
            }
            }
            
            doc.add(table);
            
            String query1 = "select SUM(menu.pu*commande1.qte) as tot from commande1,facture,menu where commande1.id_plat = menu.id_plat and commande1.id_facture=facture.id_facture and commande1.id_facture="+id;
            Statement st1 = con.createStatement();
            rs = st1.executeQuery(query1);
            while(rs.next()){
                Chunk total = new Chunk("                                                                                                   TOTAL :"+rs.getString("tot")+"  Ariary ",sou_titreF);
                doc.add(new Paragraph(total));
            }
            
            doc.close();
        %>
