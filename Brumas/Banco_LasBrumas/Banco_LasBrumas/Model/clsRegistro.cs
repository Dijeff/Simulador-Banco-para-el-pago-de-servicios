using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Hosting;
using System.IO;

using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Data.SqlClient;
using System.Data;

namespace Banco_LasBrumas.Model
{
    
    public class clsRegistro
    {
        string stConexion = "";
        SqlCommand sqlCommand = null;
        SqlConnection sqlConnection = null;
        SqlParameter sqlParameter = null;
        SqlDataAdapter sqlDataAdapter = null;

        public clsRegistro()
        {
            Banco_LasBrumas.co.clsConexion obclsConexion = new Banco_LasBrumas.co.clsConexion();
            stConexion = obclsConexion.stGetConexion();
        }

        public void registro_Cliente(string cod_cliente,string nombre, string apellidos,string telefono,string direccion,string fecha_de_nacimiento, string email , string contraseña,string a1, string a2 , string a3 )
        {

            try
            {
               // DataSet dsConsulta = new DataSet();

                sqlConnection = new SqlConnection(stConexion);
                sqlConnection.Open();

                sqlCommand = new SqlCommand("SP_REGISTRAR", sqlConnection);
                sqlCommand.CommandType = CommandType.StoredProcedure;
                sqlCommand.Parameters.Add(new SqlParameter("@cod_cliente", cod_cliente));
                sqlCommand.Parameters.Add(new SqlParameter("@nombre", nombre));
                sqlCommand.Parameters.Add(new SqlParameter("@apellidos", apellidos));

                sqlCommand.Parameters.Add(new SqlParameter("@telefono", telefono));
                sqlCommand.Parameters.Add(new SqlParameter("@direccion", direccion));

                sqlCommand.Parameters.Add(new SqlParameter("@fecha_nacimiento", fecha_de_nacimiento));
                sqlCommand.Parameters.Add(new SqlParameter("@email", email));
                sqlCommand.Parameters.Add(new SqlParameter("@contraseña", contraseña));

                sqlCommand.Parameters.Add(new SqlParameter("@respuesta1", a1));
                sqlCommand.Parameters.Add(new SqlParameter("@respuesta2", a2));
                sqlCommand.Parameters.Add(new SqlParameter("@respuesta3", a3));

                sqlCommand.ExecuteNonQuery();
                // sqlDataAdapter = new SqlDataAdapter(sqlCommand);
                // sqlDataAdapter.Fill(dsConsulta);

                //return dsConsulta;
                
            }
            catch (Exception ex)
            { throw ex; }
            finally { sqlConnection.Close(); }
            
            

        }


    }
}