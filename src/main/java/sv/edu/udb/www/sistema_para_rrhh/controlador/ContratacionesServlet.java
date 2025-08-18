package sv.edu.udb.www.sistema_para_rrhh.controlador;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import sv.edu.udb.www.sistema_para_rrhh.dao.ContratacionesDao;
import sv.edu.udb.www.sistema_para_rrhh.modelo.ListaContratacion;

import java.io.IOException;
import java.util.List;

@WebServlet("/ContratacionesServlet")
public class ContratacionesServlet extends HttpServlet {
ContratacionesDao dao = new ContratacionesDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      List<ListaContratacion> lista = dao.listar();
      request.setAttribute("listaContrataciones", lista);
      RequestDispatcher rd = request.getRequestDispatcher("vista/Home.jsp");
      rd.forward(request,response);
    }
}
