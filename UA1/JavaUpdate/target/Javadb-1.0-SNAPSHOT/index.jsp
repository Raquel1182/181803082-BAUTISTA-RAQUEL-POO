

<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    Connection conexion = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conexion = DriverManager.getConnection("jdbc:mysql://localhost/usuarios", "root", "");
        stmt = conexion.prepareStatement("Select * from usuario");
        rs = stmt.executeQuery();

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
                <thead class="thead-dark">
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
                    </tr>
                    
                </thead>
                <body>
                    <% while (rs.next()) {%>
                    <tr>
                        <th><%=rs.getInt("id_usuario")%></th>
                        <td><%=rs.getString("usuario")%></td>
                        <td><%=rs.getString("password")%></td>
                        <td><a class="btn btn-warning btn-block" href="FormularioUsuario.jsp?id=<%=rs.getInt("id_usuario")%>">Editar usuario</a></td>
                        <td><a class="btn btn-warning btn-block" href="FormularioPassword.jsp?id=<%=rs.getInt("id_usuario")%>">Editar password</a></td>
                        <td><a class="btn btn-danger btn-block"  href="eliminarUsuario.jsp?id=<%out.print(rs.getInt("id_usuario"));%>"> Eliminar usuario </a> </td>
                        <td><a class="btn btn-danger btn-block"  href="eliminarUsuario3.jsp?id=<%out.print(rs.getInt("id_usuario"));%>"> Eliminar usuario v2 </a> </td>
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
<%
    } catch (SQLSyntaxErrorException e) {
        switch (e.getErrorCode()) {
            case 1049:
                out.println("<b> Error SQL: </b> Error en la conexion");
                break;
            case 1146:
                out.println("<b> Error SQL: </b> La tabla no existe");
                break;
        }
    }%>
