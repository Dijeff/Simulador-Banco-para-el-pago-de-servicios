using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Banco_LasBrumas.Controller
{
    public class Products_Account
    {
        private static string product_id = null;

        public Products_Account(string product_id)
        {
            Products_Account.product_id = product_id;
        }

        public Products_Account() { }

        public String getproduct_id()
        {
            return product_id;
        }

        public void setproduct_id(String product_id)
        {
            Products_Account.product_id = product_id;
        }
    }
}