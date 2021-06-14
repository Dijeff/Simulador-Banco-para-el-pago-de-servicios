using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Banco_LasBrumas.Controller
{
    public partial class controlador_loans_info : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = "304940495";
            Banco_LasBrumas.Model.clsSaving obclsPlanes = new Banco_LasBrumas.Model.clsSaving();
            DataSet planes = obclsPlanes.mostraridloans();

            datosplan.DataSource = planes;
            datosplan.DataBind();


        }
    }
}