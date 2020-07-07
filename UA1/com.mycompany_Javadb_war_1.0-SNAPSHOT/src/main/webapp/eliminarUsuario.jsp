<%-- 
    Document   : eliminarUsuario
    Created on : 20 jun 2020, 18:48:47
    Author     : Raquel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%

    String m = null;
    boolean a = false;

    String idd = request.getParameter("id");

    if (idd != null && idd != "") {

        Connection conexion = null;
        Statement st = null;

        int Id = Integer.parseInt(idd);

        try {

            Class.forName("com.mysql.jdbc.Driver");
            conexion = DriverManager.getConnection("jdbc:mysql://localhost/usuarios", "root", "");
            st = conexion.createStatement();
            st.executeUpdate("DELETE FROM usuario WHERE id_usuario=" + Id + "");

            m = "El usuario ha sido eliminado";
            a = true;
        } catch (SQLException e) {

            m = "ERROR(" + e.getErrorCode() + "): " + e.getMessage();

        } catch (Exception e) {
            m = "ERROR: " + e.getMessage();
        }
    } else {
        m = "No se ha podido eliminar al usuario, consulte con los administradores";
    }
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    </head>
    <body>
        <div class="form-row">

            <div class="col">
                
                <% if (a) {%>

                <div class="alert alert-success" role="alert">
                    <h2 align="center"> <%out.print(m);%> </h2>
                </div>

                <a href="index.jsp" type="button" class="btn btn-success btn-block">Regresar</a>

                <%} else {%>

                    <%out.print(m);%>                

                <a href="index.jsp" type="button" class="btn btn-success btn-block">Regresar</a>
                <%}%> 
                
            </div>
        </div>
    </body>
</html>
