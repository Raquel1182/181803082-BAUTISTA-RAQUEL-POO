<%-- 
    Document   : index
    Created on : 31 may 2020, 19:08:23
    Author     : Raquel
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Excepciones</h1>
        <%
            Connection conexion = null;
            Statement stmt = null;
            ResultSet rs = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                conexion = DriverManager.getConnection("jdbc:mysql://localhost/usuarios", "root", "");
                stmt = conexion.createStatement();
                rs = stmt.executeQuery("");
                
                while (rs.next()) {
                    out.println(rs.getString(1));
                    out.println(rs.getString(2));
                }
            } //catch para ver el numero del error
            /*catch (SQLException e) {
                out.println("Código de Error: " + e.getErrorCode() + "\n"
                        + "SLQState: " + e.getSQLState() + "\n"
                        + "Mensaje: " + e.getMessage() + "\n");
            }*/

            catch(SQLException e) {
        switch(e.getErrorCode()){
            case 1049:
                out.println("La base de datos no existe");
                break;
            case 1146:
                out.println("La tabla no existe");
                break;
            case 1064:
                out.println("Error en la sintaxis SQL");
                break;
            case 1045:
                out.println("Acceso denegado, contraseña incorrecta");
                break;
            case 0:
                out.println("No se puede emitir una consulta vacía");
                break;
        }
    }

        %>
    </body>
</html>
