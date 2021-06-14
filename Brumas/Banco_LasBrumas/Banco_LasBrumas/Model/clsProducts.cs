using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data;
using System.Data.SqlClient;

namespace Banco_LasBrumas.Model
{
    public class clsProducts
    {
        string stConexion = "";
        SqlCommand sqlCommand = null;
        SqlConnection sqlConnection = null;
        SqlParameter sqlParameter = null;
        SqlDataAdapter sqlDataAdapter = null;

        public clsProducts()
        {
            Banco_LasBrumas.co.clsConexion obclsConexion = new Banco_LasBrumas.co.clsConexion();
            stConexion = obclsConexion.stGetConexion();
        }


        public DataTable View_Saving_Accounts(string id)
        {
            DataSet dsConsulta = new DataSet();

            sqlConnection = new SqlConnection(stConexion);
            sqlConnection.Open();

            sqlCommand = new SqlCommand("SP_VIEW_SAVING_ACCOUNTS", sqlConnection);
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.Parameters.Add(new SqlParameter("@id_cliente", id));
            sqlCommand.ExecuteNonQuery();
            sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            DataTable dt = new DataTable();
            sqlDataAdapter.Fill(dt);

            sqlDataAdapter.Fill(dsConsulta);

            return dt;
        }


        public DataTable View_Credit_Cards(string id)
        {
            DataSet dsConsulta = new DataSet();

            sqlConnection = new SqlConnection(stConexion);
            sqlConnection.Open();

            sqlCommand = new SqlCommand("SP_VIEW_CREDIT_CARDS", sqlConnection);
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.Parameters.Add(new SqlParameter("@id_cliente", id));
            sqlCommand.ExecuteNonQuery();
            sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            DataTable dt = new DataTable();
            sqlDataAdapter.Fill(dt);

            sqlDataAdapter.Fill(dsConsulta);

            return dt;
        }

        public DataTable View_Loans(string id)
        {
            DataSet dsConsulta = new DataSet();

            sqlConnection = new SqlConnection(stConexion);
            sqlConnection.Open();

            sqlCommand = new SqlCommand("SP_VIEW_LOANS", sqlConnection);
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.Parameters.Add(new SqlParameter("@id_cliente", id));
            sqlCommand.ExecuteNonQuery();
            sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            DataTable dt = new DataTable();
            sqlDataAdapter.Fill(dt);

            sqlDataAdapter.Fill(dsConsulta);

            return dt;
        }


        public DataTable View_Saving_Plans(string id)
        {
            DataSet dsConsulta = new DataSet();

            sqlConnection = new SqlConnection(stConexion);
            sqlConnection.Open();

            sqlCommand = new SqlCommand("SP_VIEW_SAVING_PLANS", sqlConnection);
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.Parameters.Add(new SqlParameter("@id_cliente", id));
            sqlCommand.ExecuteNonQuery();
            sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            DataTable dt = new DataTable();
            sqlDataAdapter.Fill(dt);

            sqlDataAdapter.Fill(dsConsulta);

            return dt;
        }


    }

   

}