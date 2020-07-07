<%-- 
    Document   : editarPassword
    Created on : 19 jun 2020, 20:16:52
    Author     : Raquel
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Connection conexion = null;
    ResultSet rs = null;
    PreparedStatement stmt = null;
    int n=0;
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edita Password</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    </head>
    <body>
            <%if (request.getParameter("contra_nueva1").equals(request.getParameter("contra_nueva2")) == true) {
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        conexion = DriverManager.getConnection("jdbc:mysql://localhost/usuarios", "root", "");
                        stmt = conexion.prepareStatement("UPDATE `usuario` SET `password`=MD5(?) WHERE `id_usuario`=? AND `password`=MD5(?)");
                        stmt.setString(1, request.getParameter("contra_nueva1"));
                        stmt.setInt(2, Integer.parseInt(request.getParameter("id")));
                        stmt.setString(3, request.getParameter("contra_ant"));
                        n = stmt.executeUpdate();
                    } catch (Exception e) {
                        out.println(e.getMessage());
                }
                if (n == 1) {%>
        <h2 class="text-center">La actualización de la contraseña ha sido exitosa</h2>
            <%}
            if (n == 0) {%>
        <h2 class="text-center">La actualización de la contraseña no ha sido exitosa</h2>
        <%}%><h2><a class="btn btn-success btn-block" href="index.jsp">Regresar</a></h2><%
        } else {%>            
        <div class="col">
            <h3 class="text-center">Contraseñas incorrectas</h3>
            <a class="btn btn-success btn-block" href="FormularioPassword.jsp">Regresar</a>
        </div>
        <%}
        %>
    </body>
</html>