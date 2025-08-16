package sv.edu.udb.www.sistema_para_rrhh;

import sv.edu.udb.www.sistema_para_rrhh.dao.UsuarioDAO;
import sv.edu.udb.www.sistema_para_rrhh.model.Usuario;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private final UsuarioDAO usuarioDAO = new UsuarioDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        String user = req.getParameter("usuario");
        String pass = req.getParameter("password");

        if (user == null || pass == null || user.isBlank() || pass.isBlank()) {
            req.setAttribute("error", "Debe ingresar usuario y contraseña.");
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
            return;
        }

        try {
            String hash = usuarioDAO.obtenerHash(user);
            if (hash != null && BCrypt.checkpw(pass, hash)) {
                Usuario u = usuarioDAO.buscarPorUsuario(user);
                HttpSession ses = req.getSession(true);
                ses.setAttribute("usuarioLogueado", u);

                resp.sendRedirect(req.getContextPath() + "/home.jsp");
            } else {
                req.setAttribute("error", "Usuario o contraseña inválidos.");
                req.getRequestDispatcher("/login.jsp").forward(req, resp);
            }
        } catch (Exception e) {
            throw new ServletException("Error validando credenciales", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/login.jsp").forward(req, resp);
    }
}

