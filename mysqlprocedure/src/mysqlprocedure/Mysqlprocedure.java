/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mysqlprocedure;

/**
 *
 * @author DIJEFF
 */

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Iván Salas
 * <http://programandoointentandolo.com>
 */

public class Mysqlprocedure {

    /**
     * @param args the command line arguments
     */
    private Connection miConexion; 
     private PreparedStatement ps;
    private ResultSet rs;
    
     public boolean autenticacion(int usuario){
       
         //crea conexion
        Conexion conexion = new Conexion();

        //se utiliza para ejecutar proceso
        CallableStatement stmt = null;
        
        int idMensaje = 1;
        int textoMensaje= 0;
        String textoMensaje2= null;
        try ( Connection cnx =Conexion.getConexion()) {

            System.out.println("Creando sentencia...");
            //el sql de invocación utiliza la notacion call + nombre proceso + parametros requeridos pro el proceso ? separados por ,
            String sql = "{call spConsultarAgua (?,?,?)}";
            stmt = cnx.prepareCall(sql);

            //Bind IN parameter first, then bind OUT parameter
            
            stmt.setInt(1, usuario); // Asigna 1 al ide de mensaje
            // El segundo parametro es de salida; pero debe registrarse
            stmt.registerOutParameter(2, java.sql.Types.NUMERIC);
            stmt.registerOutParameter(3, java.sql.Types.VARCHAR);
            //Invocar el metodo execute parr ejecutar el procedimiento alamecenado 'getMensaje' y recuperar el resultado 
            System.out.println("Ejecutando el procedimiento almacenado getMensaje...");
            stmt.execute();

            //Recupera el texto del mensaje y lo imprime en la consola
            textoMensaje = stmt.getInt(2);
             textoMensaje2=stmt.getString(3);
            System.out.println("Mensaje con el ID:"
                    + idMensaje + " is " + textoMensaje+textoMensaje2);
            //cerrar recursos
            stmt.close();
            cnx.close();;

        } catch (Exception e) {
            System.out.println(e);
        }
         return false;
    
    }
   
    
    public static void main(String[] args) {
        
        
        Mysqlprocedure con=new Mysqlprocedure();
       
         System.out.print( con.autenticacion(1020304));
    }
}