

<%@page import="java.sql.*"%>
<%@page import="Dao.Usuario"%>
<%@page import="Config.Conexion"%>
<%@page import="Dao.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<%
    boolean querySuccess;
    UsuarioBD usuario=new UsuarioBD();
    querySuccess=usuario.insertarUsuario (new Usuario(request.getParameter("usuario"), request.getParameter("password")));
%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <title>Agregar un nuevo usuario</title>
    </head>
    <body>
        <div class="container text-center">
            <%if(querySuccess){%>
            <div class="alert alert-success" role="alert">
            <h2>Se agregó exitosamente el registro en la base de datos</h2>
            </div>    
        </div>
        <%}else{%>
            <div class="alert alert-danger" role="alert">
            <h2>No se pudo agregar el nuevo usuario</h2>
            </div>
        <%}%>
        <form action="index.jsp" methode="POST" class="form" >
            <div class="form-row">
                <div class="col">
                    <input type="submit" class="btn btn-success btn-block" value="Regresar" />
                </div>
            </div>
        </form>
    </body>
</html>