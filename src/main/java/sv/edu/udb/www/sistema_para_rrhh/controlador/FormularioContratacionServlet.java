package sv.edu.udb.www.sistema_para_rrhh.controlador;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import sv.edu.udb.www.sistema_para_rrhh.dao.ContratacionesDao;
import sv.edu.udb.www.sistema_para_rrhh.modelo.Contratacion;

import java.io.IOException;
import java.sql.Date;

@WebServlet(value = "/FormularioContratacionServlet")
public class FormularioContratacionServlet extends HttpServlet {
    private ContratacionesDao contratacionDAO;

    @Override
    public void init() {
        contratacionDAO = new ContratacionesDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Cargar listas para los selects
        request.setAttribute("departamentos", contratacionDAO.listarDepartamentos());
        request.setAttribute("empleados", contratacionDAO.listarEmpleados());
        request.setAttribute("cargos", contratacionDAO.listarCargos());
        request.setAttribute("tipos", contratacionDAO.listarTipos());

        System.out.println("norma obtener datos");

        request.getRequestDispatcher("vista/FormularioContratacion.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String accion = request.getParameter("accion");

        if ("insertar".equals(accion)) {
            Contratacion c = new Contratacion();
            c.setIdDepartamento(Integer.parseInt(request.getParameter("idDepartamento")));
            c.setIdEmpleado(Integer.parseInt(request.getParameter("idEmpleado")));
            c.setIdCargo(Integer.parseInt(request.getParameter("idCargo")));
            c.setIdTipoContratacion(Integer.parseInt(request.getParameter("idTipoContratacion")));
            c.setFechaContratacion(Date.valueOf(request.getParameter("fechaContratacion")));
            c.setSalario(Double.parseDouble(request.getParameter("salario")));
            c.setEstado(Boolean.parseBoolean(request.getParameter("estado")));

            contratacionDAO.insertar(c);
            response.sendRedirect("ContratacionesServlet"); // Redirige al listado
        }
    }
}
