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
    public partial class ControllerNewLoan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Banco_LasBrumas.mo.clsClientes obclsSedes = new Banco_LasBrumas.mo.clsClientes();

            String sedes = obclsSedes.identificacion();

            identificador.InnerText =sedes;
        }


    }
}
