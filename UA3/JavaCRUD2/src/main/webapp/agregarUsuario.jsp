

<%@page import="java.sql.*"%>
<%@page import="Config.Conexion"%>
<%@page import="Dao.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    UsuarioBD usuario = new UsuarioBD(); 
    if(usuario.insertaUsuario(new Usuario(request.getParameter("usuario"),Integer.parseInt(request.getParameter("edad")),request.getParameter("password")))){
    %>
        <div class="alert alert-success" role="alert">
            <h2 class="text-center">Se agregó exitosamente el registro en la base de datos</h2>
        </div>
    <%}
    
%>



<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <title class="text-center">Agregar usuario</title>
    </head>
    <body>
        <form action="index.jsp" methode="POST" class="form" >
            <div class="form-row">
                <div class="col">
                    <input type="submit" class="btn btn-success btn-block" value="Regresar al index" />
                </div>
            </div>
        </form>
    </body>
</html>
