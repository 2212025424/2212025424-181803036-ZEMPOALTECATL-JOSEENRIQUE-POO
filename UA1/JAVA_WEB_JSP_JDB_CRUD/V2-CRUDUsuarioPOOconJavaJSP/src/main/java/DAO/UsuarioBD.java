package DAO;

import config.Conexion;
import java.sql.*;
import java.util.ArrayList;
import script.MD5;

public class UsuarioBD {

    public static void main(String args[]) {

        Conexion c = new Conexion();

        UsuarioBD us = new UsuarioBD();

        ArrayList<Usuario> usuarios = us.obtenerUsuarios(c.getConexion());

        System.out.println(usuarios.size() + "Este es el tamaños mans");

    }

    public ArrayList obtenerUsuarios(Connection conexion) {

        Usuario usuario = null;

        ArrayList<Usuario> usuarios = new ArrayList<>();

        if (conexion != null) {

            try {

                Statement st = conexion.createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM usuario");

                while (rs.next()) {
                    usuario = new Usuario(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6));
                    usuarios.add(usuario);
                }

            } catch (SQLException e) {
                System.out.println("SQLERROR: ha ocurrido un error en la recolecion de datos.");
            }

        }

        return usuarios;

    }

    public Usuario obtenerUsuarioPorId(Connection conexion, int idUsuario) {

        Usuario usuario = null;

        if (conexion != null) {
            try {

                Statement st = conexion.createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM usuario where id=" + idUsuario + "");

                if (rs.next()) {
                    usuario = new Usuario(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6));
                }

            } catch (SQLException e) {
                System.out.println("SQLERROR: ha ocurrido un error en la recolecion de datos.");
            }
        }

        return usuario;

    }

    public boolean eliminarUsuarioPorId(Connection conexion, int idUsuario) {
        boolean eliminado = false;

        if (conexion != null) {
            try {

                Statement st = conexion.createStatement();

                int res = st.executeUpdate("DELETE FROM usuario WHERE id = " + idUsuario + "");

                if (res > 0) {
                    eliminado = true;
                }

            } catch (SQLException e) {
                System.out.println("SQLERROR: ha ocurrido un error en la recolecion de datos.");
            }
        }

        return eliminado;
    }

    public boolean insertarUsuario(Connection conexion, Usuario usuario) {

        boolean insertado = false;

        if (conexion != null) {
            try {

                Statement st = conexion.createStatement();

                String n = usuario.getNombre();
                int e = usuario.getEdad();
                String t = usuario.getTelefono();
                String c = usuario.getCorreo();
                String p = usuario.getPassword();

                p = MD5.getMd5(p);

                int res = st.executeUpdate("INSERT INTO usuario SET nombre = '" + n + "', edad=" + e + ", telefono='" + t + "', correo='" + c + "', password='" + p + "'");

                if (res > 0) {
                    insertado = true;
                }

            } catch (SQLException e) {
                System.out.println("SQLERROR: ha ocurrido un error en la recolecion de datos.");
            }
        }

        return insertado;

    }

    public boolean actualizarUsuarioPorId(Connection conexion, Usuario newUser, int id) {
        boolean actualizado = false;

        if (conexion != null) {
            try {
                Statement st = conexion.createStatement();

                String n = newUser.getNombre();
                int e = newUser.getEdad();
                String t = newUser.getTelefono();
                String c = newUser.getCorreo();
                String p = newUser.getPassword();

                int res = st.executeUpdate("UPDATE usuario SET nombre = '" + n + "', edad=" + e + ", telefono='" + t + "', correo='" + c + "' WHERE id = " + id + "");

                if (res > 0) {
                    actualizado = true;
                }
            } catch (SQLException e) {
                System.out.println("SQLERROR: ha ocurrido un error en la recolecion de datos.");
            }
        }
        return actualizado;

    }

    public boolean actualizarPasswordUsuario(Connection conexion, String newPass, int id) {
        boolean actualizado = true;

        if (conexion != null) {

            newPass = MD5.getMd5(newPass);

            try {
                Statement st = conexion.createStatement();

                int res = st.executeUpdate("UPDATE usuario SET password='" + newPass + "' WHERE id = " + id + "");

                if (res > 0) {
                    actualizado = true;
                }
            } catch (SQLException e) {
                System.out.println("SQLERROR: ha ocurrido un error en la recolecion de datos.");
            }
        }

        return actualizado;

    }

}
