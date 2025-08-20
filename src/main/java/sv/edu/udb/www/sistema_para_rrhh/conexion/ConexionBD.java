package sv.edu.udb.www.sistema_para_rrhh.conexion;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConexionBD {
    private static final String URL = "jdbc:mysql://localhost:3306/empresa?useSSL=false&serverTimezone=UTC";
    private static final String USER = "root";
    private static final String PASS = "hola123";

    public static Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(URL, USER, PASS);
    }
}
