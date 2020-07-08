<%-- 
    Document   : editarUsuario
    Created on : 19 jun 2020, 18:00:08
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
        <title>Editar Usuario</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" 
              integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    </head>
    <body> 
        <%
            int id = 0;
            if (request.getParameter("id_usuario") != null) {
                id = Integer.parseInt(request.getParameter("id_usuario"));
                int edad = Integer.parseInt(request.getParameter("edad"));
                String u = request.getParameter("usuario");
                UsuarioBD usuario = new UsuarioBD();
                if (usuario.editarUsuario(new Usuario(u, edad, id)) == true) {%>      
        <div class="alert alert-success" role="alert">
                    <h2 align="center">Se realizó exitosamente la modificacion</h2>
        </div>
        <br> <%}%>
        <div><a class="btn btn-success btn-block" href="index.jsp">Regresar al index</a></div>
        <%}
        %>
    </body>
</html>