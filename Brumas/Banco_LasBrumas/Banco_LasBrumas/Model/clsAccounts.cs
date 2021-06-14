using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;




namespace Banco_LasBrumas.Model
{
    public class clsAccounts
    {

        string stConexion = "";
        SqlCommand sqlCommand = null;
        SqlConnection sqlConnection = null;
        SqlParameter sqlParameter = null;
        SqlDataAdapter sqlDataAdapter = null;

        public clsAccounts()
        {
            Banco_LasBrumas.co.clsConexion obclsConexion = new Banco_LasBrumas.co.clsConexion();
            stConexion = obclsConexion.stGetConexion();
        }


        public string Verificar_transferencia(string origin_account,string destiny_account,float amount,string detail, string tipo)
        {
            string resultado = "";

            string sql = "SP_TRANSFERENCE_EVALUATION";
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cnn"].ToString()))
            {
                con.Open();
                SqlCommand com = new SqlCommand(sql, con);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.Add(new SqlParameter("@cuenta_origen", origin_account));
                com.Parameters.Add(new SqlParameter("@cuenta_destino", destiny_account));
                com.Parameters.Add(new SqlParameter("@amount", amount));
                com.Parameters.Add(new SqlParameter("@detail", detail));
                com.Parameters.Add(new SqlParameter("@tipo", tipo));
                SqlParameter res = new SqlParameter("@respuesta", SqlDbType.VarChar, 20);
                res.Direction = ParameterDirection.Output;
                com.Parameters.Add(res);
                com.ExecuteNonQuery();
                resultado = com.Parameters["@respuesta"].Value.ToString();
                con.Close();

            }

            return resultado;

        }

        public string resultado_transferencia(string origin_account,string destiny_account, float amount, string detail, string tipo, string estado)
        {
            string resultado = "";

            string sql = "SP_TRANFERENCE_RESULT";
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cnn"].ToString()))
            {
                con.Open();
                SqlCommand com = new SqlCommand(sql, con);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.Add(new SqlParameter("@cuenta_origen", origin_account));
                com.Parameters.Add(new SqlParameter("@cuenta_destino", destiny_account));
                com.Parameters.Add(new SqlParameter("@amount", amount));
                com.Parameters.Add(new SqlParameter("@detail", detail));
                com.Parameters.Add(new SqlParameter("@tipo", tipo));
                com.Parameters.Add(new SqlParameter("@result", estado));
                SqlParameter res = new SqlParameter("@respuesta", SqlDbType.VarChar, 20);
                res.Direction = ParameterDirection.Output;
                com.Parameters.Add(res);
                com.ExecuteNonQuery();
                resultado = com.Parameters["@respuesta"].Value.ToString();
                con.Close();
            }
            return resultado;
        }


        public string Verificar_transaccion(string account,float amount,string empresa,string detail,string tipo)
        {
            string resultado = "";

            string sql = "SP_TRANSACTION_EVALUATION";
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cnn"].ToString()))
            {
                con.Open();
                SqlCommand com = new SqlCommand(sql, con);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.Add(new SqlParameter("@num_cuenta", account));
                com.Parameters.Add(new SqlParameter("@amount", amount));
                com.Parameters.Add(new SqlParameter("@empresa", empresa));
                com.Parameters.Add(new SqlParameter("@detail", detail));
                com.Parameters.Add(new SqlParameter("@tipo", tipo));
                SqlParameter res = new SqlParameter("@respuesta", SqlDbType.VarChar, 20);
                res.Direction = ParameterDirection.Output;
                com.Parameters.Add(res);
                com.ExecuteNonQuery();
                resultado = com.Parameters["@respuesta"].Value.ToString();
                con.Close();

            }

            return resultado;

        }

        public string resultado_transaccion(string account, float amount, string empresa, string detail, string tipo,string estado)
        {
            string resultado = "";

            string sql = "SP_TRANSACTION_RESULT";
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cnn"].ToString()))
            {
                con.Open();
                SqlCommand com = new SqlCommand(sql, con);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.Add(new SqlParameter("@num_cuenta", account));
                com.Parameters.Add(new SqlParameter("@amount", amount));
                com.Parameters.Add(new SqlParameter("@empresa", empresa));
                com.Parameters.Add(new SqlParameter("@detail", detail));
                com.Parameters.Add(new SqlParameter("@tipo", tipo));
                com.Parameters.Add(new SqlParameter("@result", estado));
                SqlParameter res = new SqlParameter("@respuesta", SqlDbType.VarChar, 20);
                res.Direction = ParameterDirection.Output;
                com.Parameters.Add(res);
                com.ExecuteNonQuery();
                resultado = com.Parameters["@respuesta"].Value.ToString();
                con.Close();
            }
            return resultado;
        }


        public DataTable Datos_Cliente(string id)
        {
            DataSet dsConsulta = new DataSet();

            sqlConnection = new SqlConnection(stConexion);
            sqlConnection.Open();

            sqlCommand = new SqlCommand("SP_DATOS_CLIENTE", sqlConnection);
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.Parameters.Add(new SqlParameter("@cod_cliente", id));
            sqlCommand.ExecuteNonQuery();
            sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            DataTable dt = new DataTable();
            sqlDataAdapter.Fill(dt);

            sqlDataAdapter.Fill(dsConsulta);

            return dt;
        }

        public DataTable Sedes_Bancarias()
        {
            DataSet dsConsulta = new DataSet();

            sqlConnection = new SqlConnection(stConexion);
            sqlConnection.Open();

            sqlCommand = new SqlCommand("SP_OBTENER_SEDES", sqlConnection);
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.ExecuteNonQuery();
            sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            DataTable dt = new DataTable();
            sqlDataAdapter.Fill(dt);
            
            sqlDataAdapter.Fill(dsConsulta);

            return dt;
        }

        public void Editar_Cliente(string id, string email, string phone, string direction,string contrasena)
        {
            sqlConnection = new SqlConnection(stConexion);
            sqlConnection.Open();
            sqlCommand = new SqlCommand("SP_EDIT_PROFILE", sqlConnection);
            sqlCommand.Parameters.Add(new SqlParameter("@id_cliente", id));
            sqlCommand.Parameters.Add(new SqlParameter("@email", email));
            sqlCommand.Parameters.Add(new SqlParameter("@phone", phone));
            sqlCommand.Parameters.Add(new SqlParameter("@direction", direction));
            sqlCommand.Parameters.Add(new SqlParameter("@contrasena", contrasena));
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.ExecuteNonQuery();

        }

        


    }
}