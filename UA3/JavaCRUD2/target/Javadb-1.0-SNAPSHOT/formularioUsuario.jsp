
<%@page import="Dao.*"%>
<%@page import="Config.Conexion"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String titulo = "Agregar Usuario", usuarios = "", action="agregarUsuario.jsp";
    int id = 0;
    if (request.getParameter("id") != null) {
        id = Integer.parseInt(request.getParameter("id"));
        titulo = "Editar Usuario";
        action = "editarUsuario.jsp";
        UsuarioBD usuario = new UsuarioBD(); 
        usuarios = usuario.formuEliminar(new Usuario(id));
        
        
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <title>Agregar usuario</title>
    </head>
    <body>
        <div class="container">
            <h2 class="text-center"><%=titulo%></h2>
            <form action="<%out.print(action);%>" methode="POST">
                <div class="form-group">
                    <%if(id != 0 ){%>
                    <div>
                        <input  type="hidden" class="form-control" name="id_usuario" value="<%=id%>"/>
                    </div>
                    <% } %>
                    <div>
                        <input  type="text" placeholder="<%=usuarios%>" class="form-control" placeholder="Nombre" name="usuario" requiered/><br>
                    </div>
                     <div>
                         <input type="int" class="form-control" placeholder="Edad" name="edad"  requiered /><br>
                    </div>
                    <%if (id == 0) {%>
                    <div>
                        <input type="password" class="form-control" placeholder="Contraseña" name="password"  requiered /><br>
                    </div>
                    <% }%>
                    <div>
                        <input type="submit" class="btn btn-success btn-block" value="Agregar" /><br>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>