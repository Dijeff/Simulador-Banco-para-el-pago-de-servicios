using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Configuration;

namespace Banco_LasBrumas.mo
{
    public class clsClientes
    {
        string stConexion = "";
        SqlCommand sqlCommand = null;
        SqlConnection sqlConnection = null;
        SqlParameter sqlParameter = null;
        SqlDataAdapter sqlDataAdapter = null;

        public clsClientes()
        {
            Banco_LasBrumas.co.clsConexion obclsConexion = new Banco_LasBrumas.co.clsConexion();
            stConexion = obclsConexion.stGetConexion();
        }



        public List<string> WebServicePhone(int nis, string provedor)
        {
            ServiceReference5.Service1Client client = new ServiceReference5.Service1Client();

            string returnString = client.consulta(nis, provedor);
            string datos = returnString;

            List<string> result = returnString.Split(',').ToList();




            return result;
        }

        //pago

        public string pagowebservicesPhone(String cuenta, string provedor, int factura)
        {
            ServiceReference5.Service1Client client = new ServiceReference5.Service1Client();

            string returnString = client.pago(cuenta, provedor, factura);

            return returnString;
        }


        public List<string> WebServiceInternet(int nis, string provedor)
        {
            ServiceReference4.Service1Client client = new ServiceReference4.Service1Client();

            string returnString = client.consulta(nis, provedor);
            string datos = returnString;

            List<string> result = returnString.Split(',').ToList();




            return result;
        }

        //pago

        public string pagowebservicesInternet(String cuenta, string provedor, int factura)
        {
            ServiceReference4.Service1Client client = new ServiceReference4.Service1Client();

            string returnString = client.pago(cuenta, provedor, factura);

            return returnString;
        }

        public string webServiceTransferencia(string cuenta_origen,string cuenta_destino,string detalle,float monto)
        {
            ServiceReference3.Service1Client cliente = new ServiceReference3.Service1Client();
            string returnString = cliente.transaccion(cuenta_origen,cuenta_destino,detalle,monto);
            return returnString;
        }


        public List<string> webservicesluz(int nis, string provedor)
        {
            
            ServiceReference2.Service1Client client = new ServiceReference2.Service1Client();

            string returnString = client.consulta(nis, provedor);
            string datos = returnString;

            List<string> result = returnString.Split(',').ToList();

            return result;
        }


        public string pagowebservicesluz(String cuenta, string provedor, int factura)
        {
            ServiceReference2.Service1Client client = new ServiceReference2.Service1Client();

            string returnString = client.pago(cuenta, provedor, factura);

            return returnString;
        }



        public DataSet stConsultarCard(long lnIdentificacion)
        {
            try
            {
                DataSet dsConsulta = new DataSet();

                sqlConnection = new SqlConnection(stConexion);
                sqlConnection.Open();

                sqlCommand = new SqlCommand("spBloquearTarjeta", sqlConnection);
                sqlCommand.CommandType = CommandType.StoredProcedure;

                sqlCommand.Parameters.Add(new SqlParameter("@nIdentificacion", lnIdentificacion));

                sqlCommand.ExecuteNonQuery();
                sqlDataAdapter = new SqlDataAdapter(sqlCommand);
                sqlDataAdapter.Fill(dsConsulta);

                return dsConsulta;
            }
            catch (Exception ex) { throw ex; }
            finally { sqlConnection.Close(); }
        }

        public DataSet stConsultarInternet(long lnIdentificacion)
        {
            try
            {
                DataSet dsConsulta = new DataSet();

                sqlConnection = new SqlConnection(stConexion);
                sqlConnection.Open();

                sqlCommand = new SqlCommand("spConsultarInternet", sqlConnection);
                sqlCommand.CommandType = CommandType.StoredProcedure;

                sqlCommand.Parameters.Add(new SqlParameter("@nIdentificacion", lnIdentificacion));

                sqlCommand.ExecuteNonQuery();
                sqlDataAdapter = new SqlDataAdapter(sqlCommand);
                sqlDataAdapter.Fill(dsConsulta);

                return dsConsulta;
            }
            catch (Exception ex) { throw ex; }
            finally { sqlConnection.Close(); }
        }

        public DataSet stConsultarPhone(long lnIdentificacion)
        {
            try
            {
                DataSet dsConsulta = new DataSet();

                sqlConnection = new SqlConnection(stConexion);
                sqlConnection.Open();

                sqlCommand = new SqlCommand("spConsultarPhone", sqlConnection);
                sqlCommand.CommandType = CommandType.StoredProcedure;

                sqlCommand.Parameters.Add(new SqlParameter("@nIdentificacion", lnIdentificacion));
                //sqlCommand.Parameters.Add(new SqlParameter("@cod_cliente", "305250863"));

                sqlCommand.ExecuteNonQuery();
                sqlDataAdapter = new SqlDataAdapter(sqlCommand);
                sqlDataAdapter.Fill(dsConsulta);

                return dsConsulta;
            }
            catch (Exception ex) { throw ex; }
            finally { sqlConnection.Close(); }
        }

        public DataTable Sedes_Bancarias(string id)
        {
            try
            {
                DataSet dsConsulta = new DataSet();

                sqlConnection = new SqlConnection(stConexion);

                sqlConnection.Open();

                sqlCommand = new SqlCommand("SP_OBTENER_cuentas", sqlConnection);
                sqlCommand.Parameters.Add(new SqlParameter("@id_cliente", id));
                sqlCommand.CommandType = CommandType.StoredProcedure;

                sqlCommand.ExecuteNonQuery();

                sqlDataAdapter = new SqlDataAdapter(sqlCommand);

                DataTable dt = new DataTable();

                sqlDataAdapter.Fill(dt);

                sqlDataAdapter.Fill(dsConsulta);

                return dt;
            }
            catch (Exception ex) { throw ex; }
            finally { sqlConnection.Close(); }
        }

        public List<string> webservicesagua(int nis, string provedor)
        {
            ServiceReference1.aguaClient client = new ServiceReference1.aguaClient();

            string returnString = client.hell(nis,provedor);
            string datos = returnString;

            List<string> result = returnString.Split(',').ToList();

            return result;
        }

        public string pagowebservicesagua(String cuenta, string provedor,int factura)
        {
            ServiceReference1.aguaClient client = new ServiceReference1.aguaClient();

            string returnString = client.pago(cuenta, provedor, factura);
            
            return returnString;
        }

        public DataSet stConsultarClientes(long lnIdentificacion)
        {
            try
            {
                DataSet dsConsulta = new DataSet();

                sqlConnection = new SqlConnection(stConexion);
                sqlConnection.Open();

                sqlCommand = new SqlCommand("spConsultarAgua", sqlConnection);
                sqlCommand.CommandType = CommandType.StoredProcedure;

                sqlCommand.Parameters.Add(new SqlParameter("@nIdentificacion", lnIdentificacion));

                sqlCommand.ExecuteNonQuery();
                sqlDataAdapter = new SqlDataAdapter(sqlCommand);
                sqlDataAdapter.Fill(dsConsulta);

                return dsConsulta;
            }
            catch (Exception ex) { throw ex; }
            finally { sqlConnection.Close(); }
        }




        public DataSet stConsultarluz(long lnIdentificacion)
        {
            try
            {
                DataSet dsConsulta = new DataSet();

                sqlConnection = new SqlConnection(stConexion);
                sqlConnection.Open();

                sqlCommand = new SqlCommand("spConsultarLuz", sqlConnection);
                sqlCommand.CommandType = CommandType.StoredProcedure;

                sqlCommand.Parameters.Add(new SqlParameter("@nIdentificacion", lnIdentificacion));

                sqlCommand.ExecuteNonQuery();
                sqlDataAdapter = new SqlDataAdapter(sqlCommand);
                sqlDataAdapter.Fill(dsConsulta);

                return dsConsulta;
            }
            catch (Exception ex) { throw ex; }
            finally { sqlConnection.Close(); }
        }

        public string stInsertarClientes(long lnIdentificacion,
                                            string stNombres,
                                            string stApellidos)
        {
            try
            {
                sqlConnection = new SqlConnection(stConexion);
                sqlConnection.Open();

                sqlCommand = new SqlCommand("spInsertarClientes", sqlConnection);
                sqlCommand.CommandType = CommandType.StoredProcedure;

                sqlCommand.Parameters.Add(new SqlParameter("@nIdentificacion", lnIdentificacion));
                sqlCommand.Parameters.Add(new SqlParameter("@cNombres", stNombres));
                sqlCommand.Parameters.Add(new SqlParameter("@cApellidos", stApellidos));

                sqlParameter = new SqlParameter();
                sqlParameter.ParameterName = "@cMensaje";
                sqlParameter.SqlDbType = SqlDbType.VarChar;
                sqlParameter.Size = 100;
                sqlParameter.Direction = ParameterDirection.Output;

                sqlCommand.Parameters.Add(sqlParameter);
                sqlCommand.ExecuteNonQuery();

                return sqlParameter.Value.ToString();
            }
            catch (Exception ex) { throw ex; }
            finally { sqlConnection.Close(); }
        }

        public string identificacion()
        {
            try
            {
                string nombre = "";

                string sql = "SELECT cod_cliente FROM CLIENTE WHERE cod_cliente=304940495";


                sqlConnection = new SqlConnection(stConexion);
                sqlConnection.Open();

                SqlCommand command = new SqlCommand(sql, sqlConnection);

                nombre = Convert.ToString(command.ExecuteScalar());




                return nombre;
            }
            catch (Exception ex) { throw ex; }
            finally { sqlConnection.Close(); }
        }


    }
}

namespace Banco_LasBrumas.mo
{
    public class Model
    {
    }

    class mo
    {
    }
}