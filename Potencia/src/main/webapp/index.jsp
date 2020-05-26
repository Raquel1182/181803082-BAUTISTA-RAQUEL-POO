<%-- 
    Document   : index
    Created on : 24 may 2020, 17:22:30
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
        <h1>Calcular la potencia de cualquier numero X a cualquier numero n</h1>
        <%
            if (request.getParameter("exponente") != null) { %>
        <h3>El numero X elevado a la potencia n es: </h3>
        <%
            int potencia = 1;
            int base = Integer.parseInt(request.getParameter("base"));
            int exponente = Integer.parseInt(request.getParameter("exponente"));

            for (int i = 0; i < exponente; i++) {
                potencia = potencia * base;
            }
            out.println(potencia);
        %>

        <%} else { %>
        <form>
            <input type="number" placeholder="Valor de la base" name="base" required/>
            <input type="number" placeholder="Valor del exponente" name="exponente" required/>
            <input type="submit" value="Enviar"/>

        </form>
        <h3>No has ingresado ningun valor</h3>  
        <%}
        %>
    </body>
</html>
