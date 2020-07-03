<%-- 
    Document   : actualizarPassword
    Created on : 3/07/2020, 03:28:13 PM
    Author     : ACER
--%>

<%@page import="script.MD5"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%

    String mensaje = null;
    boolean obtenido = false;
    boolean actualizado = false;

    String id = request.getParameter("id");
    String antiguo = request.getParameter("antiguo");
    String nuevo1 = request.getParameter("nuevo1");
    String nuevo2 = request.getParameter("nuevo2");

    if (id != null && antiguo != null && nuevo1 != null && nuevo2 != null && id != "" && antiguo != "" && nuevo1 != "" && nuevo2 != "") {

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

                if (rs.getString(6).equals(MD5.getMd5(antiguo))) {

                    if (nuevo1.equals(nuevo2)) {
                        st = conexion.createStatement();
                        int res = st.executeUpdate("UPDATE usuario SET password='"+MD5.getMd5(nuevo1)+"' WHERE id="+Integer.parseInt(id)+"");

                        if (res > 0) {

                            actualizado = true;
                            mensaje = "Se ha actualizado la contraseña de [" + rs.getString(2) + "]";

                        } else {
                            mensaje = "Ha ocurrido un error en la operacion";
                        }

                    } else {
                        mensaje = "La nueva contraseña no coincide";
                    }

                } else {
                    mensaje = "Ha ingresado mal el antiguo password";
                }

            } else {
                mensaje = "Ha ocurrido un error en la operación";
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
        <title>Actualizar password || Editar password || Formulario de actualización de contraseña</title>
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
                    <form action="formularioPassword.jsp" method="POST">
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
