<%-- 
    Document   : formularioPassword
    Created on : 19 jun 2020, 20:16:34
    Author     : Raquel
--%>

<%@page import="Config.Conexion"%>
<%@page import="Dao.*"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int id = 0;
    if (request.getParameter("id") != null) {
        id = Integer.parseInt(request.getParameter("id"));
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <title>Actualizar contraseña</title>
    </head>
    <body>
        <div class="container">
            <h2 class="text-center">Actualizar password</h2>
            <form action="editarPassword.jsp" methode="POST">
                <div class="form-group"> 
                    <div>
                        <input  type="hidden" class="form-control" name="id_usuario" value="<%=id%>"/>
                    </div>
                    <div>
                        <input  type="password"  class="form-control" placeholder="Contraseña anterior" name="pass1" requiered/><br>
                    </div>
                    <div >
                        <input  type="password" class="form-control" placeholder="Nueva contraseña" name="pass2" requiered/><br>
                    </div>
                    <div>
                        <input  type="password"  class="form-control" placeholder="Confirmación de contraseña" name="pass3" requiered/><br>
                    </div>
                    <div>
                        <input type="submit" class="btn btn-success btn-block" value="Actualizar"/><br>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>