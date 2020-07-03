<%-- 
    Document   : index
    Created on : 1/07/2020, 02:09:59 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>   

<%

    Connection conexion = null;
    Statement st = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conexion = DriverManager.getConnection("jdbc:mysql://localhost/usuarios?serverTimezone=UTC", "root", "");
        st = conexion.createStatement();
        rs = st.executeQuery("SELECT * FROM usuario");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio || usuarios registrados || Users Home</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <style>
            svg{
                cursor: pointer; 
            }
            .indiceTabla{
                max-width: 10px;
            }
            .modal{
                color: black;
            }
        </style>
    </head>
    <body>
        <div class="container" style="text-align: center; padding-top: 30px;">
            <h1>Usuarios registrados</h1>
            <p>En la siguiente tabla se muestran los registros de la tabla usuario</p>
            <div class="row">
                <div class="col-md-10">
                </div>
                <div class="col-md-2" style="text-align: center">
                    <a type="button" class="btn btn-primary" href="formularioUsuario.jsp">Agregar Usuario</a>
                </div>
            </div>
            <br>

            <table class="table table-striped table-dark">
                <thead>
                    <tr>
                        <th scope="col" class="indiceTabla">#</th>
                        <th scope="col">nombre</th>
                        <th scope="col">edad</th>
                        <th scope="col">teléfono</th>
                        <th scope="col">correo</th>
                        <th scope="col">password</th>
                        <th colspan="4" scope="col">opciones</th>
                    </tr>
                </thead>
                <tbody>

                    <%
                        int i = 1;
                        while (rs.next()) {
                    %>
                    <tr>
                        <th scope="row" class="indiceTabla"><%=i++%></th>
                        <td><%=rs.getNString(2)%></td>
                        <td><%=rs.getInt(3)%></td>
                        <td><%=rs.getNString(4)%></td>
                        <td><%=rs.getNString(5)%></td>
                        <td><%=rs.getNString(6)%></td>
                        <!--Password-->
                        <td>
                            <form action="formularioPassword.jsp" method="GET">
                                <input type="hidden" value="<%=rs.getInt(1)%>" name="id">
                                <button type="submit" class="btn btn-secondary btn-sm">
                                    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-lock-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M2.5 9a2 2 0 0 1 2-2h7a2 2 0 0 1 2 2v5a2 2 0 0 1-2 2h-7a2 2 0 0 1-2-2V9z"/>
                                    <path fill-rule="evenodd" d="M4.5 4a3.5 3.5 0 1 1 7 0v3h-1V4a2.5 2.5 0 0 0-5 0v3h-1V4z"/>
                                    </svg>
                                </button>
                            </form>
                        </td>
                        <!--Datos generales-->
                        <td>
                            <form action="formularioUsuario.jsp" method="POST">
                                <input type="hidden" value="<%=rs.getInt(1)%>" name="id">
                                <button type="submit" class="btn btn-secondary btn-sm">
                                    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-person-lines-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm7 1.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5zm-2-3a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5zm0-3a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5zm2 9a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5z"/>
                                    </svg>
                                </button>
                            </form>
                        </td>
                        <!--Eliminacion con confirmacion-->
                        <td>
                            <a class="btn btn-info btn-sm" data-toggle="modal" data-target="#exampleModal<%=rs.getString(1)%>">
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5a.5.5 0 0 0-1 0v7a.5.5 0 0 0 1 0v-7z"/>
                                </svg>
                            </a>
                            <!-- Modal -->
                            <div class="modal fade" id="exampleModal<%=rs.getString(1)%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">ADVERTENCIA</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <p>¿Seguro que deseas eliminar de forma permanente a <br>[<%=rs.getString(2)%>]?</p>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-primary" data-dismiss="modal">Cancelar</button>
                                            <form action="eliminarUsuario.jsp" method="POST">
                                                <input type="hidden" value="<%=rs.getString(1)%>" name="id">
                                                <button type="submit" class="btn btn-danger" name="validar" value="si">Eliminar</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </td>
                        <!--Eliminacion espntanea-->
                        <td>
                            <form action="eliminarUsuario.jsp" method="POST">
                                <input type="hidden" value="<%=rs.getString(1)%>" name="id">
                                <button type="submit" class="btn btn-danger btn-sm">
                                    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-exclamation-triangle-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5a.905.905 0 0 0-.9.995l.35 3.507a.552.552 0 0 0 1.1 0l.35-3.507A.905.905 0 0 0 8 5zm.002 6a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/>
                                    </svg>
                                </button>
                            </form>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
        </div>

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>

<%  } catch (SQLException e) {
        out.println("ERROR en la conexion a la base de datos: " + e.getMessage());
    } catch (Exception e) {
        out.println("ERROR: " + e.getMessage());
    }


%>






