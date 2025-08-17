package sv.edu.udb.www.sistema_para_rrhh.modelo;

import java.util.Date;

public class Contratacion {
    private int id;
    private String departamento;
    private String empleado;
    private String cargo;
    private String tipoContratacion;
    private Date fechaContratacion;
    private double salario;
    private String estado ;

    public Contratacion (
            int id,
            String departamento,
            String empleado,
            String cargo,
            String tipoContratacion,
            Date fechaContratacion,
            double salario,
            String estado
    ) {
        this.id = id;
        this.departamento = departamento;
        this.empleado =  empleado;
        this.cargo = cargo;
        this.tipoContratacion = tipoContratacion;
        this.fechaContratacion = fechaContratacion;
        this.salario = salario;
        this.estado = estado;


    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public Date getFechaContratacion() {
        return fechaContratacion;
    }

    public void setFechaContratacion(Date fechaContrtacion) {
        fechaContrtacion = fechaContrtacion;
    }

    public double getSalario() {
        return salario;
    }

    public void setSalario(double salario) {
        this.salario = salario;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
}
