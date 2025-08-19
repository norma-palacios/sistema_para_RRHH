package sv.edu.udb.www.sistema_para_rrhh.dao;

import sv.edu.udb.www.sistema_para_rrhh.conexion.ConexionBD;
import sv.edu.udb.www.sistema_para_rrhh.modelo.Empleado;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmpleadoDAO {

    // Listar todos los empleados
    public List<Empleado> listar() throws Exception {
        List<Empleado> lista = new ArrayList<>();
        String sql = "SELECT * FROM Empleados";

        try (Connection con = ConexionBD.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Empleado emp = new Empleado(
                        rs.getInt("idEmpleado"),
                        rs.getString("numeroDui"),
                        rs.getString("nombrePersona"),
                        rs.getString("usuario"),
                        rs.getString("numeroTelefono"),
                        rs.getString("correoInstitucional"),
                        rs.getDate("fechaNacimiento").toLocalDate()
                );
                lista.add(emp);
            }
        }
        return lista;
    }

    // Buscar por ID
    public Empleado buscarPorId(int idEmpleado) throws Exception {
        String sql = "SELECT * FROM Empleados WHERE idEmpleado = ?";
        try (Connection con = ConexionBD.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, idEmpleado);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Empleado(
                            rs.getInt("idEmpleado"),
                            rs.getString("numeroDui"),
                            rs.getString("nombrePersona"),
                            rs.getString("usuario"),
                            rs.getString("numeroTelefono"),
                            rs.getString("correoInstitucional"),
                            rs.getDate("fechaNacimiento").toLocalDate()
                    );
                }
            }
        }
        return null;
    }

    // Insertar nuevo empleado
    public boolean insertar(Empleado emp) throws Exception {
        String sql = "INSERT INTO Empleados (numeroDui, nombrePersona, usuario, numeroTelefono, correoInstitucional, fechaNacimiento) "
                + "VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection con = ConexionBD.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, emp.getNumeroDui());
            ps.setString(2, emp.getNombrePersona());
            ps.setString(3, emp.getUsuario());
            ps.setString(4, emp.getNumeroTelefono());
            ps.setString(5, emp.getCorreoInstitucional());
            ps.setDate(6, Date.valueOf(emp.getFechaNacimiento()));

            return ps.executeUpdate() > 0;
        }
    }

    // Actualizar empleado
    public boolean actualizar(Empleado emp) throws Exception {
        String sql = "UPDATE Empleados SET numeroDui=?, nombrePersona=?, usuario=?, numeroTelefono=?, correoInstitucional=?, fechaNacimiento=? "
                + "WHERE idEmpleado=?";
        try (Connection con = ConexionBD.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, emp.getNumeroDui());
            ps.setString(2, emp.getNombrePersona());
            ps.setString(3, emp.getUsuario());
            ps.setString(4, emp.getNumeroTelefono());
            ps.setString(5, emp.getCorreoInstitucional());
            ps.setDate(6, Date.valueOf(emp.getFechaNacimiento()));
            ps.setInt(7, emp.getIdEmpleado());

            return ps.executeUpdate() > 0;
        }
    }

    // Eliminar empleado
    public boolean eliminar(int idEmpleado) throws Exception {
        String sql = "DELETE FROM Empleados WHERE idEmpleado = ?";
        try (Connection con = ConexionBD.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, idEmpleado);
            return ps.executeUpdate() > 0;
        }
    }
}
