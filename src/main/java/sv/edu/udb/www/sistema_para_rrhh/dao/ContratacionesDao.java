package sv.edu.udb.www.sistema_para_rrhh.dao;

import sv.edu.udb.www.sistema_para_rrhh.conexion.ConexionBD;
import sv.edu.udb.www.sistema_para_rrhh.modelo.ListaContratacion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
}
