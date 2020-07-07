
<%@page import="Dao.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Dao.UsuarioBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    List<Usuario> usuarios=new UsuarioBD().listadoUsuarios();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <title>CRUD</title>
    </head>
    <body>
        <h1>Los registros en la base de datos son: </h1>
        <div class="container">
            <table class="table table-hover">
                <thead class=" thead-dark">
                    <tr>
                        <td colspan="2"><h2>Usuarios</h2></td>
                        <td><a class="btn btn-success btn-block" href="FormularioUsuario.jsp">Agregar usuario</a></td>

                    </tr>


                    <tr>
                        <th>#</th>
                        <th>Nombre</th>
                        <th scope="col">Contraseña</th>
                        <th></th>
                        <th></th>
                        <th align="center">Acciones</th>
                        <th></th>
                        <th></th>
                    </tr>
                    
                </thead>
                <tbody>
                    <% for(Usuario usuario:usuarios){%>
                    <tr>
                        <th><%=usuario.getIdUsuario()%></th>
                        <td><%=usuario.getUsuario()%></td>
                        <td><%=usuario.getPassword()%></td>
                        <th><%=usuario.getIdUsuario()%></th>
                        <td><a class="btn btn-warning btn-block" href="FormularioUsuario.jsp?id=<%=usuario.getIdUsuario()%>">Editar usuario</a></td>
                        <td><a class="btn btn-warning btn-block" href="FormularioPassword.jsp?id=<%=usuario.getIdUsuario()%>">Editar password</a></td>
                        <td><a class="btn btn-danger btn-block"  href="eliminarUsuario.jsp?id=<%=usuario.getIdUsuario()%>"> Eliminar usuario </a> </td>
                        <td><a class="btn btn-danger btn-block"  href="eliminarUsuario3.jsp?id=<%=usuario.getIdUsuario()%>"> Eliminar usuario v2 </a> </td>
                    </tr>

                    <%}%>
                </body>
            </table>
            <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        </div>
    </body>
</html>
