<%-- 
    Document   : editarPassword
    Created on : 19 jun 2020, 20:16:52
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
        <title>Actualizar password</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    </head>
    <body>
        <%
            int id = 0;
            if (request.getParameter("id_usuario") != null) {
                id = Integer.parseInt(request.getParameter("id_usuario"));
                String passactual = request.getParameter("pass1");
                String nuevapass1 = request.getParameter("pass2");
                String nuevapass2 = request.getParameter("pass3");
                boolean value = false;
                boolean v = false;

                UsuarioBD usuario = new UsuarioBD();
                value = usuario.editarContra(new Usuario(passactual,id));
                if(value){
                    if (nuevapass1.equals(nuevapass2)) {
                        v = usuario.Upassword(new Usuario(nuevapass1,id));
                        if(v){
                            %>
                                <div class="alert alert-success" role="alert">
                                    <h2 class="text-center">La actualización de la contraseña ha sido exitosa</h2>
                                </div>
                            <%
                        }
                    }else{
                        %>
                            <div class="alert alert-danger" role="alert">
                                <h2 class="text-center">Las contraseñas no son iguales, verifíquelas</h2>
                            </div>
                        <%
                    }
                }else{%>
                    <div class="alert alert-danger" role="alert">
                        <h2 class="text-center">Error en la contraseña antigua</h2>
                    </div>
                 <%
                     }
                }%>
                <br>
                <div><a class="btn btn-success btn-block" href="index.jsp">Regresar al index</a></div>
    </body>
</html>