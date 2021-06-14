using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Banco_LasBrumas.Controller
{
    public partial class Controller_preguntas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Save_Client_click(object sender, EventArgs e)
        {
            string identification = Request[idq.UniqueID];
            string pregunta1 = Request[q1.UniqueID];
            string pregunta2 = Request[q2.UniqueID];
            string pregunta3 = Request[q3.UniqueID];

            Banco_LasBrumas.Model.correo obcorreo = new Banco_LasBrumas.Model.correo();

            DataSet dsConsulta = obcorreo.stvalidarpreguntas(identification, pregunta1, pregunta2, pregunta3);

            if (dsConsulta.Tables[0].Rows.Count == 0)
            {

                lb_mensaje.Visible = true;
                lb_mensaje.Text = "Questions or wrong user";
            }
            else {
                string cod_cliente = "";
                string email = "";
                string Asunto = "Contrasena Temporal";

                for (int i = 0; i < dsConsulta.Tables[0].Rows.Count; i++)
                {
                    cod_cliente = dsConsulta.Tables[0].Rows[i]["id_cliente"].ToString();
                    email = dsConsulta.Tables[0].Rows[i]["email"].ToString();
                }
                String contrasena = obcorreo.temporal(cod_cliente);
                obcorreo.Enviar(email, Asunto, contrasena);

                Response.Redirect("M3_Login.aspx");
            }

        }
    }
}