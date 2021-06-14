using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace Banco_LasBrumas.Model
{

    public class clsSaving
    {
        string stConexion = "";
        SqlCommand sqlCommand = null;
        SqlConnection sqlConnection = null;
        SqlParameter sqlParameter = null;
        SqlDataAdapter sqlDataAdapter = null;
        public clsSaving()
        {

            Banco_LasBrumas.co.clsConexion obclsConexion = new Banco_LasBrumas.co.clsConexion();

            stConexion = obclsConexion.stGetConexion();
        }

        public DataSet mostraridplanes()
        {
            
            
            try
            {
                Banco_LasBrumas.Controller.Products_Account dato = new Banco_LasBrumas.Controller.Products_Account();
                string dato1 = dato.getproduct_id();
                DataSet dsConsulta = new DataSet();

                sqlConnection = new SqlConnection(stConexion);
                sqlConnection.Open();

                sqlCommand = new SqlCommand("SPidplan", sqlConnection);
                sqlCommand.CommandType = CommandType.StoredProcedure;

                sqlCommand.Parameters.Add(new SqlParameter("@id_plan", dato1));

                sqlCommand.ExecuteNonQuery();
                sqlDataAdapter = new SqlDataAdapter(sqlCommand);
                sqlDataAdapter.Fill(dsConsulta);

                return dsConsulta;
            }
            catch (Exception ex) { throw ex; }
            finally { sqlConnection.Close(); }
        }
        public DataSet mostraridloans()
        {


            try
            {
                Banco_LasBrumas.Controller.Products_Account dato = new Banco_LasBrumas.Controller.Products_Account();
                string dato1 = dato.getproduct_id();
                DataSet dsConsulta = new DataSet();

                sqlConnection = new SqlConnection(stConexion);
                sqlConnection.Open();

                sqlCommand = new SqlCommand("SPidprestamo", sqlConnection);
                sqlCommand.CommandType = CommandType.StoredProcedure;

                sqlCommand.Parameters.Add(new SqlParameter("@cod_prestamo", dato1));

                sqlCommand.ExecuteNonQuery();
                sqlDataAdapter = new SqlDataAdapter(sqlCommand);
                sqlDataAdapter.Fill(dsConsulta);

                return dsConsulta;
            }
            catch (Exception ex) { throw ex; }
            finally { sqlConnection.Close(); }
        }
        public DataSet mostraridcredit()
        {


            try
            {
                Banco_LasBrumas.Controller.Products_Account dato = new Banco_LasBrumas.Controller.Products_Account();
                string dato1 = dato.getproduct_id();
                DataSet dsConsulta = new DataSet();

                sqlConnection = new SqlConnection(stConexion);
                sqlConnection.Open();

                sqlCommand = new SqlCommand("SPidahorros", sqlConnection);
                sqlCommand.CommandType = CommandType.StoredProcedure;

                sqlCommand.Parameters.Add(new SqlParameter("@id_cuenta", dato1));

                sqlCommand.ExecuteNonQuery();
                sqlDataAdapter = new SqlDataAdapter(sqlCommand);
                sqlDataAdapter.Fill(dsConsulta);

                return dsConsulta;
            }
            catch (Exception ex) { throw ex; }
            finally { sqlConnection.Close(); }
        }
        public DataSet mostraridaccount()
        {


            try
            {
                Banco_LasBrumas.Controller.Products_Account dato = new Banco_LasBrumas.Controller.Products_Account();
                string dato1 = dato.getproduct_id();
                DataSet dsConsulta = new DataSet();

                sqlConnection = new SqlConnection(stConexion);
                sqlConnection.Open();

                sqlCommand = new SqlCommand("SPidahorros", sqlConnection);
                sqlCommand.CommandType = CommandType.StoredProcedure;

                sqlCommand.Parameters.Add(new SqlParameter("@id_cuenta", dato1));

                sqlCommand.ExecuteNonQuery();
                sqlDataAdapter = new SqlDataAdapter(sqlCommand);
                sqlDataAdapter.Fill(dsConsulta);

                return dsConsulta;
            }
            catch (Exception ex) { throw ex; }
            finally { sqlConnection.Close(); }
        }
    }
}