<%-- 
    Document   : index
    Created on : 26/05/2020, 10:29:39 AM
    Author     : José Enrique Zempoaltecatl Moyotl
--%>
<%
    String numero1 = request.getParameter("numero1");
    String numero2 = request.getParameter("numero2");
    String estado = request.getParameter("enviar");
    String valor = request.getParameter("opcion");

    String errorForm = "";
    int n1 = 0, n2 = 0, may = 0, men = 0, val = 0;
    boolean mostrarRes = false;

    if (estado != null) {
        if (!numero1.isEmpty() && !numero2.isEmpty()) {

            n1 = Integer.parseInt(numero1);
            n2 = Integer.parseInt(numero2);
            val = Integer.parseInt(valor);

            may = n1;
            men = n2;

            if (n2 > n1) {
                may = n2;
                men = n1;
            }

            mostrarRes = true;

        } else {
            errorForm = "Ingresa los dos numeros";
        }
    }

    
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>La chida página web</title>
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
                border-spacing: 2px 5px;
            }
            select{
                width: 130px;
                height: 25px;
                outline: none;
                border: none;
                cursor: pointer;
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
            <h2>Ordenacion de números</h2>
            <p>
                <b>Descripcion práctica:</b> Se pide al usuario 2 números y se muestran en el orden <br>
                que indique el usuario( ascendete o descendente)<br><br>
                Usaré método <b>GET</b> by: Jose Enrique Zempoaltecatl Moyotl
            </p>
            <hr>
            <p>
                <b>Ordenando números</b><br>
                Ingresa los datos que se solicitan
            </p>
            <form method="GET">
                <table>
                    <tr>
                        <td>Numero 1</td>
                        <td><input type="number" name="numero1"/></td>
                    </tr>
                    <tr>
                        <td>Numero 2</td>
                        <td><input type="number" name="numero2"/></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <select name="opcion">
                                <option value="1">Ascendente</option>
                                <option value="2">Descendente</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="submit" name="enviar"/></td>
                    </tr>
                </table>
            </form>

            <p class="error_form"><%out.println(errorForm);%></p>
            <p>
                <%if (mostrarRes) {
                    if (val == 1) {
                        out.println(men + " < " + may);
                    } else {
                        out.println(may + " > " + men);
                    }
                }%>
            </p>
        </div>
    </body>
</html>
