<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulario con jsp</title>
    </head>
    <body>

    <center>
        <h1>Formulario Web</h1>
        <h2>HTML y JAVA .jsp</h2>
        <p><b>Descripcion práctica: </b>Solicitar un número y que imprima en pantalla del 0 al número que se haya colocado. <br>
            Usaremos método <b>GET</b> by: Jose Enrique Zempoaltecatl Moyotl</p>
        <hr>
        <p>Ingrese un número..</p>

        <form method="GET">
            <input type="number" name="limite">
            <input type="submit" name="enviar">
        </form>

        <%

            String estado = request.getParameter("enviar");
            String lim = request.getParameter("limite");

            if (estado != null && lim != null && !lim.isEmpty()) {

                out.println("<br>");

                for (int i = 0; i <= Integer.parseInt(lim); i++) {

                    out.print(i + ", ");

                }

            } else {
                out.println("<br> <p>Ingresa un numero</p>");
            }

        %>




    </center>

</body>
</html>
