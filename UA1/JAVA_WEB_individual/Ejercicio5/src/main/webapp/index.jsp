<%-- 
    Document   : index
    Created on : 26/05/2020, 03:51:07 PM
    Author     : Jose Enrique Zempoaltecatl Moyotl
--%>
<%
    String cantidad = request.getParameter("cantidad");
    String generar = request.getParameter("generar");

    boolean mostrarForm2 = false;
    int cant = 0;

    if (generar != null && !cantidad.isEmpty()) {

        cant = Integer.parseInt(cantidad);

        if (cant > 0) {
            mostrarForm2 = true;
        }
    }

    boolean mostrarNumeros = false;
    String ordenar = request.getParameter("ordenar");
    String cantidad2 = request.getParameter("cantidad2");
   
    int arr[]=null, cant2=0;
    
    if (ordenar != null) {

        if (!cantidad2.isEmpty()) {
            cant2 = Integer.parseInt(cantidad2);
            
            out.println("Todo va bien bro --> " + cant2);
            
            mostrarNumeros = true;
            

            /*
            for (int i = 0; i < cant2; i++) {
                men = arr[0];
                may = arr[0];

                if (arr[i] > may) {
                    may = arr[i];
                }

                if (arr[i] < men) {
                    men = arr[i];
                }

                

            }
            */
            
            
        } else {
            out.print("--------------------> Hay pedos");
        }
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        </style>
    </head>
    <body>
        <div class="contenedor-main">
            <h2>Ordenacion de números</h2> 
            <p style="text-align: justify">
                <b>Descripcion práctica:</b> Un programa que solicite un número, el programa solicita dichos números y muestra todos los números y el número mayor y menor de ellos. El último es el único en el que necesitarás usar el atributo del formulario action por que necesitarás 2 formularios uno que pida la cantidad de números a ingresar y otro para pedir los números de la cantidad solicitada e imprimirlos.<br><br>
                Usaré método <b>GET</b> by: Jose Enrique Zempoaltecatl Moyotl
            </p>
            <hr>
            <p>
                <b>Ordenando números</b><br>
                Ingresa los numeros que se solicitan
            </p>
            <form method="GET">
                <label for="cantidad">Ingresa la cantidad de items</label>
                <input type="number" name="cantidad" id="cantidad" value="<% if (mostrarForm2) {out.print(cant);} %>" required/>
                <input type="submit" name="generar" value="Generar"/>
            </form>

            <%if (mostrarForm2) {%>
            <p>Ingresa los todos los numeros</p>
            <form method="GET">
                <table>
                    <%
                        int i = 0;
                        while (i < cant) {
                            if (i % 10 == 0) {
                    %><tr><%
                        }
                        %>
                        <td><input type="number" name="num<%out.print(i);%>" required/></td>
                            <%
                                i++;
                                if (i % 10 == 0 && i != 0) {
                            %></tr><%
                                    }
                                }
                        %>
                </table>
                <input type="hidden" name="cantidad2" value="<% if (mostrarForm2) {out.print(cant);} %>"/>
                <input type="submit" name="ordenar"/>
            </form>
            <%
                }
                if (mostrarNumeros) {
            %>
            <p><b>Los numero ingresados son:</b><br>
                <%
                    int may = Integer.parseInt(request.getParameter("num0"));
                    int men = Integer.parseInt(request.getParameter("num0"));
                    
                    for (int i = 0; i < cant2; i++) {
                        out.println(request.getParameter("num"+i));
                        
                        if(Integer.parseInt(request.getParameter("num"+i))<men){
                            men = Integer.parseInt(request.getParameter("num"+i));
                        }
                        if(Integer.parseInt(request.getParameter("num"+i))>may){
                            may = Integer.parseInt(request.getParameter("num"+i));
                        }
                        
                    }
                %>
            </p>
            <p>Numero mayor: <%out.println(may);%></p>
            <p>Numero menor: <%out.println(men);%></p>
            <%
                }
            %>
        </div>
    </body>
</html>


