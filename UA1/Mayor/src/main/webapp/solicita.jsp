<%-- 
    Document   : solicita
    Created on : 27 may 2020, 8:27:12
    Author     : Raquel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

    int numero = Integer.parseInt(request.getParameter("numero"));
    out.println(numero);

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Solicitar los números</title>
    </head>
    <body>
        <h1>Ingresa un total de: <%out.println(numero);%> numeros</h1>
        <form>

            <input type="hidden" value="<%out.print(numero);%>" name="numero"/><br><br>
            <%
                int arreglo[] = new int[numero];
                for (int i = 0; i < numero; i++) {%>
            <input type="number" name="valor<%out.print(i);%>" requerid/><br><br>
            <% if (request.getParameter("valor" + i) != null) {
                        int valor = Integer.parseInt(request.getParameter("valor" + i));
                        arreglo[i] = valor;
                    }
                }
                %>
                <h3>Los numeros ingresados son: </h3>
                <%
                for (int j = 0; j < numero; j++) {
                    out.println(arreglo[j]);%> <br> <%
            }
            %>
            <br>
            <input type="submit" value="Envianding dato">
    </body>
</html>