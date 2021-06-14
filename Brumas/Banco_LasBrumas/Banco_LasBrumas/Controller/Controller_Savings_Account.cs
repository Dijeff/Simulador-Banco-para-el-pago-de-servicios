﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Banco_LasBrumas.Controller
{
    public partial class Controller_Savings_Account : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Session["cod_cliente"] as string;

            Banco_LasBrumas.Model.clsProducts obclsSedes = new Banco_LasBrumas.Model.clsProducts();
            DataTable sedes = obclsSedes.View_Saving_Accounts(id);
            ddlLista.DataTextField = "id_cuenta";
            ddlLista.DataValueField = "id_cuenta";
            ddlLista.DataSource = sedes;
            ddlLista.DataBind();
        }

        protected void Consult_btn_Click(object sender, EventArgs e)
        {
            string account = Request[ddlLista.UniqueID];
            Products_Account cuenta = new Products_Account();
            cuenta.setproduct_id(account);
            Response.Redirect("M2_Savings_Account_Info.aspx");
        }

    }
}