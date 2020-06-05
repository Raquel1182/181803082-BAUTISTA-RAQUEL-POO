<%-- 
    Document   : index
    Created on : 4 jun 2020, 18:44:59
    Author     : Raquel
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <style>
            table, th, td {
                border: 1px solid blueviolet;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FunkoPOP</title>
    </head>
    <body style="background-color:#eaf7f8;">
        <h1 style="color:#0086ad; font-family:Comic Sans MS,Arial,Verdana; text-align:center">CRUD Funko POP</h1>
        <div align="center"> <img src="Images/FunkoPop.jpg" alt="FunkoPOP" title="FunkoPOP";"></div>
            <%
                Connection conexion;
                ResultSet rs = null;
                PreparedStatement ps;

                try {
                    String url = "jdbc:mysql://localhost/funkopop";
                    String Driver = "com.mysql.jdbc.Driver";
                    String user = "root";
                    String clave = "";
                    Class.forName(Driver);
                    conexion = DriverManager.getConnection(url, user, clave);

                    ps = conexion.prepareStatement("SELECT * from funkos");
                    rs = ps.executeQuery();

                } catch (Exception e) {
                    out.println("error" + e);
                }
            %>

        <div>
            <h2 style="color:#005b96; font-family:Comic Sans MS,Arial,Verdana; text-align:center">Funko POP</h2>
            <table align="center" style="width:80%">
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Peso del producto</th>
                    <th>Edad minima</th>
                    <th>Material</th>
                    <th>Numero de piezas</th>
                    <th>Precio</th>
                    <th>Categoria</th>
                </tr>
                <%
                    while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getInt("id_funko")%></td>
                    <td><%= rs.getString("nombre")%></td>
                    <td><%= rs.getString("peso_producto")%></td>
                    <td><%= rs.getString("edad_minima")%></td>
                    <td><%= rs.getString("material")%></td>
                    <td><%= rs.getInt("num_piezas")%></td>
                    <td><%= rs.getString("precio")%></td>
                    <td><%= rs.getInt("id_categoria")%></td>
                </tr>
                <%}%>
            </table>
        </div>
        <%

            try {
                String url = "jdbc:mysql://localhost/funkopop";
                String Driver = "com.mysql.jdbc.Driver";
                String user = "root";
                String clave = "";
                Class.forName(Driver);
                conexion = DriverManager.getConnection(url, user, clave);

                ps = conexion.prepareStatement("Select * from cat_categorias");
                rs = ps.executeQuery();

            } catch (Exception e) {
                out.println("error" + e);
            }
        %>
        <div>
            <table align="center">
                <h2 style="color:#005b96; font-family:Comic Sans MS,Arial,Verdana; text-align:center"> Catalogo </h2>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>

                </tr>
                <%
                    while (rs.next()) {
                %>

                <tr>
                    <td><%= rs.getInt("id_cat")%></td>
                    <td><%= rs.getString("nombre")%></td>
                </tr>
                <%}%>
            </table>
        </div>
    </body>
</html>
