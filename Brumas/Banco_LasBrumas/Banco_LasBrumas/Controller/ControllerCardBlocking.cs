using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Banco_LasBrumas.Controller
{
    public partial class ControllerCardBlocking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Session["cod_cliente"] as string;
            Banco_LasBrumas.mo.clsClientes obclsSedes = new Banco_LasBrumas.mo.clsClientes();

            DataTable sedes = obclsSedes.Sedes_Bancarias(id);

            ddlLista.DataTextField = "num_tarjeta";

            ddlLista.DataValueField = "num_tarjeta";

            ddlLista.DataSource = sedes;

            ddlLista.DataBind();

        }

        protected void btnConsultar_Click(object sender, EventArgs e)
        {
            try
            {

                Banco_LasBrumas.mo.clsClientes obclsClientes = new Banco_LasBrumas.mo.clsClientes();
                DataSet dsConsulta = obclsClientes.stConsultarCard(Convert.ToInt64(ddlLista.Text));

               
            }
            catch (Exception ex) { }
        }

    }
}

