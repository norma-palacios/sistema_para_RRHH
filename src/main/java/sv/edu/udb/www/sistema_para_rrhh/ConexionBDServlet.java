/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package sv.edu.udb.www.sistema_para_rrhh;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import conexion.Conexion;

/**
 *
 * @author felix
 */
@WebServlet(name = "ConexionBDServlet", urlPatterns = {"/ConexionBDServlet"})
public class ConexionBDServlet extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
    resp.setCharacterEncoding("UTF-8");
    resp.setContentType("text/plain; charset=UTF-8");

    try (Connection cn = Conexion.get();
         PreparedStatement ps = cn.prepareStatement("SELECT COUNT(*) FROM dbo.Empleado");
         ResultSet rs = ps.executeQuery();
         PrintWriter out = resp.getWriter()) {

      rs.next();
      out.println("Conexión OK a SQL Server");
      out.println("Empleados en BD: " + rs.getInt(1));

    } catch (SQLException e) {
      resp.setStatus(500);
      try (PrintWriter out = resp.getWriter()) {
        out.println("ERROR al conectar/consultar:");
        e.printStackTrace(out);
      }
    }
  }
}
