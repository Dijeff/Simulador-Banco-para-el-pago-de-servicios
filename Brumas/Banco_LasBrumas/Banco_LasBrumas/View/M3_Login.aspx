<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Banco_LasBrumas.Controller.Controller_Login.cs" Inherits="Banco_LasBrumas.Controller.Controller_Login" %>

<!DOCTYPE html>
<html>
<head>
	<title>Animated Login Form</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet">
	<script src="https://kit.fontawesome.com/a81368914c.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
      <img src="img\Logo.png" alt="" width="200">
	<img class="wave" src="img/wave.png">
	<div class="container">
		<div class="img">
			<img src="img/bg.svg">
		</div>
		<div class="login-content">
			<form id="form1" runat="server">
				<img src="img/avatar.svg">
				<h2 class="title">Welcome</h2>
           		<div class="input-div one">
           		   <div class="i">
           		   		<i class="fas fa-user"></i>
           		   </div>
           		   <div class="div">
           		   		<%--<h5>Username</h5>--%>
           		   		 <asp:TextBox ID="txt_usuario" runat="server" CssClass="input" placeholder="User"></asp:TextBox>
           		   </div>
           		</div>
           		<div class="input-div pass">
           		   <div class="i"> 
           		    	<i class="fas fa-lock"></i>
           		   </div>
           		   <div class="div">
           		    	<%--<h5>Password</h5>--%>
           		    	<asp:TextBox ID="txt_contraseña" TextMode="Password" runat="server" CssClass="input"  placeholder="Password"></asp:TextBox>
            	   </div>
            	</div>
            	<a href="M7_preguntas.aspx">Forgot Password?</a>
            	<asp:Label ID="lb_mensaje" runat="server" Text="" Visible="false" ForeColor="Red"></asp:Label>
                <asp:Button ID="btn_ingresar" runat="server" Text="Login" CssClass="btn"  OnClick="btn_ingresar_Click" />
                <a text-align: center href="Home.aspx">Home</a>
            </form>
        </div>
    </div>
    <script type="text/javascript" src="js/main.js"></script>
</body>
</html>


