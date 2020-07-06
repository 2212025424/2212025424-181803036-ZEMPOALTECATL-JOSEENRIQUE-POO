<%-- 
    Document   : formularioPassword
    Created on : 3/07/2020, 03:25:00 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%

    String mensaje = null;
    boolean obtenido = true;

    String id = request.getParameter("id");

    if (id == null && id == "") {
        obtenido = false;
        mensaje = "Ha ocurrido un error al ingresar a la página.";
    }


%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Actualizar password usuario || Formulario</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    </head>
    <body>
        <div class="container" style="text-align: center;padding-top: 30px;">

            <div class="row">  

                <div class="col-md-3">

                </div>
                <div class="col-md-6">
                    <a class="btn btn-info btn-block" href="index.jsp">Cancelar acción</a>
                    <br>
                </div>
            </div>

            <div class="row">  

                <div class="col-md-3">

                </div>
                <% if (obtenido) {%>
                <div class="col-md-6" style="background-color: #E5E5E5; border-radius: 10px;">
                    <br>
                    <h1>Acualizar password</h1>
                    <p>Ingresa los datos que se solicitan</p>

                    <hr>

                    <form action="actualizarPassword.jsp" method="GET">
                        <div class="form-group">
                            <label for="antiguo">Antiguo password</label>
                            <input type="password" class="form-control" id="antiguo" name="antiguo" required>
                        </div>

                        <div class="form-group">
                            <label for="nuevo1">Nuevo password</label>
                            <input type="password" class="form-control" id="nuevo1" name="nuevo1" required>
                        </div>

                        <div class="form-group">
                            <label for="nuevo2">Repita password</label>
                            <input type="password" class="form-control" id="nuevo2" name="nuevo2" required>
                        </div>

                        <input type="hidden" value="<%=id%>" name="id">                        

                        <button type="submit" class="btn btn-primary">Enviar datos</button>
                    </form>

                    <br>
                </div>
                <% } else { %>
                <div class="col-md-6">
                    <div class="alert alert-danger" role="alert">
                        <%out.print(mensaje);%>
                    </div>
                    <a href="index.jsp" type="button" class="btn btn-primary">Volver a inicio</a>
                </div>
                <% }%>
            </div>
        </div>
    </body>
</html>
