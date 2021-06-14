using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Banco_LasBrumas.Controller
{
    public partial class Controller_Login : System.Web.UI.Page
    {
        protected void btn_ingresar_Click(object sender, EventArgs e)
        {
            try
            {

                if ((string.IsNullOrEmpty(txt_usuario.Text))&(string.IsNullOrEmpty(txt_contraseña.Text)))throw new Exception("Ingrese el usuario y la contraseña");
                {
                    Banco_LasBrumas.Model.cslogin obclsClientes = new Banco_LasBrumas.Model.cslogin();
                    DataSet dsConsulta = obclsClientes.stConsultarCliente((txt_usuario.Text),(txt_contraseña.Text));

                    if (dsConsulta.Tables[0].Rows.Count == 0)
                    {

                        lb_mensaje.Visible = true;
                        lb_mensaje.Text = "The username or password is incorrect";
                    }
                    else
                    {
                        Banco_LasBrumas.Model.correo obcorreo = new Banco_LasBrumas.Model.correo();
                       
                       

                        //En este bluce for  obtiene el codigo de cliente, lo que se hace es recorrer el dsconsulta y se obtiene el cod_cliente. cuando
                        //ya lo tengo, se le asigna a la variable cod_cliente.
                        string cod_cliente = "";
                        string email = "";
                        string Asunto = "Token";

                        for (int i = 0; i < dsConsulta.Tables[0].Rows.Count; i++)
                        {
                            cod_cliente = dsConsulta.Tables[0].Rows[i]["id_cliente"].ToString();
                            email = dsConsulta.Tables[0].Rows[i]["email"].ToString();
                        }
                        String Token = obcorreo.Token(cod_cliente);
                        obcorreo.Enviar(email,Asunto,Token);



                        Session["cod_cliente"]= cod_cliente;


                        Response.Redirect("M1_Home.aspx");


                    }  
                }
               


            }
            catch (Exception ex) { }
        }
    }
}