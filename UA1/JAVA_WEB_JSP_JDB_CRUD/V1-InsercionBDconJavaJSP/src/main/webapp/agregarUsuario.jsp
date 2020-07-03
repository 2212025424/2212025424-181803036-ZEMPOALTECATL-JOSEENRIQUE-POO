<%-- 
    Document   : agregarUsuario
    Created on : 3/07/2020, 09:41:19 AM
    Author     : ACER
--%>

<%@page import="script.MD5"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>

<%

    String mensaje = null;
    boolean insertado = false;

    String nombre = request.getParameter("nombre");
    String edad = request.getParameter("edad");
    String telefono = request.getParameter("telefono");
    String correo = request.getParameter("email");
    String password = request.getParameter("password");

    if (nombre != null && edad != null && telefono != null && correo != null && password != null && nombre != "" && edad != "" && telefono != "" && correo != "" && password != "") {

        Connection conexion = null;
        Statement st = null;

        try {

            password = MD5.getMd5(password);

            Class.forName("com.mysql.jdbc.Driver");
            conexion = DriverManager.getConnection("jdbc:mysql://localhost/usuarios?serverTimezone=UTC", "root", "");
            st = conexion.createStatement();
            st.executeUpdate("INSERT INTO usuario SET nombre='" + nombre + "',edad=" + edad + ",telefono='" + telefono + "',correo='" + correo + "',password='" + password + "' ");

            mensaje = "El usuario se ha insertado de forma correcta";
            insertado = true;

        } catch (SQLException e) {
            mensaje = "ERROR en la conexion a la base de datos: " + e.getMessage();
        } catch (Exception e) {
            mensaje = "ERROR: " + e.getMessage();
        }
    } else {
        mensaje = "Ha ocurrido un error al ingresar a la página.";
    }

%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insertar Usuario || Agregar usuario || formulario de registro</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    </head>
    <body>
        <div class="container" style="text-align: center; padding-top: 30px;">
            <h1>Resultados</h1>
            <p>EL resultado del proceso de insertar un usuario se muestra a continuación</p>
            <div class="row">
                <div class="col-md-3">
                </div>
                <div class="col-md-6" style="text-align: center">
                    <% if (insertado) {%>
                    <div class="alert alert-success" role="alert">
                        <%out.print(mensaje);%>
                    </div>
                    <a href="formularioUsuario.jsp" type="button" class="btn btn-primary">Insertar otro Usuario</a>
                    <a href="index.jsp" type="button" class="btn btn-success">Ver registros</a>
                    <%} else {%>
                    <div class="alert alert-danger" role="alert">
                        <%out.print(mensaje);%>
                    </div>
                    <a href="index.jsp" type="button" class="btn btn-primary">Volver a inicio</a>
                    <a href="formularioUsuario.jsp" type="button" class="btn btn-success">Volver a formulario</a>
                    <%}%>
                </div>
            </div>
        </div>
    </body>
</html>
