/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package sv.edu.udb.www.sistema_para_rrhh.controlador;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.PrintWriter;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "ConexionBDServlet", urlPatterns = {"/ConexionBDServlet"})
public class ConexionBDServlet extends HttpServlet {

    
    private static final String URL  =
            "jdbc:mysql://localhost:3306/recursoshumano_udb"
            + "?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
    private static final String USER = "rrhh_user";
    private static final String PASS = "TuClaveFuerte123!"; // <-- cambia si corresponde

    static {
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("No se encontró el driver MySQL JDBC", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.setContentType("text/plain; charset=UTF-8");

        try (PrintWriter out = resp.getWriter()) {
            try (Connection cn = DriverManager.getConnection(URL, USER, PASS)) {
                out.println("Conexión OK a MySQL ✅");

                // Contar registros en la tabla empleado
                String sql = "SELECT COUNT(*) FROM empleado";
                try (PreparedStatement ps = cn.prepareStatement(sql);
                     ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        out.println("Empleados en BD: " + rs.getInt(1));
                    }
                }
            } catch (SQLException ex) {
                resp.setStatus(500);
                out.println("ERROR al conectar/consultar:");
                out.println(ex.getMessage());
                for (Throwable t : ex) out.println("\t" + t);
            }
        }
    }
}
