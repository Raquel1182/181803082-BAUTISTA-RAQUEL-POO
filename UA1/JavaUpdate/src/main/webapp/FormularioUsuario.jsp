
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String titulo = "Agregar usuario", usuario = "", action = "AgregarUsuario.jsp";
    int id = 0;
    if (request.getParameter("id") != null) {
        id = Integer.parseInt(request.getParameter("id"));
        titulo = "Editar usuario";
        action = "editarUsuario.jsp";
        Connection conexion = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conexion = DriverManager.getConnection("jdbc:mysql://localhost/usuarios", "root", "");
            stmt = conexion.prepareStatement("SELECT * FROM usuario WHERE id_usuario=?");
            stmt.setInt(1, id);
            rs = stmt.executeQuery();
            rs.next();
            usuario = rs.getString("usuario");
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
%>  
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

        <title>Formulario Usuario</title>
    </head>
    <body>
        <h1><%=titulo%></h1>
        <div class="container">
            <form action="<%=action%>" method="GET" >
                <div class="form-row">   
                    <% if (id != 0) {%>
                    <div class="col">
                        <input type="hidden" class="form-control"  name="id_usuario" value="<%=id%>"/>
                    </div>
                    <% }%>
                    <div class="col">
                        <input type="text" value="<%=usuario%>" class="form-control" placeholder="Nombre" name="usuario" required>
                    </div>
                    <%if (id == 0) {%>
                    <div class="col">
                        <input type="password" class="form-control" placeholder="Contraseña" name="password" required>
                    </div>          
                    <% }%>
                    <div class="col">
                        <input type="submit"  class="btn btn-success  btn-block " value="Enviar"/>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
