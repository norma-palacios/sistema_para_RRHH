package sv.edu.udb.www.sistema_para_rrhh.dao;

import sv.edu.udb.www.sistema_para_rrhh.conexion.ConexionBD;
import sv.edu.udb.www.sistema_para_rrhh.modelo.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ContratacionesDao
{
    public List<ListaContratacion> listar(){
        List<ListaContratacion> lista = new ArrayList<>();

        String sql = "SELECT c.idContratacion, c.fechaContratacion, c.salario, c.estado,"+
                       "d.nombreDepartamento,"+
                       "e.nombrePersona,"+
                       "ca.cargo,"+
                       "t.tipoContratacion "+
                "FROM contrataciones c "+
                "INNER JOIN departamento d ON c.idDepartamento = d.idDepartamento "+
                "INNER JOIN empleados e ON c.idEmpleado = e.idEmpleado "+
                "INNER JOIN cargos ca ON c.idCargo = ca.idCargo "+
                "INNER JOIN tipoContratacion t ON c.idTipoContratacion = t.idTipoContratacion "+
                "ORDER BY c.idContratacion DESC";

        try {
            Connection con = ConexionBD.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ListaContratacion listaContratacion = new ListaContratacion();
                listaContratacion.setIdContratacion(rs.getInt("idContratacion"));
                listaContratacion.setFechaContratacion(rs.getDate("fechaContratacion").toLocalDate());
                listaContratacion.setSalario(rs.getDouble("salario"));
                listaContratacion.setEstado(rs.getBoolean("estado"));
                listaContratacion.setDepartamento(rs.getString("nombreDepartamento"));
                listaContratacion.setEmpleado(rs.getString("nombrePersona"));
                listaContratacion.setCargo(rs.getString("cargo"));
                listaContratacion.setTipoContratacion(rs.getString("tipoContratacion"));

                lista.add(listaContratacion);
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
        return lista;
    }

    public List<Departamento> listarDepartamentos() {
        List<Departamento> lista = new ArrayList<>();
        String sql = "SELECT * FROM departamento";
        try {
            Connection con = ConexionBD.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Departamento d = new Departamento(rs.getInt("idDepartamento"), rs.getString("nombreDepartamento"), rs.getString("descripcionDepartamento"));
                lista.add(d);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return lista;
    }

    public List<Empleado> listarEmpleados() {
        List<Empleado> lista = new ArrayList<>();
        String sql = "SELECT * FROM empleados";
        try {
            Connection con = ConexionBD.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Empleado e = new Empleado(rs.getInt("idEmpleado"), rs.getString("nombrePersona"));
                lista.add(e);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return lista;
    }

    public List<Cargo> listarCargos() {
        List<Cargo> lista = new ArrayList<>();
        String sql = "SELECT * FROM cargos";
        try {
            Connection con = ConexionBD.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Cargo c = new Cargo(rs.getInt("idCargo"), rs.getString("cargo"));
                lista.add(c);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return lista;
    }

    public List<TipoContratacion> listarTipos() {
        List<TipoContratacion> lista = new ArrayList<>();
        String sql = "SELECT * FROM Tipocontratacion";
        try {
            Connection con = ConexionBD.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                TipoContratacion t = new TipoContratacion(rs.getInt("idTipoContratacion"), rs.getString("tipoContratacion"));
                lista.add(t);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return lista;
    }

    public void insertar(Contratacion c) {
        String sql = "INSERT INTO contrataciones(idDepartamento, idEmpleado, idCargo, idTipoContratacion, fechaContratacion, salario, estado) VALUES(?,?,?,?,?,?,?)";
        try {
            Connection con = ConexionBD.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, c.getIdDepartamento());
            ps.setInt(2, c.getIdEmpleado());
            ps.setInt(3, c.getIdCargo());
            ps.setInt(4, c.getIdTipoContratacion());
            ps.setDate(5, c.getFechaContratacion());
            ps.setDouble(6, c.getSalario());
            ps.setBoolean(7, c.isEstado());
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }
}
