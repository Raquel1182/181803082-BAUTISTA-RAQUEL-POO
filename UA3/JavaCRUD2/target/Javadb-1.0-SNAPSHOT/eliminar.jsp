<%-- 
    Document   : eliminar
    Created on : 20 jun 2020, 20:30:11
    Author     : Raquel
--%>

<%@page import="Config.Conexion"%>
<%@page import="Dao.*"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" 
              integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <title>Eliminar usuario</title>
    </head>
    <body>
        <%
            int id = 0;
            if (request.getParameter("id") != null) {
                id = Integer.parseInt(request.getParameter("id"));
                UsuarioBD usuario = new UsuarioBD();
                if (usuario.eliminarUsuario(new Usuario(id))) {%>
                <div class="alert alert-success" role="alert">
                    <h2 class="text-center">El usuario ha sido borrado exitosamente</h2>
                </div>
        <%}
            }
        %>
        <div><a class="btn btn-success btn-block" href="index.jsp">Regresar al index</a></div>

    </body>
</html>
