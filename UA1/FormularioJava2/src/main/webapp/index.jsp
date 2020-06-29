
<%
    String num = request.getParameter("numero");
    String estado = request.getParameter("enviar");

    String titularForm = "Ingresa un numero";
    String errorForm = "";
    boolean mostrarForm = true;

    int lim = 0;

    if (num != null && !estado.equals("Regresar")) {
        if (!num.isEmpty()) {

            lim = Integer.parseInt(num);

            if (lim >= 0) {

                titularForm = "Volver al generador";
                mostrarForm = false;

            } else {
                errorForm = "Ingresa un numero positivo";
            }

        } else {
            errorForm = "Ingresa un numero";
        }
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulario con jsp</title>
        <style>
            *{
                font-family: sans-serif;
                text-align: center;
            }
            .error_form{
                color: red;
                font-size: 13px;
                font-weight: bold;
            }
        </style>
    </head>
    <body>

        <h2>Formulario WEB HTML y JAVA .jsp</h2>
        <p>
            <b>Descripcion práctica: </b>

            formulario que pida un número y que imprima en pantalla del 0 al número que haya colocado el usuario, <br>
            que desaparezca el formulario al darle click. <br>
            Y que aparezca la opción de regresar al darle click desaparezca los números impresos y aparezca de nuevo el formulario.<br><br>
            Usaré método <b>GET</b> by: Jose Enrique Zempoaltecatl Moyotl
        </p>
        <hr>
        <p>
            <b>Generador</b><br>
            <%out.println(titularForm);%>
        </p>

        <form method="GET">
            <input type="<%if (mostrarForm) {%>number<%} else {%>hidden<%}%>" name="numero">
            <input type="submit" name="enviar" value="<%if (mostrarForm) {%>Generar<%} else {%>Regresar<%}%>">
        </form>

        <p><%if (!mostrarForm) {int i = 0;while (i <= lim) {out.println(i);i++;}}%></p>
        <p class="error_form"><%out.println(errorForm);%></p>

    </body>
</html>

