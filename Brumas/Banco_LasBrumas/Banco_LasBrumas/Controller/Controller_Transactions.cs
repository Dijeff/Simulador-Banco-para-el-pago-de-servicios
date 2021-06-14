using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace Banco_LasBrumas.Controller
{
    public partial class Controller_Transactions : System.Web.UI.Page
    {
            protected void Page_Load(object sender, EventArgs e)
            {
            
            String codigo = Session["cod_cliente"] as string;

            try
            {

                if (!string.IsNullOrEmpty(codigo))
                {
                    Banco_LasBrumas.Model.clstransactions transac = new Banco_LasBrumas.Model.clstransactions();

                    DataSet dsConsulta = transac.stConsultarMovimientos(codigo);

                    if (dsConsulta.Tables[0].Rows.Count == 0)
                    {
                        gvwDatos.DataSource = null;
                    }
                    else
                    {
                        gvwDatos.DataSource = dsConsulta;
                    }
                   

                    gvwDatos.DataBind();
                }
                else
                {
                    ////Response.Write("<script>alert('No tiene transacciones recientes!')</script>");
                    //ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Alert", "No tiene transacciones recientes!", true);
                }
                
                
            }
            catch (Exception ex) { }
            }
        }


}

