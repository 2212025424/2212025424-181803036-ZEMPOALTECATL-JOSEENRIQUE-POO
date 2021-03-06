<%-- 
    Document   : actualizarPassword
    Created on : 3/07/2020, 03:28:13 PM
    Author     : ACER
--%> 

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAO.*"%>
<%@page import="config.Conexion"%>
<%@page import="script.MD5"%>

<%

    String mensaje = null;
    boolean obtenido = false;
    boolean actualizado = false;

    String id = request.getParameter("id");
    String antiguo = request.getParameter("antiguo");
    String nuevo1 = request.getParameter("nuevo1");
    String nuevo2 = request.getParameter("nuevo2");

    if (id != null && antiguo != null && nuevo1 != null && nuevo2 != null && id != "" && antiguo != "" && nuevo1 != "" && nuevo2 != "") {

        Conexion conexion = new Conexion();
        UsuarioBD usuarioBD = new UsuarioBD();

        Usuario usuario = usuarioBD.obtenerUsuarioPorId(conexion.getConexion(), Integer.parseInt(id));

        if (usuario != null) {
            obtenido = true;
            if (usuario.getPassword().equals(MD5.getMd5(antiguo))) {
                if (nuevo1.equals(nuevo2)) {

                    if (usuarioBD.actualizarPasswordUsuario(conexion.getConexion(), nuevo1, Integer.parseInt(id))) {
                        mensaje = "Se ha actualizado la contraseña de [" + usuario.getNombre() + "]";
                        actualizado = true;
                    } else {
                        mensaje = "Ha ocurrido un error en la operacion";
                    }
                } else {
                    mensaje = "La nueva contraseña no coincide";
                }
            } else {
                mensaje = "Ha ingresado mal la contraseña actual";
            }

        } else {
            mensaje = "Ha ocurrido un error en la operación";
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
