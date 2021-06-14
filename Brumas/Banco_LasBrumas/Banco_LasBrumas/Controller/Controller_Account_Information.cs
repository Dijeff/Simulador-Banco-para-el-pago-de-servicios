using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Banco_LasBrumas.Controller
{
    public partial class Controller_Account_Information : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Session["cod_cliente"] as string;

            Banco_LasBrumas.Model.clsAccounts obclsSedes = new Banco_LasBrumas.Model.clsAccounts();
            DataTable dt = obclsSedes.Datos_Cliente(id);

            string[] array0= dt.Rows.OfType<DataRow>().Select(k => k[0].ToString()).ToArray();
            string[] array1= dt.Rows.OfType<DataRow>().Select(k => k[1].ToString()).ToArray();
            string[] array2 = dt.Rows.OfType<DataRow>().Select(k => k[2].ToString()).ToArray();
            string[] array3 = dt.Rows.OfType<DataRow>().Select(k => k[3].ToString()).ToArray();
            string[] array4 = dt.Rows.OfType<DataRow>().Select(k => k[4].ToString()).ToArray();
            string[] array5 = dt.Rows.OfType<DataRow>().Select(k => k[5].ToString()).ToArray();
            string[] array6 = dt.Rows.OfType<DataRow>().Select(k => k[6].ToString()).ToArray();

            identificador.InnerText = "Identification: " + array0[0];
            name.InnerText = "Name:" + array1[0] + " "+ array2[0];
            phone.InnerText = "Phone:"+ array3[0];
            direction.InnerText = "Direction: "+ array4[0];
            email.InnerText = "Email: "+ array6[0];
            Fecha_nacimiento.InnerText = "Fecha de nacimiento: " + array5[0];

        }




    }
}