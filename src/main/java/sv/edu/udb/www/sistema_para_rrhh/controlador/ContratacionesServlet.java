package sv.edu.udb.www.sistema_para_rrhh.controlador;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import sv.edu.udb.www.sistema_para_rrhh.dao.ContratacionesDao;
import sv.edu.udb.www.sistema_para_rrhh.modelo.Contratacion;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

public class ContratacionesServlet extends HttpServlet {
ContratacionesDao dao = new ContratacionesDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      List<Contratacion> lista = dao.listar();
      request.setAttribute("listaContrataciones", lista);
      RequestDispatcher rd = request.getRequestDispatcher("vista/Home.jsp");
      rd.forward(request,response);
    }
}
