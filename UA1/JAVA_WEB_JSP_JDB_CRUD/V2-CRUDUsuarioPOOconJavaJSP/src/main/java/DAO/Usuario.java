package DAO;

public class Usuario {

    private int id;
    private String nombre;
    private int edad;
    private String telefono;
    private String correo;
    private String password;

    public Usuario(int id, String nombre, int edad, String telefono, String correo, String password) {
        this.id = id;
        this.nombre = nombre;
        this.edad = edad;
        this.telefono = telefono;
        this.correo = correo;
        this.password = password;
    }

    public Usuario(String nombre, int edad, String telefono, String correo, String password) {
        this.nombre = nombre;
        this.edad = edad;
        this.telefono = telefono;
        this.correo = correo;
        this.password = password;
    }

    public Usuario(String nombre, int edad, String telefono, String correo) {
        this.nombre = nombre;
        this.edad = edad;
        this.telefono = telefono;
        this.correo = correo;
    }
    
    

    public int getId() {
        return id;
    }

    public String getNombre() {
        return nombre;
    }

    public int getEdad() {
        return edad;
    }

    public String getTelefono() {
        return telefono;
    }

    public String getCorreo() {
        return correo;
    }

    public String getPassword() {
        return password;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public void setPassword(String password) {
        this.password = password;
    }

}
