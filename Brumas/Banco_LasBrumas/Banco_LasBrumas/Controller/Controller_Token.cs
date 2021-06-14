using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Banco_LasBrumas.Controller
{
    public partial class Controller_Token : System.Web.UI.Page
    {
        protected void btn_ingresar_Click(object sender, EventArgs e)
        {
            try
            {

                if ((string.IsNullOrEmpty(txt_token.Text))) throw new Exception("Ingrese el token");
                {
                    string usuario = Convert.ToString(Session["cod_cliente"]);
                    Banco_LasBrumas.Model.cslogin obclsClientes = new Banco_LasBrumas.Model.cslogin();
                    DataSet dsConsulta = obclsClientes.stConsultarToken(usuario, (txt_token.Text));

                    if (dsConsulta.Tables[0].Rows.Count == 0)
                    {

                        lb_mensaje.Visible = true;
                        lb_mensaje.Text = "The username or password is incorrect";
                    }
                    else
                    {

                        Banco_LasBrumas.Model.cslogin cd = new Banco_LasBrumas.Model.cslogin();
                        String accion;
                        accion = "Login";
                        cd.crear_Bitacora(usuario,accion);
                        Response.Redirect("M1_Home.aspx");


                    }
                }



            }
            catch (Exception ex) { }
        }
    }
}