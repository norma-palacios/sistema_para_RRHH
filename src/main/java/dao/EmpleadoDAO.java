/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import conexion.Conexion;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmpleadoDAO {

    public List<String> listarEmpleados() {
        List<String> empleados = new ArrayList<>();
        String sql = "SELECT nombrePersona, usuario, correoInstitucional FROM dbo.Empleado";

        try (Connection conn = Conexion.get();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                String fila = rs.getString("nombrePersona") + " - " +
                              rs.getString("usuario") + " - " +
                              rs.getString("correoInstitucional");
                empleados.add(fila);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return empleados;
    }
}