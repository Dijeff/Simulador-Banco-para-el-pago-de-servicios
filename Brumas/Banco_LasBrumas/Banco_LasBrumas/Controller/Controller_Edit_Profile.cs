using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Banco_LasBrumas.Controller
{
    public partial class Controller_Edit_Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Session["cod_cliente"] as string;
            Banco_LasBrumas.Model.clsAccounts obclsSedes = new Banco_LasBrumas.Model.clsAccounts();
            DataTable dt = obclsSedes.Datos_Cliente(id);

            
            string[] array3 = dt.Rows.OfType<DataRow>().Select(k => k[3].ToString()).ToArray();
            string[] array4 = dt.Rows.OfType<DataRow>().Select(k => k[4].ToString()).ToArray();
            string[] array6 = dt.Rows.OfType<DataRow>().Select(k => k[6].ToString()).ToArray();
            string[] array7 = dt.Rows.OfType<DataRow>().Select(k => k[7].ToString()).ToArray();

            direction.Text= array4[0];
            email.Text= array6[0];
            phone.Text= array3[0];
            pass.Text = array7[0];


        }
        protected void Save_btn_Click(object sender, EventArgs e)
        {
            string Email = Request[email.UniqueID];
            string Phone = Request[phone.UniqueID];
            string Direction = Request[direction.UniqueID];
            string Password = Request[pass.UniqueID];


            string id = Session["cod_cliente"] as string;
            Banco_LasBrumas.Model.clsAccounts obclsSedes = new Banco_LasBrumas.Model.clsAccounts();
            obclsSedes.Editar_Cliente( id , Email,Phone,Direction,Password);
            Response.Redirect("M6_Edit_Profile.aspx");
        }

    }
}