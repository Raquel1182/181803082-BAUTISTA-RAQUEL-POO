<%-- 
    Document   : eliminarUsuario3
    Created on : 24 jun 2020, 9:48:27
    Author     : Raquel
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
        Connection conexion = null;
        PreparedStatement stmt = null;
        int id = Integer.parseInt(request.getParameter("id"));  

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conexion = DriverManager.getConnection("jdbc:mysql://localhost/usuarios","root","");
        stmt = conexion.prepareStatement("Delete FROM usuario WHERE id_usuario=?");
        stmt.setInt(1, id);
        stmt.executeUpdate();
        response.sendRedirect("index.jsp");
        }catch(Exception e){
        out.print(e.getMessage());
    }
%>