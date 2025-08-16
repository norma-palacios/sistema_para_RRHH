package sv.edu.udb.www.sistema_para_rrhh;

import sv.edu.udb.www.sistema_para_rrhh.model.Usuario;
import sv.edu.udb.www.sistema_para_rrhh.util.ConexionBD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UsuarioDAO {
    public String obtenerHash(String usuario) throws Exception {
        String sql = "SELECT password_hash FROM usuarios WHERE usuario = ?";
        try (Connection con = ConexionBD.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, usuario);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("password_hash");
                }
            }
        }
        return null;
    }
    public Usuario buscarPorUsuario(String usuario) throws Exception {
        String sql = "SELECT id, usuario, nombre, rol FROM usuarios WHERE usuario = ?";
        try (Connection con = ConexionBD.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, usuario);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Usuario u = new Usuario();
                    u.setId(rs.getInt("id"));
                    u.setUsuario(rs.getString("usuario"));
                    u.setNombre(rs.getString("nombre"));
                    u.setRol(rs.getString("rol"));
                    return u;
                }
            }
        }
        return null;
    }
}

