<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Banco_LasBrumas.Controller.Controller_preguntas.cs" Inherits="Banco_LasBrumas.Controller.Controller_preguntas" %>

<!DOCTYPE html>
	<html xmlns="http://www.w3.org/1999/xhtml">
	<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<title>Questions</title>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
	<!--===============================================================================================-->	
		<link rel="icon" type="image/png" href="img/icons/favicon.ico"/>
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
	<!--===============================================================================================-->	
		<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
	<!--===============================================================================================-->	
		<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="css/util.css">
		<link rel="stylesheet" type="text/css" href="css/main.css">
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<!--===============================================================================================-->
	</head>
	<body>
		<div class="limiter">
			<div class="container-login100" style="background-image: url('img/bg-01.png');">
				<div class="wrap-login100">
					<form class="login100-form validate-form" runat="server" id="questions">
						<img class="img" src="img\logo.png" alt="" width="200">
						<br>
						<br>
						<div class="w3-container">
						<label class="label" for="idq">User</label>
						<input class="w3-input w3-border w3-round-large" type="text" id="idq" name="idq" runat="server"><br><br>
						<br>
						<label class="label" for="q1">1.What’s your favorite color?</label>
						<input class="w3-input w3-border w3-round-large" type="text" id="q1" name="q1" runat="server"><br><br>
						<label class="label" for="q2">2.¿What's the name of your pet?</label>
						<input class="w3-input w3-border w3-round-large" type="text" id="q2" name="q2" runat="server"><br><br>
						<label class="label" for="q3">3.¿What's your favorite movie?</label>
						<input class="w3-input w3-border w3-round-large" type="text" id="q3" name="q3" runat="server"><br><br>
						<br>
						<div class="">
							<asp:Button ID="btn_questions" class="btn btn-primary btn-lg" runat="server" OnClick="Save_Client_click" Text="Save" />
							<asp:Label ID="lb_mensaje" runat="server" Text="" Visible="false" ForeColor="Red"></asp:Label>
						</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		

		<div id="dropDownSelect1"></div>
		
	<!--===============================================================================================-->
		<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
		<script src="vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
		<script src="vendor/bootstrap/js/popper.js"></script>
		<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
		<script src="vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
		<script src="vendor/daterangepicker/moment.min.js"></script>
		<script src="vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
		<script src="vendor/countdowntime/countdowntime.js"></script>
	<!--===============================================================================================-->
		<script src="js/main.js"></script>

	</body>
	</html>