<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import ="java.sql.*" %>

<%

String email = request.getParameter("email");
String password = request.getParameter("password");
String name=request.getParameter("name");

try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql?zeroDateTimeBehavior=CONVERT_TO_NULL","root","root");
	PreparedStatement ps = con.prepareStatement("insert into login(name,email,password) values(?,?,?);");
	ps.setString(1,name);
        ps.setString(2, email);
	ps.setString(3, password);
	int result = ps.executeUpdate();
	if(result>0)
		response.sendRedirect("index2.html");
} 
catch(Exception e){
	
	out.println(e);
}






%>