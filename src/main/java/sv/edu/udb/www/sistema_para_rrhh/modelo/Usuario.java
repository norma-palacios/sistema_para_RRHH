package sv.edu.udb.www.sistema_para_rrhh.modelo;

import java.time.Instant;

public class Usuario {
    private long id;
    private String username;
    private String email;
    private String passwordHash; // la contraseña encriptada con BCrypt
    private String estado;       // ACTIVO / INACTIVO
    private String nombre;
    private int intentosFallidos;
    private Instant ultimoIngreso;

    // ---- Constructores ----
    public Usuario() {}

    public Usuario(long id, String username, String email, String passwordHash,
                   String estado, String nombre, int intentosFallidos, Instant ultimoIngreso) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.passwordHash = passwordHash;
        this.estado = estado;
        this.nombre = nombre;
        this.intentosFallidos = intentosFallidos;
        this.ultimoIngreso = ultimoIngreso;
    }

    // ---- Getters y Setters ----
    public long getId() { return id; }
    public void setId(long id) { this.id = id; }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPasswordHash() { return passwordHash; }
    public void setPasswordHash(String passwordHash) { this.passwordHash = passwordHash; }

    public String getEstado() { return estado; }
    public void setEstado(String estado) { this.estado = estado; }

    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public int getIntentosFallidos() { return intentosFallidos; }
    public void setIntentosFallidos(int intentosFallidos) { this.intentosFallidos = intentosFallidos; }

    public Instant getUltimoIngreso() { return ultimoIngreso; }
    public void setUltimoIngreso(Instant ultimoIngreso) { this.ultimoIngreso = ultimoIngreso; }
}