<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="java.sql.*" %>
    <%
    		String nom = request.getParameter("nom");
    		
    		Connection con;
    		PreparedStatement pat;
    		ResultSet rs;
    		
    		Class.forName("com.mysql.jdbc.Driver");
    		con = DriverManager.getConnection("jdbc:mysql://localhost/jsp_test","root","");
    		pat = con.prepareStatement("insert into table(nom) values(?)");
    		pat.setString(1, nom);
    		pat.executeUpdate();
    		%>
    		<script>
    			alert("okkkk")
    		</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title herecqsxcsqd</title>
</head>
<body>

</body>
</html>