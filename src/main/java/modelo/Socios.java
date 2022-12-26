/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import java.time.LocalDate;

/**
 *
 * @author windows
 */
public class Socios 
{
    private int idPaciente;
    private String nombre;
    private String apellido;
    private String direccion;
    private String foto;
    private LocalDate  fnac;
    private String mail;
    private String telefono;
    private boolean activo;
    
    
    public Socios(int idPaciente,String nombre,String apellido,String direccion,String foto,LocalDate fnac,String mail,String telefono, boolean activo)
    {
        this.idPaciente=idPaciente;
        this.nombre=nombre;
        this.apellido=apellido;
        this.direccion=direccion;
        this.foto=foto;
        this.fnac=fnac;
        this.mail=mail;
        this.telefono=telefono;
        this.activo=activo;        
    }

    public int getIdPaciente() {
        return idPaciente;
    }

    public void setIdPaciente(int idPaciente) {
        this.idPaciente = idPaciente;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public LocalDate getFnac() {
        return fnac;
    }

    public void setFnac(LocalDate fnac) {
        this.fnac = fnac;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public boolean isActivo() {
        return activo;
    }

    public void setActivo(boolean activo) {
        this.activo = activo;
    }
    
   
    
     
}