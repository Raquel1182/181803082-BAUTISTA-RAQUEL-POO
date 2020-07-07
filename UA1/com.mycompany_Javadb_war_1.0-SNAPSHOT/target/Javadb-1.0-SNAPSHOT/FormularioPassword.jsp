<%-- 
    Document   : FormularioPassword
    Created on : 19 jun 2020, 20:16:34
    Author     : Raquel
--%>

<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String titulo="Formulario Password",usuario="",ref="editarPassword.jsp";
int n=0,id=0;
if(request.getParameter("id")!=null){
    titulo="Editar Password";
    id=Integer.parseInt(request.getParameter("id"));
    Connection conexion = null;
    ResultSet rs = null;
    PreparedStatement stmt = null;
    try{
        Class.forName("com.mysql.jdbc.Driver");
        conexion = DriverManager.getConnection("jdbc:mysql://localhost/usuarios", "root", "");
        stmt = conexion.prepareStatement("SELECT * FROM usuario WHERE id_usuario=?");
        stmt.setInt(1,id);
        rs = stmt.executeQuery();
        rs.next();
        usuario=rs.getString("usuario");
        
    }catch(Exception e){
        out.println("Error: "+e.getMessage());
    }
}
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulario Password</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    </head>
    <body>
        <h1><%=titulo%></h1>
        <div class="container">
            <form action="editarPassword.jsp" method="GET">
                <div class="form-row">
                    <input type="password" class="form-control" placeholder="Contraseña anterior" name="contra_ant" id="contra_ant" requered /><br>
                </div>
                <div class="form-row">
                    <input type="password" class="form-control" placeholder="Nueva contraseña" name="contra_nueva1" id="contra_nueva1" requered/><br>
                </div>
                <div class="form-row">
                    <input type="password" class="form-control" placeholder="Repita la nueva contraseña" name="contra_nueva2" id="contra_nueva2" requered/><br>
                </div>
                <input type="submit" class="btn btn-success  btn-block" value="Aceptar"><br>
                <input type="hidden" value="<%out.print(request.getParameter("id"));%>" name="id" id="id">
            </form>
        </div>
    </body>
</html>