using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Banco_LasBrumas.Model
{
    public class Usuario
    {

        
        public Usuario()
        {
          
        }

        public Usuario(string Identification, string Services, string Expiration, string Amount, string Interests, string Total)
        {

            Usuario.Identification1 = Identification;
            Usuario.Amount1 = Amount;
            this.Identification = Identification;
            this.Services = Services;
            this.Expiration = Expiration;
            this.Amount = Amount;
            this.Interests = Interests;
            this.Total = Total;

        }
        public static string Identification1 { get; private set; }
        public string Identification { get; private set; }
        public string Services { get; private set; }
        public string Expiration { get; private set; }
        public static string Amount1 { get; private set; }
        public string Amount { get; private set; }
        public string Interests { get; private set; }
        public string Total { get; private set; }

    }
}