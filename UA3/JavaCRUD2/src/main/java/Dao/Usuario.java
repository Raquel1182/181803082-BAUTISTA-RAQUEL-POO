/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

/**
 *
 * @author Raquel
 */
public class Usuario {
    private int id_usuario;
    private int edad;
    private String usuario;
    private String password;
    private String pass1;
    private String pass2;
    private String pass3;

    public Usuario(){}
    
    public Usuario(int id_usuario,int edad, String usuario, String password) {
        this.id_usuario = id_usuario;
        this.edad =edad;
        this.usuario = usuario;
        this.password = password;
    }

    public Usuario(String usuario, int edad, String password) {
        this.edad = edad;
        this.usuario = usuario;
        this.password = password;
    }

    public Usuario( String usuario,int edad,int id_usuario) {
        this.id_usuario = id_usuario;
        this.usuario = usuario;
        this.edad = edad;
    }
    
    
    public Usuario(int id_usuario){
        this.id_usuario = id_usuario;
    }

    public Usuario(String password) {
        this.password = password;
    }
    
    public Usuario(String password, int id_usuario) {
        this.id_usuario = id_usuario;
        this.password = password;
    }
    
    public int getId_usuario() {
        return id_usuario;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getPass1() {
        return pass1;
    }

    public void setPass1(String pass1) {
        this.pass1 = pass1;
    }

    public String getPass2() {
        return pass2;
    }

    public void setPass2(String pass2) {
        this.pass2 = pass2;
    }

    public String getPass3() {
        return pass3;
    }

    public void setPass3(String pass3) {
        this.pass3 = pass3;
    }
    
    

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "Usuario{" + "id_usuario=" + id_usuario + ", edad=" + edad + ", usuario=" + usuario + ", password=" + password + '}';
    }

    
    
    
    
    
}
