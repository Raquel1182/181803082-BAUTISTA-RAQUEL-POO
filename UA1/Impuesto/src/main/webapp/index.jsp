<%-- 
    Document   : index
    Created on : 24 may 2020, 21:31:13
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
        <h1>Pago de impuestos</h1>

        <%
            if (request.getParameter("edad") != null) { %>
        <%
            int edad = Integer.parseInt(request.getParameter("edad"));
            int ingresos = Integer.parseInt(request.getParameter("ingresos"));

            if (edad > 16 && ingresos >= 1000) {
                out.println("Tienes que tributar");
            } else {
                out.println("No tienes que tributar");
            }

        %>

        <%} else { %>
        <form>
            <input type="number" placeholder="Edad" name="edad" required/>
            <input type="number" placeholder="Ingresos" name="ingresos" required/>
            <input type="submit" value="Enviar"/>

        </form>
        <h3>No has ingresado ningun valor</h3>  
        <%}
        %>

    </body>
</html>
