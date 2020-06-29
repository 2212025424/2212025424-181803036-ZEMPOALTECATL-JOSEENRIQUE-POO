<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- 
    Document   : index
    Created on : 5/06/2020, 02:17:08 AM
    Author     : ACER
--%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Refresquera</title>
        <style>
            *{
                font-family: sans-serif;
            }
            table, tr, th, td{
                border: solid 1px black;
            }
            td, th{
                padding: 10px 20px;
                text-align: center;
            }
        </style>
    </head>
    <body>
    <center>
        <h1>Bienvenido!</h1>
        En las siguientes tablas se muestran los proveedores y productos de la empresa
        <hr>
        <br>
        <%
            Connection conexion = null;
            Statement stmt = null;
            ResultSet rs = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                conexion = DriverManager.getConnection("jdbc:mysql://localhost/refresquera?serverTimezone=UTC", "root", "");
                stmt = conexion.createStatement();
                rs = stmt.executeQuery("Select * from proveedor");
                out.print("<table>");
                out.print("<tr>");
                out.print("<th colspan='4'>Proveedores de refresco</th>");
                out.print("</tr>");
                out.print("<tr>");
                out.print("<th>Nombre</th>");
                out.print("<th>Codigo postal</th>");
                out.print("<th>Telefono</th>");
                out.print("<th>Correo</th>");
                out.print("</tr>");
                while (rs.next()) {
                    out.print("<tr>");
                    out.print("<td>" + rs.getString(2) + "</td>");
                    out.print("<td>" + rs.getString(3) + "</td>");
                    out.print("<td>" + rs.getString(4) + "</td>");
                    out.print("<td>" + rs.getString(5) + "</td>");
                    out.print("</tr>");
                }
                out.print("</table><br><br>");
                
                rs = stmt.executeQuery("SELECT nombre, nombre, volumen, precio, descripcion FROM proveedor JOIN refresco ON proveedor.IdProveedor=refresco.IdProveedor;");
                out.print("<table>");
                out.print("<tr>");
                out.print("<th colspan='5'>Tabla de refrescos</th>");
                out.print("</tr>");
                out.print("<tr>");
                out.print("<th>Proveedor</th>");
                out.print("<th>Refresco postal</th>");
                out.print("<th>Volumen</th>");
                out.print("<th>Precio</th>");
                out.print("<th>Descripcion</th>");
                out.print("</tr>");
                while (rs.next()) {
                    out.print("<tr>");
                    out.print("<td>" + rs.getString(1) + "</td>");
                    out.print("<td>" + rs.getString(2) + "</td>");
                    out.print("<td>" + rs.getString(3) + "</td>");
                    out.print("<td>" + rs.getString(4) + "</td>");
                    out.print("<td>" + rs.getString(5) + "</td>");
                    out.print("</tr>");
                }
                out.print("</table><br><br>");
                
            } catch (Exception e) {
                out.println("SQL ERROR: " + e);
                out.println("");
            }
        %>

    </center>
</body>
</html>