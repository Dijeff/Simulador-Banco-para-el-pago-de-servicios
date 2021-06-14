using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Banco_LasBrumas.Controller
{
    public partial class Controller_Technical_Support : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Banco_LasBrumas.Model.clsAccounts obclsSedes = new Banco_LasBrumas.Model.clsAccounts();
            DataTable sedes = obclsSedes.Sedes_Bancarias();
            ddlLista.DataTextField = "nombre";
            ddlLista.DataValueField = "nombre";
            ddlLista.DataSource = sedes;
            ddlLista.DataBind();
        }

        protected void Ingresar_btn_Click(object sender, EventArgs e)
        {
            string sede = Request[ddlLista.UniqueID];
            string subject = Request[Subject.UniqueID];
            string message = Request[Message.UniqueID];

            Subject.Text = "";
            Message.Text = "";


        }
    }
}