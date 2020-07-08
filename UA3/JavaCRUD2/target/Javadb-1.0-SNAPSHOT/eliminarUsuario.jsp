<%-- 
    Document   : eliminarUsuario
    Created on : 20 jun 2020, 18:48:47
    Author     : Raquel
--%>

<%@page import="Config.Conexion"%>
<%@page import="Dao.*"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String usuarios = "";
    int id =0;
    if (request.getParameter("id") != null) {
        id = Integer.parseInt(request.getParameter("id"));
        UsuarioBD usuario = new UsuarioBD(); 
        usuarios = usuario.formuEliminar(new Usuario(id));
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" 
              integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    </head>
    <body>
        <div class="alert alert-success" role="alert">
            <h2 class="text-center">¿Seguro que quieres eliminar al usuario?</h2>
        </div>
        <div><a class="btn btn-primary btn-block" href="index.jsp">Cancelar</a></div>
        <div><a class="btn btn-danger btn-block" href="eliminar.jsp?id=<%out.print(id);%>">Eliminar</a></div>
    </body>
</html>
