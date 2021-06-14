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
    public class correo
    {
        string stConexion = "";
        SqlCommand sqlCommand = null;
        SqlConnection sqlConnection = null;
        SqlParameter sqlParameter = null;
        SqlDataAdapter sqlDataAdapter = null;
        public correo()
        {
            Banco_LasBrumas.co.clsConexion obclsConexion = new Banco_LasBrumas.co.clsConexion();
            stConexion = obclsConexion.stGetConexion();
        }

        public string Token(String usuario)
        {
            try
            {
                var lettersUpper =
                       Enumerable.Range('A', 'Z' - 'A' + 1)
                       .Select(x => (char)x);

                var lettersLower =
                    Enumerable.Range('a', 'z' - 'a' + 1)
                    .Select(x => (char)x);

                var numbers =
                    Enumerable.Range('0', '9' - '0' + 1)
                    .Select(x => (char)x);

                var alphabet =
                    lettersUpper
                    .Union(lettersLower)
                    .Union(numbers)
                    .ToArray();

                Random rand = new Random();
                var password = string.Empty;

                for (int i = 0; i < 5; i++)
                {
                    var idx = rand.Next(alphabet.Count());
                    password += alphabet[idx];
                }


                sqlConnection = new SqlConnection(stConexion);
                sqlConnection.Open();

                sqlCommand = new SqlCommand("SP_Actualizar_Token", sqlConnection);
                sqlCommand.CommandType = CommandType.StoredProcedure;

                sqlCommand.Parameters.Add(new SqlParameter("@cod_cliente", usuario));
                sqlCommand.Parameters.Add(new SqlParameter("@token", password));

                sqlCommand.ExecuteNonQuery();



                return password;
            }
            catch (Exception ex)
            { throw ex; }
            finally { sqlConnection.Close(); }
        }
        public void Enviar(string destinatario, string asunto, string mensaje)
        {


            System.Net.Mail.MailMessage mmsg = new System.Net.Mail.MailMessage();
            mmsg.To.Add(destinatario);
            mmsg.Subject = asunto;
            mmsg.SubjectEncoding = System.Text.Encoding.UTF8;

            mmsg.Body = mensaje;
            mmsg.BodyEncoding = System.Text.Encoding.UTF8;
            mmsg.IsBodyHtml = true;
            mmsg.From = new System.Net.Mail.MailAddress("banco.brumas@gmail.com");



            System.Net.Mail.SmtpClient cliente = new System.Net.Mail.SmtpClient();
            cliente.Credentials = new System.Net.NetworkCredential("banco.brumas@gmail.com", "bancopass");

            cliente.Port = 587;
            cliente.EnableSsl = true;


            cliente.Host = "smtp.gmail.com";

            try
            {
                cliente.Send(mmsg);
            }
            catch (Exception)
            {


            }

        }
        public DataSet stvalidarpreguntas(string lnIdentificacion, string respuesta1, string respuesta2, string respuesta3)
        {

            try
            {
                DataSet dsConsulta = new DataSet();

                sqlConnection = new SqlConnection(stConexion);
                sqlConnection.Open();

                sqlCommand = new SqlCommand("SP_validar_preguntas", sqlConnection);
                sqlCommand.CommandType = CommandType.StoredProcedure;

                sqlCommand.Parameters.Add(new SqlParameter("@cod_cliente", lnIdentificacion));
                sqlCommand.Parameters.Add(new SqlParameter("@res1", respuesta1));
                sqlCommand.Parameters.Add(new SqlParameter("@res2", respuesta2));
                sqlCommand.Parameters.Add(new SqlParameter("@res3", respuesta3));

                sqlCommand.ExecuteNonQuery();
                sqlDataAdapter = new SqlDataAdapter(sqlCommand);
                sqlDataAdapter.Fill(dsConsulta);

                return dsConsulta;
            }
            catch (Exception ex)
            { throw ex; }
            finally { sqlConnection.Close(); }
        }
        public string temporal(String usuario)
        {
            try
            {
                var lettersUpper =
                       Enumerable.Range('A', 'Z' - 'A' + 1)
                       .Select(x => (char)x);

                var lettersLower =
                    Enumerable.Range('a', 'z' - 'a' + 1)
                    .Select(x => (char)x);

                var numbers =
                    Enumerable.Range('0', '9' - '0' + 1)
                    .Select(x => (char)x);

                var alphabet =
                    lettersUpper
                    .Union(lettersLower)
                    .Union(numbers)
                    .ToArray();

                Random rand = new Random();
                var password = string.Empty;

                for (int i = 0; i < 8; i++)
                {
                    var idx = rand.Next(alphabet.Count());
                    password += alphabet[idx];
                }


                sqlConnection = new SqlConnection(stConexion);
                sqlConnection.Open();

                sqlCommand = new SqlCommand("SP_Actualizar_contra", sqlConnection);
                sqlCommand.CommandType = CommandType.StoredProcedure;

                sqlCommand.Parameters.Add(new SqlParameter("@cod_cliente", usuario));
                sqlCommand.Parameters.Add(new SqlParameter("@contratemp", password));

                sqlCommand.ExecuteNonQuery();



                return password;
            }
            catch (Exception ex)
            { throw ex; }
            finally { sqlConnection.Close(); }
        }
    }


}