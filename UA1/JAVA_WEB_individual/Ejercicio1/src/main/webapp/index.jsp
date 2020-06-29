<%-- 
    Document   : index
    Created on : 25/05/2020, 07:31:25 PM
    Author     : José Enrique Zempoaltecatl Moyotl
--%>
<%
    String estado = request.getParameter("enviar");
    String reprobados = request.getParameter("reprobados");
    String aprobados = request.getParameter("aprobados");

    String errorForm = "";
    int nr = 0, na = 0, alumnos = 0;
    float pnr = 0, pna = 0;
    boolean mostrarResultados = false;

    if (estado != null && reprobados != null && aprobados != null) {

        if (!reprobados.isEmpty() && !aprobados.isEmpty()) {

            nr = Integer.parseInt(reprobados);
            na = Integer.parseInt(aprobados);

            if (!(nr < 0 || na < 0) && !(nr == na && na == 0)) {

                alumnos = nr + na;

                pnr = (float) nr * 100 / alumnos;
                pna = (float) na * 100 / alumnos;
                
                mostrarResultados = true;

            } else {
                errorForm = "Ingresa correcta mente los datos";
            }

        } else {
            errorForm = "Ingresa los datos";
        }

    }

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Control de alumnos</title>
        <style>
            body{
                background-color: white;
                font-family: sans-serif;
                text-align: center;
                color: white;
            }
            .contenedor-main{
                background-color: rgba(13, 108, 148, .80);
                margin: 30px;
                padding: 30px;
                border-radius: 10px;
                height: auto;
            }
            input{
                outline: none;
                border: none;
                height: 25px;
                border-radius: 5px;
            }
            input[type="submit"]{
                cursor: pointer;
                width: 100px;
                background-color: rgb(209, 219, 224);   
            }
            hr{
                margin-bottom: 40px;
                margin-top: 40px;
            }
            .error_form{
                color: #c0c0c0;
                font-size: 13px;
                font-weight: bold;
            }
            table{
                margin: auto;
                margin-top: 40px;
                padding: 10px;
                background-color: rgba(0, 0, 0, .7); 
                border-radius: 10px;
                font-size: 14px;
                vertical-align: middle;
            }
        </style>
    </head>
    <body>
        <div class="contenedor-main">
            <h2>Porcentaje de alumnos</h2>
            <p>
                <b>Descripcion práctica:</b> Un maestro quiere saber cuál es el porcentaje de alumnos reprobados. <br>
                Elabore un programa que pregunte la cantidad de alumnos aprobados y la cantidad de alumnos reprobados <br>
                e imprime el porcentaje de aprobados y reprobados.<br><br>
                Usaré método <b>GET</b> by: Jose Enrique Zempoaltecatl Moyotl
            </p>
            <hr>
            <p>
                <b>Generador</b><br>
                Ingresa los datos del grupo respectivamente
            </p>
            <form>
                <label for="reprobados">Reprobados: </label>
                <input type="number" name="reprobados" id="reprobados"/>

                <label for="aprobados">Aprobados: </label>
                <input type="number" name="aprobados" id="aprobados"/>

                <input type="submit" name="enviar"/>
            </form>

            <%if (mostrarResultados) { %>
            <table>
                <tr>
                    <th colspan="3">CALCULO DE LOS DATOS</th> 
                </tr>
                <tr>
                    <th>Descripción</th> 
                    <th>Total</th>
                    <th>Porcentaje</th>
                </tr>
                <tr>
                    <th>Alumnos totales</th> 
                    <td><%out.println(alumnos);%></td>
                    <td>100%</td>
                </tr>
                <tr>
                    <th>Alumnos reprobados</th> 
                    <td><%out.println(nr);%></td>
                    <td><%out.println(pnr);%>%</td>
                </tr>
                <tr>
                    <th>Alumnos aprobados</th> 
                    <td><%out.println(na);%></td>
                    <td><%out.println(pna);%>%</td>
                </tr>
            </table>    
            
            <% } else { %>
            
            <p class="error_form"><%out.println(errorForm);%></p>
            
            <% } %>
        </div>
    </body>
</html>
