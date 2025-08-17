package sv.edu.udb.www.sistema_para_rrhh;

public class conexionBD {
    private static final String URL = "jdbc:mysql://localhost:3306/tu_bd?useSSL=false&serverTimezone=UTC";
    private static final String USER = "root";
    private static final String PASS = "colocar_password";

    public static Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(URL, USER, PASS);
    }
}
