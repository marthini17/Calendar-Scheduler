<%@page import="java.awt.SystemColor.*"%>
<%--<%@page import="java.awt.SystemColor.window"%>--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import ="java.sql.*" %>

<%

String email = request.getParameter("email");
String password = request.getParameter("password");

try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql?zeroDateTimeBehavior=CONVERT_TO_NULL","root","root");
	if (email != null && password != null) {
        String sql = "Select * from login Where email='" + email + "' and password='" + password + "'";
     // create the java statement
        Statement st = con.createStatement();
     // execute the query, and get a java resultset
        ResultSet rs = st.executeQuery(sql);
        if (rs.next()) {
        	response.sendRedirect("index2.html");
        } else {
        %>
        <script>
        	alert("Invalid username or password");
                 window.location.href = "index.html";
                </script>
                <%
                
        }
    }
} 
catch(Exception e){
	
	out.println(e);
}






%>
<!DOCTYPE html>
<html>

<body>
  
</body>
</html>