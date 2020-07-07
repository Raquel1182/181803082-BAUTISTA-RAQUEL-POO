/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;
import Config.Conexion;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Raquel
 */
public class UsuarioBD {
    
    //Atributos SQL
    private static final String listado="SELECT * from usuario";
    private static final String insertado="INSERT INTO usuario SET usuario=?, password=MD5(?)";
    
    //Atributos de conexion
    private Connection conexion=new Conexion().getConexion();
    private PreparedStatement stmt;
    private ResultSet rs;
    
    public List<Usuario> listadoUsuarios() throws SQLException{
        List<Usuario> usuarios= new ArrayList<>();
        this.stmt=this.conexion.prepareStatement(this.listado);
        this.rs=this.stmt.executeQuery();
        while (this.rs.next()){
            usuarios.add(new Usuario(this.rs.getInt("id_usuario"), this.rs.getString("usuario"), this.rs.getString("password")));
        }
        return usuarios;
    }
    
    public boolean insertarUsuario (Usuario usuario) throws SQLException{
        this.stmt= this.conexion.prepareStatement(insertado);
        this.stmt.setString(1, usuario.getUsuario());
        this.stmt.setString(2, usuario.getPassword());
        if(this.stmt.executeUpdate()==1){
            return true;
        }else{
            return false;
        }
    }
}

