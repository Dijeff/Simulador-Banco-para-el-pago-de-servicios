using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using Banco_LasBrumas.mo;

namespace Banco_LasBrumas.co
{
    public class clsConexion
    {
        public string stGetConexion()
        {
            return ConfigurationManager.ConnectionStrings["cnn"].ToString();
        }
    }
}

namespace Banco_LasBrumas.co
{
    class co 
    {
    }
}