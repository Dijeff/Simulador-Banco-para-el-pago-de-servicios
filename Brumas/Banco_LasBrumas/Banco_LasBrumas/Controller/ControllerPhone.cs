using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Banco_LasBrumas.Model;
using System.Web.Services;



namespace Banco_LasBrumas.Controller
{
    public partial class ControllerPhone : System.Web.UI.Page
    {
        protected void btnrealizar(object sender, EventArgs e)
        {

            if ((string.IsNullOrEmpty(ddlLista.Text))) throw new Exception("Ingrese el usuario y la contraseña");
            {
                Banco_LasBrumas.Model.clsAccounts accounts_info = new Banco_LasBrumas.Model.clsAccounts();
                float monto = float.Parse(Banco_LasBrumas.Model.Usuario.Amount1);
                string detail = "PHONE SERVICE PAYMENT";
                string tipo_proceso = "PAYMENT";
                string proceso = accounts_info.Verificar_transaccion(ddlLista.Text, monto, jeje.Text, detail, tipo_proceso);


                Banco_LasBrumas.mo.clsClientes obclsSedes = new Banco_LasBrumas.mo.clsClientes();
                List<Usuario> lista = new List<Usuario>();

                Banco_LasBrumas.Model.Usuario obclsSede = new Banco_LasBrumas.Model.Usuario();

                if (proceso.Equals("In process"))
                {

                    string dato = Banco_LasBrumas.Model.Usuario.Identification1;
                    string result = obclsSedes.pagowebservicesPhone(ddlLista.Text, jeje.Text, Convert.ToInt32(dato));

                    proceso = accounts_info.resultado_transaccion(ddlLista.Text, monto, jeje.Text, detail, tipo_proceso, "Successful");
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

        protected void Page_Load(object sender, EventArgs e)
        {

            string id = "304940495";
            Banco_LasBrumas.mo.clsClientes obclsSedes = new Banco_LasBrumas.mo.clsClientes();

            DataTable sedes = obclsSedes.Sedes_Bancarias(id);

            ddlLista.DataTextField = "num_tarjeta";

            ddlLista.DataValueField = "num_tarjeta";

            ddlLista.DataSource = sedes;

            ddlLista.DataBind();


        }

        [WebMethod]

        public static object getUsers2(string nis, string provedor)
        {
            string Identification = "";
            string Services = "";
            string Expiration = "";
            string Amount = "";
            string Interests = "";
            string Total = "";

            Banco_LasBrumas.mo.clsClientes obclsClientes = new Banco_LasBrumas.mo.clsClientes();

            List<string> dsConsulta = obclsClientes.WebServicePhone(Convert.ToInt32(nis), provedor);

            if (dsConsulta[0] == "El número buscado no corresponde a este proveedor")
            {

                Identification = dsConsulta[0];

                List<Usuario> lista = new List<Usuario>();

                lista.Add(new Usuario(Identification, Services, Expiration, Amount, Interests, Total));

                object json = new { data = lista };

                return json;




            }
            else if (dsConsulta[0] == "No hay facturas a cobro para este servicio")
            {

                Identification = dsConsulta[0];

                List<Usuario> lista = new List<Usuario>();

                lista.Add(new Usuario(Identification, Services, Expiration, Amount, Interests, Total));

                object json = new { data = lista };

                return json;

            }
            else
            {


                Identification = dsConsulta[0];
                Services = dsConsulta[1];
                Expiration = dsConsulta[2];
                Amount = dsConsulta[3];
                Interests = dsConsulta[4];
                Total = dsConsulta[5];



                List<Usuario> lista = new List<Usuario>();

                lista.Add(new Usuario(Identification, Services, Expiration, Amount, Interests, Total));

                object json = new { data = lista };

                return json;
            }
        }

        [WebMethod]

        public static object getUsers(string name)
        {
            string Identification = "";
            string Services = "";
            string Expiration = "";
            string Amount = "";
            string Interests = "";
            string Total = "";

            Banco_LasBrumas.mo.clsClientes obclsClientes = new Banco_LasBrumas.mo.clsClientes();
            DataSet dsConsulta = obclsClientes.stConsultarClientes(Convert.ToInt64(name));

            for (int i = 0; i < dsConsulta.Tables[0].Rows.Count; i++)
            {
                Identification = dsConsulta.Tables[0].Rows[i]["cod_cliente"].ToString();
                Services = dsConsulta.Tables[0].Rows[i]["tipo_servicio"].ToString();
                Expiration = dsConsulta.Tables[0].Rows[i]["vencimiento"].ToString();
                Amount = dsConsulta.Tables[0].Rows[i]["monto"].ToString();
                Interests = dsConsulta.Tables[0].Rows[i]["intereses"].ToString();
                Total = dsConsulta.Tables[0].Rows[i]["total"].ToString();


            }
            List<Usuario> lista = new List<Usuario>();

            lista.Add(new Usuario(Identification, Services, Expiration, Amount, Interests, Total));

            object json = new { data = lista };

            return json;
        }


    }
}
