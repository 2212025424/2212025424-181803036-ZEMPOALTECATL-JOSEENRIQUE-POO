package config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {

    private static final String HOST = "Localhost";
    private static final String DB = "usuarios?serverTimezone=UTC";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    public static void main(String args[]) {
        System.out.println("Hola como estás");

        System.out.println("\n\nAbriendo la conexion....");

        Conexion conexion = new Conexion();
        conexion.getConexion();

        System.out.println("Fin de la ejecucion...\n\n");

    }

    public Connection getConexion() {

        Connection conexion = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conexion = DriverManager.getConnection("jdbc:mysql://" + HOST + "/" + DB + "", USER, PASSWORD);
            System.out.println("La conexion de ha realizado correctamente..");
        } catch (SQLException e) {
            System.out.println("SQLERROR: ha ocurrido un error al establecer la conexion");
        } catch (ClassNotFoundException e) {
            System.out.println("ERROR: ha ocurrido un error con el driver de conexion --> " + e);
        }

        return conexion;

    }

}
