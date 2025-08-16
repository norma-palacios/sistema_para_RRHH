/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
    private static final String URL =
        "jdbc:sqlserver://GABRIEL:1433;" +
        "databaseName=recursoshumano_udb;" +
        "encrypt=true;" +
        "trustServerCertificate=true;" +
        "integratedSecurity=true;";

    public static Connection get() throws SQLException {
        return DriverManager.getConnection(URL);
    }
}
