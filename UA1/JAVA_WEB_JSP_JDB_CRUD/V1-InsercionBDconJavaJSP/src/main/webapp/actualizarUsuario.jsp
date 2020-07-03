<%-- 
    Document   : actualizarUsuario
    Created on : 3/07/2020, 09:41:54 AM
    Author     : ACER
--%>

<%@page import="script.MD5"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%

    String mensaje = null;
    boolean actualizado = false;
    boolean obtenido = false;

    String nombre = request.getParameter("nombre");
    String edad = request.getParameter("edad");
    String telefono = request.getParameter("telefono");
    String correo = request.getParameter("email");
    String id = request.getParameter("id");

    if (nombre != null && edad != null && telefono != null && correo != null && id != null && nombre != "" && edad != "" && telefono != "" && correo != "" && id != "") {

        Connection conexion = null;
        Statement st = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conexion = DriverManager.getConnection("jdbc:mysql://localhost/usuarios?serverTimezone=UTC", "root", "");
            st = conexion.createStatement();

            rs = st.executeQuery("SELECT * FROM usuario WHERE id=" + Integer.parseInt(id) + "");

            if (rs.next()) {

                obtenido = true;

                st = conexion.createStatement();
                int val = st.executeUpdate("UPDATE usuario SET nombre='" + nombre + "', edad=" + edad + ", telefono='" + telefono + "', correo='" + correo + "' WHERE id=" + Integer.parseInt(id) + "");

                if (val > 0) {
                    mensaje = "El usuario [" + rs.getString(2) + "] se ha actualizado de forma correcta";
                    actualizado = true;
                } else {
                    mensaje = "Ha ocurrido un error al relizar la actualizacion";
                }

            } else {
                mensaje = "No se ha encontrado el usuario";
            }

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
        <title>Actualizar usuario || Editar usuario || Formulario de actualización</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    </head>
    <body>
        <div class="container" style="text-align: center; padding-top: 30px;">
            <h1>Resultados</h1>
            <p>EL resultado del proceso de actualizar usuario se muestra a continuación</p>
            <div class="row">
                <div class="col-md-3">
                </div>
                <div class="col-md-6" style="text-align: center">
                    <% if (obtenido) {
                            if (actualizado) { %>
                    <div class="alert alert-success" role="alert">
                        <%out.print(mensaje);%>
                    </div>
                    <a href="index.jsp" type="button" class="btn btn-success">Ver registros</a>
                    <% } else { %>
                    <div class="alert alert-danger" role="alert">
                        <%out.print(mensaje);%>
                    </div>
                    <form action="formularioUsuario.jsp" method="POST">
                        <input type="hidden" value="<%=id%>" name="id">
                        <button type="submit" class="btn btn-info">Reintentar</button>
                    </form>
                    <br>
                    <a href="index.jsp" type="button" class="btn btn-primary">Volver a inicio</a>
                    <%
                        }
                    } else {%>
                    <div class="alert alert-danger" role="alert">
                        <%out.print(mensaje);%>
                    </div>
                    <a href="index.jsp" type="button" class="btn btn-primary">Volver a inicio</a>
                    <%}%>
                </div>
            </div>
        </div>

    </body>
</html>



