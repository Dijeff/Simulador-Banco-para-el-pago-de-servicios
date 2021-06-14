using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Banco_LasBrumas.Model
{
    public class cslogin
    {
        string stConexion = "";
        SqlCommand sqlCommand = null;
        SqlConnection sqlConnection = null;
        SqlParameter sqlParameter = null;
        SqlDataAdapter sqlDataAdapter = null;


        public cslogin()
        {
            Banco_LasBrumas.co.clsConexion obclsConexion = new Banco_LasBrumas.co.clsConexion();
            stConexion = obclsConexion.stGetConexion();
        }
        public DataSet stConsultarCliente(string lnIdentificacion, string lnContraseña)
        {
            
            try
            {
                DataSet dsConsulta = new DataSet();

                sqlConnection = new SqlConnection(stConexion);
                sqlConnection.Open();

                sqlCommand = new SqlCommand("SP_DATOS_CLIENTE_Login", sqlConnection);
                sqlCommand.CommandType = CommandType.StoredProcedure;

                sqlCommand.Parameters.Add(new SqlParameter("@cod_cliente", lnIdentificacion));
                sqlCommand.Parameters.Add(new SqlParameter("@contraseña", lnContraseña));

                sqlCommand.ExecuteNonQuery();
                sqlDataAdapter = new SqlDataAdapter(sqlCommand);
                sqlDataAdapter.Fill(dsConsulta);

                return dsConsulta;
            }
            catch (Exception ex)
            { throw ex; }
            finally { sqlConnection.Close(); }
        }

        
            public DataSet stConsultarToken(string lnIdentificacion, string token)
            {

            try
            {
                DataSet dsConsulta = new DataSet();

                sqlConnection = new SqlConnection(stConexion);
                sqlConnection.Open();

                sqlCommand = new SqlCommand("SP_validar_token", sqlConnection);
                sqlCommand.CommandType = CommandType.StoredProcedure;

                sqlCommand.Parameters.Add(new SqlParameter("@cod_cliente", lnIdentificacion));
                sqlCommand.Parameters.Add(new SqlParameter("@token", token));

                sqlCommand.ExecuteNonQuery();
                sqlDataAdapter = new SqlDataAdapter(sqlCommand);
                sqlDataAdapter.Fill(dsConsulta);

                return dsConsulta;
            }
            catch (Exception ex)
            { throw ex; }
            finally { sqlConnection.Close(); }
        }

        public void crear_Bitacora(string lnIdentificacion, string accion)
        {

            try
            {
               

                sqlConnection = new SqlConnection(stConexion);
                sqlConnection.Open();

                sqlCommand = new SqlCommand("Testfecha", sqlConnection);
                sqlCommand.CommandType = CommandType.StoredProcedure;

                sqlCommand.Parameters.Add(new SqlParameter("@cod_cliente", lnIdentificacion));
                sqlCommand.Parameters.Add(new SqlParameter("@accion",accion));

                sqlCommand.ExecuteNonQuery();
            }
            catch (Exception ex)
            { throw ex; }
            finally { sqlConnection.Close(); }
        }


    }
}
