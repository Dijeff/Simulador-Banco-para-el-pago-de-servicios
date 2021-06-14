using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Services.Description;
using System.Data;

namespace Proyecto_Banco
{
    public partial class Login : System.Web.UI.Page
    {
        

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_ingresar_Click(object sender, EventArgs e)
        {
           
            try
            {
              String  MyConnection = ConfigurationManager.ConnectionStrings["cnn"].ConnectionString;

                SqlConnection con = new SqlConnection(MyConnection);
                SqlCommand command = new SqlCommand("select * from CLIENTE where cod_cliente= @cod_cliente and contraseña=@contraseña", con);
                command.Parameters.AddWithValue("cod_cliente", txt_usuario.Text);
                command.Parameters.AddWithValue("contraseña", txt_contraseña.Text);

                SqlDataAdapter sda = new SqlDataAdapter(command);

                DataTable dt = new DataTable();
                sda.Fill(dt);
                con.Open();
                command.ExecuteNonQuery();

                if (dt.Rows.Count > 0)
                {

                    using (SqlDataReader oReader = command.ExecuteReader())
                    {
                        while (oReader.Read())
                        {
                            Session["cod_cliente"] = oReader["cod_cliente"].ToString();
               
                        }
                    }
                    con.Close();
                    Response.Redirect("MenuPrincipal.aspx");
                }
                else
                {
                   lb_mensaje.Visible = true;
                   lb_mensaje.Text = "The username or password is incorrect";
                }
            }
            catch (Exception ex)
            {
                lb_mensaje.Text = ex.ToString();

            }
        }   
    }
}