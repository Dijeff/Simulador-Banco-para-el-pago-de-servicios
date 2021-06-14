using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;


using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace Servicio_Electricidad
{
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de clase "Service1" en el código, en svc y en el archivo de configuración.
    // NOTE: para iniciar el Cliente de prueba WCF para probar este servicio, seleccione Service1.svc o Service1.svc.cs en el Explorador de soluciones e inicie la depuración.
    public class Service1 : IService1
    {
       

        public string consulta(int numero_servicio, string proveedor)
        {
            DataSet datos = new DataSet();
            DataTable dt = new DataTable();


            string respuesta = "Ejemplo";
            string cod, cedula, nombre, apellidos, monto, fecha, estado;
            string sql = "SP_CONSULTS";
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cnn"].ToString()))
            {
                con.Open();
                SqlCommand com = new SqlCommand(sql, con);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.Add(new SqlParameter("@num_servicio", numero_servicio));
                com.Parameters.Add(new SqlParameter("@proveedor", proveedor));
                SqlParameter res = new SqlParameter("@resultado", SqlDbType.VarChar, 100);
                res.Direction = ParameterDirection.Output;
                com.Parameters.Add(res);
                com.ExecuteNonQuery();
                respuesta = com.Parameters["@resultado"].Value.ToString();
                con.Close();
                if (respuesta.Equals("OK"))
                {

                    SqlDataAdapter adp = new SqlDataAdapter(com);
                    adp.Fill(dt);

                    int cantidad = dt.Rows.Count;
                    string[] info = new string[cantidad];





                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        cod = dt.Rows[i]["cod_factura"].ToString();
                        cedula = dt.Rows[i]["cod_cliente"].ToString();
                        nombre = dt.Rows[i]["nombre"].ToString();
                        apellidos = dt.Rows[i]["apellidos"].ToString();
                        monto = dt.Rows[i]["monto"].ToString();
                        fecha = dt.Rows[i]["fecha_vencimiento"].ToString();
                        estado = dt.Rows[i]["estado"].ToString();
                        respuesta = cod + "," + cedula + "," + nombre + " " + apellidos + "," + monto + "," + fecha + "," + estado;

                    }
                    return respuesta;

                }
                else
                {

                    return respuesta;

                }
                //respuesta = Convert.ToString(com.ExecuteScalar());



            }


        }

        public string pago(string account, string proveedor, int factura)
        {
            string result = "";
            string detalle = "Electrical Service Payment";
            string tipo = "Deposit";
            string cuenta_proveedor = "";
            string sql = "";
            int amount = 0;

            sql = "SP_ACCOUNT_CONSULT";
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cnn"].ToString()))
            {
                con.Open();
                SqlCommand com = new SqlCommand(sql, con);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.Add(new SqlParameter("@supplier", proveedor));
                SqlParameter res = new SqlParameter("@num_cuenta", SqlDbType.NVarChar, 100);
                res.Direction = ParameterDirection.Output;
                com.Parameters.Add(res);
                com.ExecuteNonQuery();
                cuenta_proveedor = com.Parameters["@num_cuenta"].Value.ToString();
                con.Close();

            }


            sql = "SP_AMOUNT_CONSULT";
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cnn"].ToString()))
            {
                con.Open();
                SqlCommand com = new SqlCommand(sql, con);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.Add(new SqlParameter("@cod_factura", factura));
                SqlParameter res = new SqlParameter("@monto", SqlDbType.Int);
                res.Direction = ParameterDirection.Output;
                com.Parameters.Add(res);
                com.ExecuteNonQuery();
                amount = int.Parse(com.Parameters["@monto"].Value.ToString());
                con.Close();

            }


            sql = "SP_TRANSACTIONS";
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cns"].ToString()))
            {
                con.Open();
                SqlCommand com = new SqlCommand(sql, con);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.Add(new SqlParameter("@detalle", detalle));
                com.Parameters.Add(new SqlParameter("@tipo", tipo));
                com.Parameters.Add(new SqlParameter("@cuenta_origen", account));
                com.Parameters.Add(new SqlParameter("@cuenta_destino", cuenta_proveedor));
                com.Parameters.Add(new SqlParameter("@monto", amount));
                SqlParameter res = new SqlParameter("@result", SqlDbType.VarChar, 10);
                res.Direction = ParameterDirection.Output;
                com.Parameters.Add(res);
                com.ExecuteNonQuery();
                result = com.Parameters["@result"].Value.ToString();
                con.Close();
            }


            sql = "SP_TRANSACTIONS_ELECTRICITY";
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cnn"].ToString()))
            {
                con.Open();
                SqlCommand com = new SqlCommand(sql, con);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.Add(new SqlParameter("@cod_factura", factura));
                com.Parameters.Add(new SqlParameter("@detalle", detalle));
                com.Parameters.Add(new SqlParameter("@tipo", tipo));
                com.Parameters.Add(new SqlParameter("@cuenta_origen", account));
                com.Parameters.Add(new SqlParameter("@cuenta_destino", cuenta_proveedor));
                com.Parameters.Add(new SqlParameter("@monto", amount));
                com.Parameters.Add(new SqlParameter("@estado", result));
                SqlParameter res = new SqlParameter("@result", SqlDbType.VarChar, 10);
                res.Direction = ParameterDirection.Output;
                com.Parameters.Add(res);
                com.ExecuteNonQuery();
                result = com.Parameters["@result"].Value.ToString();
                con.Close();
            }


            return result;
        }



    }
}
