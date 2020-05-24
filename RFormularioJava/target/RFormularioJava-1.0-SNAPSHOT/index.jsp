<%-- 
    Document   : index
    Created on : 20 may 2020, 18:29:34
    Author     : Raquel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulario Java</title>
    </head>
    <body>
        <h1>Formulario Java</h1>
        <p>Ingresa un numero</p>
        <form> 
            <input type="text" name="numero" required pattern="[0-9999]{1,4}"/>
           
            <input type="submit" value="Enviar"/>

        </form>

        <p><b>Los numeros son:</b></p>
        <%
            try {

                int n = Integer.parseInt(request.getParameter("numero"));
                for (int i = 0; i <= n; i++) {
                    out.println("\n" +i);
                }
            } catch (NumberFormatException nfe) {
            }
        %>
    </body>
</html>
