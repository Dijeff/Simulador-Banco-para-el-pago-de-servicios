/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ws;

import Modelo.Conexion;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author DIJEFF
 */
@WebService(serviceName = "agua")
public class agua {
// private static Connection cnx =null;
 
 
    @WebMethod(operationName = "hell")
    public String hell(@WebParam(name = "name") int txt,String provedor ) throws InstantiationException, IllegalAccessException {
        
        
       Conexion conexion = new Conexion();

        //se utiliza para ejecutar proceso
        CallableStatement stmt = null;
        
        int idMensaje = 1;
        int textoMensaje= 0;
        String textoMensaje2= null;
         String    p_resultado = "";
          int   factura= 0;
           int  cliente= 0;
         String    nombre= "";
           String  apellidos = "";
           int  monto= 0;
          String   fecha = "";
           String  estado= "";
        
        try ( Connection cnx =conexion.getConexion()) {

        
            
            //el sql de invocación utiliza la notacion call + nombre proceso + parametros requeridos pro el proceso ? separados por ,
            String sql = "{call SP_CONSULTS (?,?,?,?,?,?,?,?,?,?)}";
            stmt = cnx.prepareCall(sql);

            //Bind IN parameter first, then bind OUT parameter
            
            stmt.setInt(1, txt);
            stmt.setString(2, provedor);// Asigna 1 al ide de mensaje
            // El segundo parametro es de salida; pero debe registrarse
            stmt.registerOutParameter(3, java.sql.Types.VARCHAR);
            stmt.registerOutParameter(4, java.sql.Types.NUMERIC);
            stmt.registerOutParameter(5, java.sql.Types.NUMERIC);
            stmt.registerOutParameter(6, java.sql.Types.VARCHAR);
            stmt.registerOutParameter(7, java.sql.Types.VARCHAR);
            stmt.registerOutParameter(8, java.sql.Types.NUMERIC);
            stmt.registerOutParameter(9, java.sql.Types.VARCHAR);
            stmt.registerOutParameter(10, java.sql.Types.VARCHAR);
            //Invocar el metodo execute parr ejecutar el procedimiento alamecenado 'getMensaje' y recuperar el resultado 
           
            stmt.execute();

            //Recupera el texto del mensaje y lo imprime en la consola
            p_resultado = stmt.getString(3);
            factura=stmt.getInt(4);
             cliente = stmt.getInt(5);
             nombre=stmt.getString(6);
             apellidos = stmt.getString(7);
             monto=stmt.getInt(8);
             fecha = stmt.getString(9);
             estado=stmt.getString(10);
             stmt.close();
            cnx.close();
            
            if(p_resultado.contains("OK")){
                
            return factura+","+ cliente +","+ nombre+" "+ apellidos+"," +monto+","+fecha +","+estado;
            
            }else{
             return p_resultado+","+"jiji";
            }
            

        } catch (Exception e) {
            System.out.println(e);
        }

        return p_resultado;
        
    }
    
   @WebMethod(operationName = "pago")
    public String pago(@WebParam(name = "name") String account, String proveedor, int factura) throws InstantiationException, IllegalAccessException {
        
       Connection cn = null; // variable de conexion
    Statement st = null;  // variable de instruccion SQL
    ResultSet rs = null; // variable de registros o filas
            String result = "";
            String detalle = "Whater Service Payment";
            String tipo = "Deposit";
            String cuenta_proveedor = "";
            String sql = "";
            int amount = 0;

            
             Conexion conexion = new Conexion();
             

        //se utiliza para ejecutar proceso
        CallableStatement stmt = null;
        
        
        
        try ( Connection cnx =conexion.getConexion()) {
            
            String sql1 = "{call SP_ACCOUNT_CONSULT (?,?)}";
            
            stmt = cnx.prepareCall(sql1);

            stmt.setString(1, proveedor);
         
            stmt.registerOutParameter(2, java.sql.Types.VARCHAR);
            
            stmt.execute();
            
             cuenta_proveedor=stmt.getString(2);
             
             stmt.close();
            cnx.close();
        } catch (Exception e) {
            System.out.println(e);
        }
            
        try ( Connection cnx =conexion.getConexion()) {
            
          String  sql2 = "{call SP_AMOUNT_CONSULT (?,?)}";
            
            stmt = cnx.prepareCall(sql2);

            stmt.setInt(1, factura);
         
            stmt.registerOutParameter(2, java.sql.Types.NUMERIC);
           
            
            stmt.execute();

             amount=stmt.getInt(2);
             
             stmt.close();
            cnx.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        
         try ( Connection cnx =conexion.getConexion()) {
            
          String  sql2 = "{call SP_AMOUNT_CONSULT (?,?)}";
            
            stmt = cnx.prepareCall(sql2);

            stmt.setInt(1, factura);
         
            stmt.registerOutParameter(2, java.sql.Types.NUMERIC);
           
            
            stmt.execute();

             amount=stmt.getInt(2);
             
             stmt.close();
            cnx.close();
        } catch (Exception e) {
            System.out.println(e);
        }
            
             try ( Connection cnx =conexion.getConexion()) {
            
          String  sql2 = "{call SP_AMOUNT_CONSULT (?,?)}";
            
            stmt = cnx.prepareCall(sql2);

            stmt.setInt(1, factura);
         
            stmt.registerOutParameter(2, java.sql.Types.NUMERIC);
           
            
            stmt.execute();

             amount=stmt.getInt(2);
             
             
             
             stmt.close();
            cnx.close();
        } catch (Exception e) {
            System.out.println(e);
        }
            
            
            
           
try {
 String connectionUrl = "jdbc:sqlserver://DESKTOP-MU64ERI:1433;" +
            "databaseName=STATETRUST; user=provedor; password=12345sa;"; 
  //connectionUrl = "jdbc:sqlserver://localhost:1433;databasename=PUBS;integratedSecurity=true";
  Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
       //return(DriverManager.getConnection(connectionUrl));
          
                   cn = DriverManager.getConnection(connectionUrl);
            st = cn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_READ_ONLY);
        
            
            try(CallableStatement cstmt = cn.prepareCall("{call SP_TRANSACTIONS(?,?,?,?,?,?)}"); ) {  
        cstmt.setString("detalle", detalle);  
        cstmt.setString("tipo", tipo);  
        cstmt.setString("cuenta_origen", account);  
        cstmt.setString("cuenta_destino", cuenta_proveedor);  
        cstmt.setInt("monto", amount);  
        cstmt.registerOutParameter("result", java.sql.Types.VARCHAR);  
        cstmt.execute();  
        
        result=cstmt.getString("result");  
        
        cstmt.close();
    }  
            
          
    }catch (Exception e)
    {
        System.out.println("Error: " + e.getMessage());
    }
   
            
        try ( Connection cnx =conexion.getConexion()) {
            
            String sql1 = "{call SP_TRANSACTIONS_ELECTRICITY (?,?,?,?,?,?,?,?)}";
            
            stmt = cnx.prepareCall(sql1);

            stmt.setInt(1, factura);
            stmt.setString(2, detalle);
            stmt.setString(3, tipo);
            stmt.setString(4, account);
            stmt.setString(5, cuenta_proveedor);
            stmt.setInt(6, amount);
            stmt.setString(7, result);
         
            stmt.registerOutParameter(8, java.sql.Types.VARCHAR);
            
            stmt.execute();
            
             result=stmt.getString(8);
             
             stmt.close();
            cnx.close();
        } catch (Exception e) {
            System.out.println(e);
        }    
          

            return result;
        
    }
    
    
    
}
