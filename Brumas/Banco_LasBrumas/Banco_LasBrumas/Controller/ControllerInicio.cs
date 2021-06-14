using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Banco_LasBrumas.Controller
{
   
    public partial class ControllerInicio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            DateTime dt = DateTime.Today;

            api.wsindicadoreseconomicosSoapClient Cliente = new api.wsindicadoreseconomicosSoapClient();
            DataSet compra = Cliente.ObtenerIndicadoresEconomicos("317", dt.ToString("dd/MM/yyyy"), dt.ToString("dd/MM/yyyy"), "Proyecto Programación", "N", "daniel.gomez.leiva@cuc.cr", "MO20CDCZE0"); ;
            lb_mensaje.Visible = true;
            lb_mensaje.Text = Convert.ToString(Convert.ToInt32(compra.Tables[0].Rows[0].ItemArray[2]));
            DataSet venta = Cliente.ObtenerIndicadoresEconomicos("318", dt.ToString("dd/MM/yyyy"), dt.ToString("dd/MM/yyyy"), "Proyecto Programación", "N", "daniel.gomez.leiva@cuc.cr", "MO20CDCZE0"); ;
            lb_mensaje1.Visible = true;
            lb_mensaje1.Text = Convert.ToString(Convert.ToInt32(venta.Tables[0].Rows[0].ItemArray[2]));


        }
    }
}