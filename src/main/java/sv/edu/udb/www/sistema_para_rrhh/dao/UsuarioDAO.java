package sv.edu.udb.www.sistema_para_rrhh.dao;

import sv.edu.udb.www.sistema_para_rrhh.conexion.ConexionBD;
import sv.edu.udb.www.sistema_para_rrhh.modelo.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UsuarioDAO {
    public String obtenerPassword(String usuario) throws Exception {
        String sql = "SELECT password_hash FROM usuarios WHERE username = ?";
        try (Connection con = ConexionBD.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, usuario);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("password_hash");
                }
            }
        } catch (Exception e){
            return null;
        }
        return null;
    }
    public Usuario buscarPorUsuario(String usuario) throws Exception {
        String sql = "SELECT id, username, nombre FROM usuarios WHERE username = ?";
        try (Connection con = ConexionBD.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, usuario);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Usuario u = new Usuario();
                    u.setId(rs.getInt("id"));
                    u.setUsername(rs.getString("username"));
                    u.setNombre(rs.getString("nombre"));
                    return u;
                }
            } catch (SQLException e){
                return null;
            }
        } catch (Exception e){
            return null;
        }
        return null;
    }
}
