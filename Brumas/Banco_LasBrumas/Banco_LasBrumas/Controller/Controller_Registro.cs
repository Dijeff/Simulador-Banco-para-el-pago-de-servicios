using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Banco_LasBrumas.Controller
{
    public partial class Controller_Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Save_Client_click(object sender, EventArgs e)
        {
            try
            {

                string identification = Request[id.UniqueID];
                string name = Request[fname.UniqueID];
                string last_name = Request[lastname.UniqueID];
                string telephone = Request[tf.UniqueID];
                string address = Request[ad.UniqueID];
                string date = Request[DB.UniqueID];
                string email = Request[mail.UniqueID];
                string password = Request[pw.UniqueID];
                string answer1 = Request[a1.UniqueID];
                string answer2 = Request[a2.UniqueID];
                string answer3 = Request[a3.UniqueID];

                Banco_LasBrumas.Model.clsRegistro register = new Banco_LasBrumas.Model.clsRegistro();
                register.registro_Cliente(identification,name,last_name,telephone,address,date,email,password,answer1,answer2,answer3);
                Response.Redirect("M3_Login.aspx");

            }
            catch (Exception ex) { }

        }

    }
}