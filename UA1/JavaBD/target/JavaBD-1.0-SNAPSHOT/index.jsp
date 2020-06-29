<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%-- 
    Document   : index
    Created on : 29/05/2020, 09:07:53 AM
    Author     : José Enriqeu Zempoaltecatl Moyotl
--%>

<%
    Connection conexion = null;
    Statement stmt = null;
    ResultSet rs = null;
    
    try{
        
        Class.forName("com.mysql.jdbc.Driver");
        conexion = DriverManager.getConnection("jdbc:mysql://localhost/usuarios?serverTimezone=UTC", "root", "");
        stmt = conexion.createStatement();
        rs = stmt.executeQuery("Select * from usuarios");
        
        while(rs.next()){
            out.println(rs.getString(1));
            out.println(rs.getString(2));
            out.println(rs.getString(3));
        }
        
    }catch(Exception e){
        out.println("SQL ERROR: " + e);
        out.println("");
    }
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
