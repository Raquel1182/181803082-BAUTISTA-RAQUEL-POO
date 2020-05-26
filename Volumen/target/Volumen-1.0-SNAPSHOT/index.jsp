<%-- 
    Document   : index
    Created on : 24 may 2020, 19:05:43
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
        <h1>Calcular el volumen de una esfera</h1>

        <%
            if (request.getParameter("radio") != null) { %>
        <h3>El volumen de la esfera es: </h3>
        <%
            Double radio = Double.parseDouble(request.getParameter("radio"));
            double volumen_esfera, radio_cubico;
            double pi = 3.1416;

            radio_cubico = radio * radio * radio;

            volumen_esfera = (4.0 / 3) * pi * radio_cubico;
            out.println(volumen_esfera);
        %>
        <%} else { %>
        <form>
            <input type="number" placeholder="valor del radio" name="radio" required/>
            <input type="submit" value="Enviar"/>

        </form>
        <h3>No has ingresado ningun valor</h3>  
        <%}
        %>
    </body>
</html>
