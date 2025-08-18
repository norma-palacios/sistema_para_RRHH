package sv.edu.udb.www.sistema_para_rrhh.controlador;

import sv.edu.udb.www.sistema_para_rrhh.modelo.Usuario;
import sv.edu.udb.www.sistema_para_rrhh.dao.UsuarioDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/auth/login")
public class LoginServlet extends HttpServlet {

    private final UsuarioDAO usuarioDAO = new UsuarioDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        String user = req.getParameter("username");
        String pass = req.getParameter("password");

        if (user == null || pass == null || user.isBlank() || pass.isBlank()) {
            req.setAttribute("error", "Debe ingresar usuario y contraseña.");
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
            return;
        }

        try {
            String password = usuarioDAO.obtenerPassword(user);
            if (password != null && validarPassword(pass, password)) {
                Usuario u = usuarioDAO.buscarPorUsuario(user);
                HttpSession ses = req.getSession(true);
                ses.setAttribute("usuarioLogueado", u);

                resp.sendRedirect(req.getContextPath() + "/ContratacionesServlet");
            } else {
                req.setAttribute("error", "Usuario o contraseña inválidos.");
                req.getRequestDispatcher("/login.jsp").forward(req, resp);
            }
        } catch (Exception e) {
            throw new ServletException("Error validando credenciales", e);
        }
    }

    private boolean validarPassword(String pass, String password){
        return pass.equals(password);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/login.jsp").forward(req, resp);
    }
}

