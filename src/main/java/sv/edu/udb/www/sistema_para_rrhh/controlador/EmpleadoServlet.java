package sv.edu.udb.www.sistema_para_rrhh.controlador;

import sv.edu.udb.www.sistema_para_rrhh.dao.EmpleadoDAO;
import sv.edu.udb.www.sistema_para_rrhh.modelo.Empleado;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

@WebServlet(name = "EmpleadoServlet", urlPatterns = {"/EmpleadoServlet"})
public class EmpleadoServlet extends HttpServlet {

    private EmpleadoDAO dao = new EmpleadoDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) action = "listar";

        try {
            switch (action) {

                // Mostrar lista de empleados
                case "listar":
                    List<Empleado> empleados = dao.listar();
                    request.setAttribute("empleados", empleados);
                    RequestDispatcher rd = request.getRequestDispatcher("vista/empleados.jsp");
                    rd.forward(request, response);
                    break;

                // Mostrar formulario para crear un nuevo empleado
                case "nuevo":
                    request.getRequestDispatcher("vista/empleadoForm.jsp").forward(request, response);
                    break;

                // Guardar empleado (insertar o actualizar)
                case "guardar":
                    int idEmpleado = request.getParameter("idEmpleado") != null && !request.getParameter("idEmpleado").isEmpty()
                            ? Integer.parseInt(request.getParameter("idEmpleado")) : 0;

                    Empleado emp = new Empleado(
                            idEmpleado,
                            request.getParameter("numeroDui"),
                            request.getParameter("nombrePersona"),
                            request.getParameter("usuario"),
                            request.getParameter("numeroTelefono"),
                            request.getParameter("correoInstitucional"),
                            LocalDate.parse(request.getParameter("fechaNacimiento"))
                    );

                    if (idEmpleado > 0) {
                        dao.actualizar(emp);
                    } else {
                        dao.insertar(emp);
                    }

                    response.sendRedirect("EmpleadoServlet?action=listar");
                    break;

                // Mostrar formulario para editar un empleado
                case "editar":
                    int idEditar = Integer.parseInt(request.getParameter("id"));
                    Empleado empEditar = dao.buscarPorId(idEditar);
                    request.setAttribute("empleado", empEditar);
                    request.getRequestDispatcher("vista/empleadoForm.jsp").forward(request, response);
                    break;

                // Eliminar un empleado
                case "eliminar":
                    int idEliminar = Integer.parseInt(request.getParameter("id"));
                    dao.eliminar(idEliminar);
                    response.sendRedirect("EmpleadoServlet?action=listar");
                    break;

                default:
                    response.sendRedirect("EmpleadoServlet?action=listar");
                    break;
            }
        } catch (Exception e) {
            throw new ServletException("Error en EmpleadoServlet: " + e.getMessage(), e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
