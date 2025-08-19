package sv.edu.udb.www.sistema_para_rrhh.modelo;


import java.time.LocalDate;

public class ListaContratacion {
    private int idContratacion;
    private String departamento;
    private String empleado;
    private String cargo;
    private String  tipoContratacion;
    private LocalDate fechaContratacion;
    private double salario;
    private boolean estado;

    public ListaContratacion() {}

    public ListaContratacion(int idContratacion, String departamento, String empleado, String cargo,
                             String  tipoContratacion, LocalDate fechaContratacion,
                             double salario, boolean estado) {
        this.idContratacion = idContratacion;
        this.departamento = departamento;
        this.empleado = empleado;
        this.cargo = cargo;
        this.tipoContratacion = tipoContratacion;
        this.fechaContratacion = fechaContratacion;
        this.salario = salario;
        this.estado = estado;
    }

    public int getIdContratacion() {
        return idContratacion;
    }

    public void setIdContratacion(int idContratacion) {
        this.idContratacion = idContratacion;
    }

    public String getDepartamento() {
        return departamento;
    }

    public void setDepartamento(String departamento) {
        this.departamento = departamento;
    }

    public String getEmpleado() {
        return empleado;
    }

    public void setEmpleado(String empleado) {
        this.empleado = empleado;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public String getTipoContratacion() {
        return tipoContratacion;
    }

    public void setTipoContratacion(String tipoContratacion) {
        this.tipoContratacion = tipoContratacion;
    }

    public LocalDate getFechaContratacion() {
        return fechaContratacion;
    }

    public void setFechaContratacion(LocalDate fechaContratacion) {
        this.fechaContratacion = fechaContratacion;
    }

    public double getSalario() {
        return salario;
    }

    public void setSalario(double salario) {
        this.salario = salario;
    }

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }
}