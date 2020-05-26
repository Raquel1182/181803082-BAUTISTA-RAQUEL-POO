<%-- 
    Document   : index
    Created on : 24 may 2020, 20:04:21
    Author     : Raquel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Calcular el mcm de 3 numeros</h1>

        <%
            if (request.getParameter("numero1") != null) { %>
        <h1>El minimo comun multiplo es: </h1>
        <%
            int numero1 = Integer.parseInt(request.getParameter("numero1"));
            int numero2 = Integer.parseInt(request.getParameter("numero2"));
            int numero3 = Integer.parseInt(request.getParameter("numero3"));
            int maximo = numero1;
            int i = maximo;

            if (numero2 > maximo) {
                maximo = numero2;
            }

            if (numero3 > maximo) {
                maximo = numero3;
            }

            while ((i % numero1 != 0) || (i % numero2 != 0) || (i % numero3 != 0)) {
                i++;
            }
            out.println(i);

        %>


        <%} else { %>
        <form>
            <input type="number" name="numero1" required/>
            <input type="number" name="numero2" required/>
            <input type="number" name="numero3" required/>
            <input type="submit" value="Enviar"/>

        </form>
        <h3>No ingresaste ningun valor</h3>  
        <%}
        %>


    </body>
</html>
