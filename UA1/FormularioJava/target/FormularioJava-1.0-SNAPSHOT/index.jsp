<%-- 
    Document   : index
    Created on : 20 may 2020, 17:27:50
    Author     : Raquel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mi primer formulario</title>
    </head>
    <body>
        <h1>Mi primer formulario</h1>
        <p>Este es mi primer formulario en donde conoceré la diferencia entre POST<b> y GET</b></p>
        <form method="POST"> 
            <input type="text" name="minombre"/><br>
            <input type="password" name="contra"/><br>
            <input type="date" name="fechanacimiento"/><br>
            <input type="submit" value="Enviar"/>
        </form>
        <h1>Los datos ingresados son</h1>
        <%
            out.println(request.getParameter("minombre"));
            out.println(request.getParameter("contra"));
            out.println(request.getParameter("fechanacimiento"));
                %>
        
    </body>
</html>
