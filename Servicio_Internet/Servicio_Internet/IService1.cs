using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace Servicio_Internet
{
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de interfaz "IService1" en el código y en el archivo de configuración a la vez.
    [ServiceContract]
    public interface IService1
    {

        [OperationContract]
        double suma(double valA, double valB);
        [OperationContract]
        double resta(double valA, double valB);
        [OperationContract]
        string consulta(int numero_servicio, string proveedor);

        [OperationContract]
        string pago(string account, string proveedor, int factura);


    }


}
