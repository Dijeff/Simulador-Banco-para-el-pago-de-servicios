/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DIJEFF
 */
public class Conexion {
    
    private static Connection conexion;
    private static final String driver="com.mysql.jdbc.Driver";
    private static final String usuario="root";
     private static final String password="";
     private static final String url="jdbc:mysql://localhost:3306/bdsa";
      private static  String mensaje;
    
      public static Connection getConexion() throws InstantiationException, IllegalAccessException{
     
      try{
      Class.forName(driver);
      conexion=DriverManager.getConnection(url,usuario,password);
      mensaje="Conectado a la base de datos";
      return conexion;
      }catch(ClassNotFoundException | SQLException ex){
      mensaje=ex.getMessage()+"hola";
      return null;}
      
      }
      
      public static void cerrar(){
      try{
      conexion.close();
      mensaje="Conexion cerrada";
      }catch(SQLException ex){
       mensaje="Problemas de conexion";
      }
      }
      
      
       public static String getMensaje(){
       return mensaje;
       }
       
//     public static void main(String[]args){
//           Conexion con=new Conexion();
//        
//            System.out.print(con.getMensaje());
//        
//       }
}