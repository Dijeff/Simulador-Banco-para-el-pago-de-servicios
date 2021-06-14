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


namespace Servicio_Transaccion
{
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de clase "Service1" en el código, en svc y en el archivo de configuración.
    // NOTE: para iniciar el Cliente de prueba WCF para probar este servicio, seleccione Service1.svc o Service1.svc.cs en el Explorador de soluciones e inicie la depuración.
    public class Service1 : IService1
    {
        public string transaccion(string origin_account, string destiny_account, string detalle, float monto)
        {
            string result = "";
           
            string tipo = "TRANSFERENCE";
            string sql = "";


            sql = "SP_TRANSFERENCIA_INTERBANCARIA";
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cns"].ToString()))
            {
                con.Open();
                SqlCommand com = new SqlCommand(sql, con);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.Add(new SqlParameter("@detalle", detalle));
                com.Parameters.Add(new SqlParameter("@tipo", tipo));
                com.Parameters.Add(new SqlParameter("@cuenta_origen", origin_account));
                com.Parameters.Add(new SqlParameter("@cuenta_destino", destiny_account));
                com.Parameters.Add(new SqlParameter("@monto", monto));
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
