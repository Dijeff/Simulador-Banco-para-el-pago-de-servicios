using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Banco_LasBrumas.Model
{
    public class clstransactions
    {

        string stConexion = "";
        SqlCommand sqlCommand = null;
        SqlConnection sqlConnection = null;
        SqlParameter sqlParameter = null;
        SqlDataAdapter sqlDataAdapter = null;


        public clstransactions() {
            Banco_LasBrumas.co.clsConexion obclsConexion = new Banco_LasBrumas.co.clsConexion();
            stConexion = obclsConexion.stGetConexion();
        }
        public DataSet stConsultarMovimientos(string lnIdentificacion)
        {
            try
            {
                DataSet dsConsulta = new DataSet();

                sqlConnection = new SqlConnection(stConexion);
                sqlConnection.Open();

                sqlCommand = new SqlCommand("spConsultarMovimientos", sqlConnection);
                sqlCommand.CommandType = CommandType.StoredProcedure;

                sqlCommand.Parameters.Add(new SqlParameter("@nIdentificacion", lnIdentificacion));

                sqlCommand.ExecuteNonQuery();
                sqlDataAdapter = new SqlDataAdapter(sqlCommand);
                sqlDataAdapter.Fill(dsConsulta);

                return dsConsulta;
            }
            catch (Exception ex) 
            { throw ex; }
            finally { sqlConnection.Close(); }
        }
    }
}




