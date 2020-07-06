<%-- 
    Document   : formularioUsuario
    Created on : 1/07/2020, 02:47:47 PM
    Author     : ACER
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAO.*"%>
<%@page import="config.Conexion"%>

<%
    String idS = request.getParameter("id");
    String titulo = "Formulario de registro";
    String form = "agregarUsuario.jsp";
    String descBoton = "Registrar usuario";

    String nombre = "";
    String edad = "";
    String telefono = "";
    String email = "";
    boolean editar = false;

    if (idS != null && idS != "") {

        Conexion conexion = new Conexion();
        UsuarioBD usuarioBD = new UsuarioBD();

        titulo = "Actualiza tus datos";
        form = "actualizarUsuario.jsp";
        descBoton = "Actualizar usuario";
        editar = true;

        Usuario usuario = usuarioBD.obtenerUsuarioPorId(conexion.getConexion(), Integer.parseInt(idS));

        if (usuario != null) {
            nombre = usuario.getNombre();
            edad = usuario.getEdad() + "";
            telefono = usuario.getTelefono();
            email = usuario.getCorreo();
        }
    }

%>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=titulo%> || Formulario</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    </head>
    <body>
        <div class="container" style="text-align: center;padding-top: 30px;">

            <div class="row">  
                <div class="col-md-3">

                </div>
                <div class="col-md-6">
                    <a class="btn btn-info btn-block" href="index.jsp">Regresar a inicio</a>
                    <br>
                </div>
            </div>


            <div class="row">  

                <div class="col-md-3">

                </div>
                <div class="col-md-6" style="background-color: #E5E5E5; border-radius: 10px;">
                    <br>
                    <h1><%=titulo%></h1>
                    <p>Ingresa los datos que se solicitan</p>

                    <hr>

                    <form action="<%=form%>" method="POST">
                        <div class="form-group">
                            <label for="nombre">Nombre</label>
                            <input value="<%=nombre%>" type="text" class="form-control" id="nombre" name="nombre" required>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="edad">Edad</label>
                                    <input value="<%=edad%>" type="number" class="form-control" id="edad" name="edad" required>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="form-group">
                                    <label for="telefono">Teléfono</label>
                                    <input value="<%=telefono%>" type="number" class="form-control" id="telefono" name="telefono" required>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="email">Email</label>
                            <input value="<%=email%>" type="email" class="form-control" id="email" name="email" required>
                        </div>

                        <% if (!editar) { %>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" class="form-control" id="password" name="password">
                        </div>
                        <% } else {%>
                        <input type="hidden" value="<%=idS%>" name="id">
                        <%}%>

                        <button type="submit" class="btn btn-primary"><%=descBoton%></button>
                    </form>
                    <br>
                </div>
            </div>
        </div>
    </body>
</html>
