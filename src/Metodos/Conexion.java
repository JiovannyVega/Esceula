package Metodos;

import static Pantallas.Login.con;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import javax.swing.JTextField;

public class Conexion {

    public static boolean login(Statement st, String nombre, String contrseña) {
        int cont = 0;

        try {
            ResultSet rs = st.executeQuery("select * from usuario");
            while (rs.next()) {
                if (nombre.equals(rs.getString("NomUsuario")) && contrseña.equals(rs.getString("Contraseña"))) {
                    cont++;
                    return true;
                }
            }
            if (cont == 0) {
                JOptionPane.showMessageDialog(null, "Usuario o contraseña incorrectos");
                System.out.println("Usuario o contraseña incorrectos");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public static void mostrar(Statement st, ResultSet rs) {
        try {
            rs = st.executeQuery("select * from usuarios");
            while (rs.next()) {
                System.out.println("Usuario:" + rs.getString("Nombre") + "\nContraseña: " + rs.getString("contraseña") + "\n");
            }
            //con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public static void mostrarCP(Statement st, int cp, JTextField estado, JTextField municipio, JTextField colonia) {
        try {
            ResultSet rs = st.executeQuery("select * from codigoPostal where id = " + cp);
            rs.next();
            estado.setText(rs.getString("estado"));
            //ciudad.setText(rs.getString("ciudad"));
            municipio.setText(rs.getString("ciudad"));
            colonia.setText(rs.getString("colonia"));
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public static void mostrarNC(JTextField txtNumControl) {
        try {
            Statement st = Pantallas.Login.con.createStatement();
            int max = 0;
            ResultSet rs = st.executeQuery("select NumControl from alumno");
            while (rs.next()) {
                max = Math.max(max, rs.getInt("NumControl"));
            }
            txtNumControl.setText(String.valueOf(max + 1));
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public static boolean crearUsuario(String nombre, String contraseña, ResultSet rs, Statement st) {
        try {
            PreparedStatement ps = con.prepareStatement("INSERT INTO usuario VALUES (?,?)");
            try {
                rs = st.executeQuery("select * from usuario");
                while (rs.next()) {
                    if (nombre.equals(rs.getString("Nombre"))) {
                        JOptionPane.showMessageDialog(null, "Ese nombre ya esta en uso");
                        return false;
                    }
                }
                ps.setString(1, nombre);
                ps.setString(2, contraseña);
                ps.executeUpdate();
                System.out.println("cuenta creada");
                JOptionPane.showMessageDialog(null, "Cuenta creada con exito!!");
            } catch (Exception e) {
                System.out.println(e);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return true;
    }
    
    public static void crearAlumno(int numeroControl, String nombre, String apellido1, String apellido2, int cp, String calle, int numExt, int numInt, String FN, String sexo, String telefono, String email, Statement st) {
        try {
            ResultSet rs = st.executeQuery("select * from alumno");
            PreparedStatement ps = con.prepareStatement("insert into alumno values (?,?,?,?,?,?,?,?,?,?,?,?)");
            while (rs.next()) {                
                if (numeroControl == rs.getInt("numero_control")) {
                    JOptionPane.showMessageDialog(null, "Ese numero de control ya esta en uso");
                }
            }
            ps.setInt(1, numeroControl);
            ps.setString(2, nombre);
            ps.setString(3, apellido1);
            ps.setString(4, apellido2);
            ps.setInt(5, cp);
            ps.setString(6, calle);
            ps.setInt(7, numExt);
            ps.setInt(8, numInt);
            ps.setString(9, FN);
            ps.setString(10, sexo);
            ps.setString(11, telefono);
            ps.setString(12, email);
            ps.executeUpdate();
            JOptionPane.showMessageDialog(null, "Alumno registrado con exito!!");
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
