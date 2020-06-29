<%-- 
    Document   : index
    Created on : 25/05/2020, 07:31:25 PM
    Author     : José Enrique Zempoaltecatl Moyotl
--%>
<%

    String estado = request.getParameter("enviar");
    String puntoAx = request.getParameter("puntoAx");
    String puntoAy = request.getParameter("puntoAy");
    String puntoBx = request.getParameter("puntoBx");
    String puntoBy = request.getParameter("puntoBy");
    String puntoCx = request.getParameter("puntoCx");
    String puntoCy = request.getParameter("puntoCy");

    String errorForm = "", resultado = "";
    int n_puntoAx = 0, n_puntoAy = 0, n_puntoBx = 0, n_puntoBy = 0, n_puntoCx = 0, n_puntoCy = 0;
    float l1 = 0, l2 = 0, l3 = 0;

    if (estado != null) {
        if (!puntoAx.isEmpty() && !puntoAy.isEmpty() && !puntoBx.isEmpty() && !puntoBy.isEmpty() && !puntoCx.isEmpty() && !puntoCy.isEmpty()) {

            n_puntoAx = Integer.parseInt(puntoAx);
            n_puntoAy = Integer.parseInt(puntoAy);
            n_puntoBx = Integer.parseInt(puntoBx);
            n_puntoBy = Integer.parseInt(puntoBy);
            n_puntoCx = Integer.parseInt(puntoCx);
            n_puntoCy = Integer.parseInt(puntoCy);

            if (!(n_puntoAx == n_puntoBx && (n_puntoAx == n_puntoCx)) && !(n_puntoAy == n_puntoBy && (n_puntoAy == n_puntoCy))) {

                if (!((n_puntoAx == n_puntoBx) && (n_puntoAy == n_puntoBy)) && !((n_puntoAx == n_puntoCx) && (n_puntoAy == n_puntoCy)) && !((n_puntoBx == n_puntoCx) && (n_puntoBy == n_puntoCy))) {

                    l1 = (n_puntoAx - n_puntoBx) ^ 2 + (n_puntoAx - n_puntoBx) ^ 2;
                    l2 = (n_puntoAx - n_puntoCx) ^ 2 + (n_puntoAx - n_puntoCx) ^ 2;
                    l3 = (n_puntoBx - n_puntoCx) ^ 2 + (n_puntoBx - n_puntoCx) ^ 2;

                    if (l1 == l2 && l1 == l2 && l2 == l3) {
                        resultado = "El triángulo es equilatero";
                    } else if ((l1 != l2) && (l1 != l3) && (l2 != l3)) {
                        resultado = "El triángulo es escaleno";
                    } else {
                        resultado = "El triángulo es isósceles";
                    }

                } else {
                    errorForm = "ERROR: no puede haber 2 puntos iguales";
                }
            } else {
                errorForm = "ERROR: no más de dos valores repetidos en un eje";
            }

        } else {
            errorForm = "Ingresa todas las coordenadas del trinagulo";
        }
    }


%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Triangulos</title>
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
                width: 50px;
                border-radius: 5px;
            }
            input[type="submit"]{
                cursor: pointer;
                width: 100px;
                background-color: rgb(255,255,255);   
            }
            table{
                margin: auto;
                margin-top: 20px;
                padding: 10px;
                border-radius: 10px;
                font-size: 14px;
                vertical-align: middle;
                border-spacing: 2px 2px;
            }
            .error_form{
                color: #c0c0c0;
                font-size: 13px;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <div class="contenedor-main">
            <h2>Triangulos y tipos</h2>
            <p>
                <b>Descripcion práctica:</b> Programa que indique si un triángulo es equilátero, isósceles y escaleno.<br>
                Validar que los valores ingresados son de un triángulo<br><br>
                Usaré método <b>GET</b> by: Jose Enrique Zempoaltecatl Moyotl
            </p>
            <hr>
            <p>
                <b>Discriminante</b><br>
                Ingresa los datos del triangulo respectivamente
            </p>
            <form method="GET">
                <table>
                    <tr>
                        <td>Punto</td>
                        <td>X</td>
                        <td>Y</td>
                    </tr>
                    <tr>
                        <td>punto A:</td>
                        <td><input type="number" name="puntoAx"/></td>
                        <td><input type="number" name="puntoAy"/></td>
                    </tr>
                    <tr>
                        <td>punto B:</td>
                        <td><input type="number" name="puntoBx"/></td>
                        <td><input type="number" name="puntoBy"/></td>
                    </tr>
                    <tr>
                        <td>punto C:</td>
                        <td><input type="number" name="puntoCx"/></td>
                        <td><input type="number" name="puntoCy"/></td>
                    </tr>
                    <tr>
                        <td colspan="3"><input type="submit" name="enviar"/></td>
                    </tr>
                </table>

                <p class="error_form"><%out.println(errorForm);%></p>
                <p><%out.println(resultado);%></p>

            </form>
        </div>
    </body>
</html>
