using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;

namespace Banco_LasBrumas.View
{
    public partial class M8_Interbank_Transfer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //string id = Session["cod_cliente"] as string;
            string id = "304940495";
            Banco_LasBrumas.mo.clsClientes obclsSedes = new Banco_LasBrumas.mo.clsClientes();

            DataTable sedes = obclsSedes.Sedes_Bancarias(id);

            cuenta_origen.DataTextField = "num_tarjeta";

            cuenta_origen.DataValueField = "num_tarjeta";

            cuenta_origen.DataSource = sedes;

            cuenta_origen.DataBind();
        }

        protected void Transfer_btn_Click(object sender, EventArgs e)
        {
            if ((string.IsNullOrEmpty(cuenta_origen.Text))) throw new Exception("Ingrese el usuario y la contraseña");
            {
                Banco_LasBrumas.Model.clsAccounts accounts_info = new Banco_LasBrumas.Model.clsAccounts();

                float amount = float.Parse(monto.Text);
                string tipo_proceso = "TRANSFERENCE";
                string proceso = accounts_info.Verificar_transferencia(cuenta_origen.Text,cuenta_destino.Text,amount,detalle.Text,tipo_proceso);



                Banco_LasBrumas.mo.clsClientes obclsSedes = new Banco_LasBrumas.mo.clsClientes();

                if (proceso.Equals("In process"))
                {

                    string result = obclsSedes.webServiceTransferencia(cuenta_origen.Text,cuenta_destino.Text,detalle.Text,amount);

                    proceso = accounts_info.resultado_transferencia(cuenta_origen.Text,cuenta_destino.Text,amount,detalle.Text, tipo_proceso, result);
                    lb_mensaje.Visible = true;
                    lb_mensaje.Text = proceso;
                }
                else
                {
                    lb_mensaje.Visible = true;
                    lb_mensaje.Text = proceso;
                }
            }


        }
    }
}