using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Banco_LasBrumas.Controller
{
    public class Nis_agua
    {
        private static string nis = null;

        public Nis_agua(string nis)
        {
            Nis_agua.nis = nis;
        }

        public Nis_agua() { }

        public String getnis()
        {
            return nis;
        }

        public void setnis(String nis)
        {
            Nis_agua.nis = nis;
        }
    }
}