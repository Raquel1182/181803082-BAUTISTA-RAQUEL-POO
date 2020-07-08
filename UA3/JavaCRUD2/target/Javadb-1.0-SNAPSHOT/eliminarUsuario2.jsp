<%-- 
    Document   : eliminarRapido
    Created on : 24 jun 2020, 9:48:27
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
        <meta http-equiv="refresh" content="0;URL=index.jsp" >
        <title>Eliminar usuario v2</title>
    </head>
    <body>
        <%
            int id = 0; 
            if(request.getParameter("id") != null){
                id = Integer.parseInt(request.getParameter("id"));
                UsuarioBD usuario = new UsuarioBD(); 
                usuario.eliminarUsuario(new Usuario(id)); 
            }                                   
        %>
    </body>
</html>
