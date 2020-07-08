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
    //PARA USUARIO
    private static final String listado = "SELECT * from usuario";
    private static final String insertar = "INSERT INTO usuario SET usuario=?, edad=?, password=MD5(?)";
    private static final String editarU ="UPDATE usuario SET usuario=?,edad=? where ?=id_usuario";
    private static final String eliminar = "DELETE  FROM usuario WHERE id_usuario=?";
    private static final String formueliminar = "SELECT * FROM usuario WHERE id_usuario=?";
    
    //PARA CONTRASEÑAS
    private static final String verificacionContrase = "SELECT * FROM usuario WHERE password=MD5(?) AND id_usuario=?";
    private static final String editarContra = "UPDATE usuario SET password=MD5(?) where ?=id_usuario";
    
    PreparedStatement stmt = null;
    ResultSet rs = null;
    //Atributos de conexion
    private Connection conexion = new Conexion().getConexion();
       
    public List<Usuario> ListadoUsuarios() throws SQLException{
    List<Usuario> usuarios=new ArrayList<>();
    this.stmt = this.conexion.prepareStatement(this.listado);
    this.rs = this.stmt.executeQuery();
    while (this.rs.next()){
        usuarios.add(new Usuario(this.rs.getInt("id_usuario"),this.rs.getInt("Edad"), this.rs.getString("usuario"),this.rs.getString("password")));
    }
    return usuarios;
    }
    
    public boolean insertaUsuario(Usuario usuario) throws SQLException{
        this.stmt = this.conexion.prepareStatement(this.insertar);
        this.stmt.setString(1, usuario.getUsuario());
        this.stmt.setInt(2, usuario.getEdad());
        this.stmt.setString(3, usuario.getPassword());
        
        if(this.stmt.executeUpdate() == 1){
            return true;
        }else{
             return false;
        }
    }
    
    public boolean editarUsuario(Usuario usuario) throws SQLException{
        this.stmt = this.conexion.prepareStatement(this.editarU);
        this.stmt.setString(1, usuario.getUsuario());
        this.stmt.setInt(2, usuario.getEdad());
        this.stmt.setInt(3, usuario.getId_usuario());
        if(this.stmt.executeUpdate() == 1){
            return true;
        }else{
             return false;
        }
    }
    
    public String formuEliminar(Usuario usuario) throws SQLException{
        this.stmt = this.conexion.prepareStatement(this.formueliminar); 
        this.stmt.setInt(1, usuario.getId_usuario());
        rs=this.stmt.executeQuery();
        
        if(rs.next()){
            String usu = this.rs.getString("usuario");
            return usu;
        }else{
             return "Nada";
        }
    }
    
    public String formuPassword(Usuario usuario) throws SQLException{
        this.stmt = this.conexion.prepareStatement(this.formueliminar); 
        this.stmt.setInt(1, usuario.getId_usuario());
        rs=this.stmt.executeQuery();
        
        if(rs.next()){
            String password = this.rs.getString("password");
            return password;
        }else{
             return "Nada";
        }
    }
    
    public boolean eliminarUsuario(Usuario usuario) throws SQLException{
        this.stmt = this.conexion.prepareStatement(this.eliminar);
        this.stmt.setInt(1, usuario.getId_usuario());
        if(this.stmt.executeUpdate() == 1){
            return true;
        }else{
            return false;
        }
    }
    
    public boolean editarContra(Usuario usuario) throws SQLException{  
        this.stmt = this.conexion.prepareStatement(this.verificacionContrase);
        this.stmt.setString(1, usuario.getPassword());
        this.stmt.setInt(2, usuario.getId_usuario());
        rs = this.stmt.executeQuery();
        if(rs.next()){
            return true;
        }else{
             return false;
        }
    }

    public boolean Upassword(Usuario usuario) throws SQLException{
        this.stmt = this.conexion.prepareStatement(this.editarContra);
        this.stmt.setString(1, usuario.getPassword());
        this.stmt.setInt(2, usuario.getId_usuario());
        
        if(this.stmt.executeUpdate() == 1){
            return true;
        }else{
             return false;
        }
    
    }
        /*
        
        if(v == true){
            if(usuario.getPass2().equals(usuario.getPass3())){
                this.stmt = this.conexion.prepareStatement(this.editarContra);
                this.stmt.setString(1, usuario.getPass2());
                this.stmt.setInt(2, usuario.getId_usuario());
                this.stmt.executeUpdate();
                o = 1;
            }else{
                     o = 2; 
            }
        */
} 
