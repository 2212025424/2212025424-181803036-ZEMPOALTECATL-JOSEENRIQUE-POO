<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%-- 
    Document   : index
    Created on : 14/06/2020, 03:13:01 PM
    Author     : ACER
--%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Excepciones SQL || inicio sql || Tipo de errores sql</title>
        <style>
            *{
                font-family: sans-serif;
            }
            body{
                padding-left: 30px;
                padding-right: 30px;
            }
        </style>
    </head>
    <body>
    <center>
        <h1>Try and Cach</h1>
        En la siguiente sección se muestra los resultados de un intento de conexion a una base de datos.<br>
        <p>
            <b>Datos de la conexion</b><br>
            Tipo de conexion: mysql - Local<br>
            Nombre de la base de datos: refresquera<br>
            Tipo de usuario: root<br>
            Password: sin password
        </p>
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
                rs = stmt.executeQuery("SELECT * FROM proveedor");

                out.print("La conexion se realizó con éxito");

            } catch (SQLException e) {

                int[] arrErrCodigo = new int[]{0, 1044, 1045, 1146, 1049, 1064};
                String[] arrErrMensaje = new String[]{"No hay conexion a servidor de base de datos, no se encontro un controlador para el mismo.", "Acceso denegado para el usuario a logear a mysql.", "Los datos del usuario en la conexion son incorrectos", "El nombre de la tabla no existe en la base de datos", "No se encuentra la base de datos elegida en el intento de conexion.", "Hay un error de sintaxis en la cosulta."};
                String[] arrErrAyuda = new String[]{"Verfica el tipo de conexion y direccion del sevidor.", "Verifica que el password sea el correcto.", "Verfifica que ingresas correctamente el nombre de usuario.", "Verifica que los nombres de la tablas en las consultas estén correctamente escritos.", "Verifica que el nombre de la base de datos correspoda a la que deseas.", "Verifica la sintaxis y claúsulas de la consulta."};
                boolean noHallado = true;
                int iterador = 0;
                
                while (noHallado && iterador<=5) {
                    if (e.getErrorCode() == arrErrCodigo[iterador]) {
                        out.print("Codigo de error SQL(" + arrErrCodigo[iterador] + ")<br>");
                        out.print("Mensaje de error: " + arrErrMensaje[iterador] + "<br>");
                        out.print("Mesaje de ayuda: " + arrErrAyuda[iterador] + "<br>");
                        noHallado = false;
                    }
                    iterador++;
                }

                if (noHallado) {
                    out.print("ERROR("+ e.getErrorCode() +"): " + e.getMessage());
                }

            } catch (Exception e) {
                out.print("ERROR: " + e.getMessage());
            }
        %>

    </center>
</body>
</html>
