﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Este código fue generado por una herramienta.
//     Versión de runtime:4.0.30319.42000
//
//     Los cambios en este archivo podrían causar un comportamiento incorrecto y se perderán si
//     se vuelve a generar el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Banco_LasBrumas.ServiceReference1 {
    
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Xml", "4.8.3752.0")]
    [System.SerializableAttribute()]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(Namespace="http://ws/")]
    public partial class InstantiationException : object, System.ComponentModel.INotifyPropertyChanged {
        
        private string messageField;
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified, Order=0)]
        public string message {
            get {
                return this.messageField;
            }
            set {
                this.messageField = value;
                this.RaisePropertyChanged("message");
            }
        }
        
        public event System.ComponentModel.PropertyChangedEventHandler PropertyChanged;
        
        protected void RaisePropertyChanged(string propertyName) {
            System.ComponentModel.PropertyChangedEventHandler propertyChanged = this.PropertyChanged;
            if ((propertyChanged != null)) {
                propertyChanged(this, new System.ComponentModel.PropertyChangedEventArgs(propertyName));
            }
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Xml", "4.8.3752.0")]
    [System.SerializableAttribute()]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(Namespace="http://ws/")]
    public partial class IllegalAccessException : object, System.ComponentModel.INotifyPropertyChanged {
        
        private string messageField;
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified, Order=0)]
        public string message {
            get {
                return this.messageField;
            }
            set {
                this.messageField = value;
                this.RaisePropertyChanged("message");
            }
        }
        
        public event System.ComponentModel.PropertyChangedEventHandler PropertyChanged;
        
        protected void RaisePropertyChanged(string propertyName) {
            System.ComponentModel.PropertyChangedEventHandler propertyChanged = this.PropertyChanged;
            if ((propertyChanged != null)) {
                propertyChanged(this, new System.ComponentModel.PropertyChangedEventArgs(propertyName));
            }
        }
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(Namespace="http://ws/", ConfigurationName="ServiceReference1.agua")]
    public interface agua {
        
        // CODEGEN: El parámetro 'return' requiere información adicional de esquema que no se puede capturar con el modo de parámetros. El atributo específico es 'System.Xml.Serialization.XmlElementAttribute'.
        [System.ServiceModel.OperationContractAttribute(Action="http://ws/agua/pagoRequest", ReplyAction="http://ws/agua/pagoResponse")]
        [System.ServiceModel.FaultContractAttribute(typeof(Banco_LasBrumas.ServiceReference1.InstantiationException), Action="http://ws/agua/pago/Fault/InstantiationException", Name="InstantiationException")]
        [System.ServiceModel.FaultContractAttribute(typeof(Banco_LasBrumas.ServiceReference1.IllegalAccessException), Action="http://ws/agua/pago/Fault/IllegalAccessException", Name="IllegalAccessException")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        [return: System.ServiceModel.MessageParameterAttribute(Name="return")]
        Banco_LasBrumas.ServiceReference1.pagoResponse pago(Banco_LasBrumas.ServiceReference1.pagoRequest request);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://ws/agua/pagoRequest", ReplyAction="http://ws/agua/pagoResponse")]
        System.Threading.Tasks.Task<Banco_LasBrumas.ServiceReference1.pagoResponse> pagoAsync(Banco_LasBrumas.ServiceReference1.pagoRequest request);
        
        // CODEGEN: El parámetro 'return' requiere información adicional de esquema que no se puede capturar con el modo de parámetros. El atributo específico es 'System.Xml.Serialization.XmlElementAttribute'.
        [System.ServiceModel.OperationContractAttribute(Action="http://ws/agua/hellRequest", ReplyAction="http://ws/agua/hellResponse")]
        [System.ServiceModel.FaultContractAttribute(typeof(Banco_LasBrumas.ServiceReference1.InstantiationException), Action="http://ws/agua/hell/Fault/InstantiationException", Name="InstantiationException")]
        [System.ServiceModel.FaultContractAttribute(typeof(Banco_LasBrumas.ServiceReference1.IllegalAccessException), Action="http://ws/agua/hell/Fault/IllegalAccessException", Name="IllegalAccessException")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        [return: System.ServiceModel.MessageParameterAttribute(Name="return")]
        Banco_LasBrumas.ServiceReference1.hellResponse hell(Banco_LasBrumas.ServiceReference1.hellRequest request);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://ws/agua/hellRequest", ReplyAction="http://ws/agua/hellResponse")]
        System.Threading.Tasks.Task<Banco_LasBrumas.ServiceReference1.hellResponse> hellAsync(Banco_LasBrumas.ServiceReference1.hellRequest request);
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.ServiceModel.MessageContractAttribute(WrapperName="pago", WrapperNamespace="http://ws/", IsWrapped=true)]
    public partial class pagoRequest {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Namespace="http://ws/", Order=0)]
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string name;
        
        [System.ServiceModel.MessageBodyMemberAttribute(Namespace="http://ws/", Order=1)]
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string arg1;
        
        [System.ServiceModel.MessageBodyMemberAttribute(Namespace="http://ws/", Order=2)]
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public int arg2;
        
        public pagoRequest() {
        }
        
        public pagoRequest(string name, string arg1, int arg2) {
            this.name = name;
            this.arg1 = arg1;
            this.arg2 = arg2;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.ServiceModel.MessageContractAttribute(WrapperName="pagoResponse", WrapperNamespace="http://ws/", IsWrapped=true)]
    public partial class pagoResponse {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Namespace="http://ws/", Order=0)]
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string @return;
        
        public pagoResponse() {
        }
        
        public pagoResponse(string @return) {
            this.@return = @return;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.ServiceModel.MessageContractAttribute(WrapperName="hell", WrapperNamespace="http://ws/", IsWrapped=true)]
    public partial class hellRequest {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Namespace="http://ws/", Order=0)]
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public int name;
        
        [System.ServiceModel.MessageBodyMemberAttribute(Namespace="http://ws/", Order=1)]
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string arg1;
        
        public hellRequest() {
        }
        
        public hellRequest(int name, string arg1) {
            this.name = name;
            this.arg1 = arg1;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.ServiceModel.MessageContractAttribute(WrapperName="hellResponse", WrapperNamespace="http://ws/", IsWrapped=true)]
    public partial class hellResponse {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Namespace="http://ws/", Order=0)]
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string @return;
        
        public hellResponse() {
        }
        
        public hellResponse(string @return) {
            this.@return = @return;
        }
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface aguaChannel : Banco_LasBrumas.ServiceReference1.agua, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class aguaClient : System.ServiceModel.ClientBase<Banco_LasBrumas.ServiceReference1.agua>, Banco_LasBrumas.ServiceReference1.agua {
        
        public aguaClient() {
        }
        
        public aguaClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public aguaClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public aguaClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public aguaClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
        Banco_LasBrumas.ServiceReference1.pagoResponse Banco_LasBrumas.ServiceReference1.agua.pago(Banco_LasBrumas.ServiceReference1.pagoRequest request) {
            return base.Channel.pago(request);
        }
        
        public string pago(string name, string arg1, int arg2) {
            Banco_LasBrumas.ServiceReference1.pagoRequest inValue = new Banco_LasBrumas.ServiceReference1.pagoRequest();
            inValue.name = name;
            inValue.arg1 = arg1;
            inValue.arg2 = arg2;
            Banco_LasBrumas.ServiceReference1.pagoResponse retVal = ((Banco_LasBrumas.ServiceReference1.agua)(this)).pago(inValue);
            return retVal.@return;
        }
        
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
        System.Threading.Tasks.Task<Banco_LasBrumas.ServiceReference1.pagoResponse> Banco_LasBrumas.ServiceReference1.agua.pagoAsync(Banco_LasBrumas.ServiceReference1.pagoRequest request) {
            return base.Channel.pagoAsync(request);
        }
        
        public System.Threading.Tasks.Task<Banco_LasBrumas.ServiceReference1.pagoResponse> pagoAsync(string name, string arg1, int arg2) {
            Banco_LasBrumas.ServiceReference1.pagoRequest inValue = new Banco_LasBrumas.ServiceReference1.pagoRequest();
            inValue.name = name;
            inValue.arg1 = arg1;
            inValue.arg2 = arg2;
            return ((Banco_LasBrumas.ServiceReference1.agua)(this)).pagoAsync(inValue);
        }
        
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
        Banco_LasBrumas.ServiceReference1.hellResponse Banco_LasBrumas.ServiceReference1.agua.hell(Banco_LasBrumas.ServiceReference1.hellRequest request) {
            return base.Channel.hell(request);
        }
        
        public string hell(int name, string arg1) {
            Banco_LasBrumas.ServiceReference1.hellRequest inValue = new Banco_LasBrumas.ServiceReference1.hellRequest();
            inValue.name = name;
            inValue.arg1 = arg1;
            Banco_LasBrumas.ServiceReference1.hellResponse retVal = ((Banco_LasBrumas.ServiceReference1.agua)(this)).hell(inValue);
            return retVal.@return;
        }
        
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
        System.Threading.Tasks.Task<Banco_LasBrumas.ServiceReference1.hellResponse> Banco_LasBrumas.ServiceReference1.agua.hellAsync(Banco_LasBrumas.ServiceReference1.hellRequest request) {
            return base.Channel.hellAsync(request);
        }
        
        public System.Threading.Tasks.Task<Banco_LasBrumas.ServiceReference1.hellResponse> hellAsync(int name, string arg1) {
            Banco_LasBrumas.ServiceReference1.hellRequest inValue = new Banco_LasBrumas.ServiceReference1.hellRequest();
            inValue.name = name;
            inValue.arg1 = arg1;
            return ((Banco_LasBrumas.ServiceReference1.agua)(this)).hellAsync(inValue);
        }
    }
}