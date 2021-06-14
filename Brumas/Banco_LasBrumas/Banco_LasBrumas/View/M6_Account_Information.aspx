<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Banco_LasBrumas.Controller.Controller_Account_Information.cs" Inherits="Banco_LasBrumas.Controller.Controller_Account_Information" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

	<meta charset="UTF-8"/>
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"/>
	<title>Account Information</title>
	<link rel="stylesheet" href="css/estilos.css"/>
	<link rel="stylesheet" href="css/font-awesome.css"/>


	<script src="js/jquery-3.2.1.js"></script>
	<script src="js/main.js"></script>

	<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous"/>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>
	<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>




</head>
<body>
	<header>
		<span id="button-menu" class="fa fa-bars"> Main menu</span>

		<nav class="navegacion">
			<ul class="menu">
				<!-- TITULAR -->
				<li class="title-menu">Movements</li>
				<!-- TITULAR -->

				<li><a href="M1_Home.aspx"><span class="fa fa-home icon-menu"></span>Home</a></li>

				<li class="item-submenu" menu="1">
					<a href="#"><span class="fa fa-credit-card icon-menu"></span>Products</a>
					<ul class="submenu">
						<li class="title-menu"><span class="fa fa-credit-card icon-menu"></span>Products</li>
						<li class="go-back">Back</li>

						<li><a href="M2_Savings_Account.aspx">Savings Account</a></li>
						<li><a href="M2_Credit_Card.aspx">Credit Card</a></li>
						<li><a href="M2_Loans.aspx">Loans</a></li>
						<li><a href="M2_Savings_Plan.aspx">Savings Plan</a></li>
					</ul>
				</li>

				<li><a href="M3_Transactions.aspx"><span class="fa fa-university icon-menu"></span>Transactions</a></li>

				<li class="item-submenu" menu="2">
					<a href="#"><span class="fa fa-files-o icon-menu"></span>Management</a>
					<ul class="submenu">
						<li class="title-menu"><span class="fa fa-files-o icon-menu"></span>Management</li>
						<li class="go-back">Back</li>

						<li><a href="M4_Services_Pay.aspx">Services Pay</a></li>
						<li><a href="M4_Card_Blocking.aspx">Card Blocking</a></li>
						<li><a href="M4_New_Loan.aspx">New Loan</a></li>
					</ul>
				</li>


				<li class="item-submenu" menu="3">
					<a href="#"><span class="fa fa-user-circle icon-menu"></span>Account</a>
					<ul class="submenu">
						<li class="title-menu"><span class="fa fa-user-circle icon-menu"></span>Account</li>
						<li class="go-back">Back</li>

						<li><a href="M6_Account_information.aspx">Account Information</a></li>
						<li><a href="M6_Edit_Profile.aspx">Edit Profile</a></li>
						<li><a href="M6_Technical_Support.aspx">Technical Support</a></li>
						<li><a href="Home.aspx">Logout</a></li>
					</ul>
				</li>
			</ul>
		</nav>

		<img src="imagen.png">

	</header>

		

	<div data-role="main" style="width:100%">
        <div class="ma">
			<form id="form1" runat="server" class="form-horizontal" >
			<div class="row"> 
				<div class="col-md">
					<div  style="padding: 0 25% 0 25%" class="column"></div>
	  				<div class="card" style="width:100%">
		  				<img class="card-img-top" src="user1.png" alt="Card image" >
		   				<div class="card-body">
			 				<h4 class="card-title">Account</h4>
							 <label id="identificador" runat="server" name="identificador">Identification: 303330333 </label>
							 <label id="name" runat="server" name="name">Name: Juan Carlos Fallas Rojas </label>
							 <label id="email" runat="server" name="email">Email: juanquiloco@mail.com </label>
							 <label id="phone" runat="server" name="phone">Phone: 62875654 </label>
							 <label id="direction" runat="server" name="direction">Direction: 450m de la Iglesia de Barba Heredia</label>
							 <label id="Fecha_nacimiento" runat="server" name="Fecha_nacimiento">Fecha de nacimiento: 2000-10-12</label>
		  				</div>
					  </div>
				</div>
			</div> 
			</form>
		</div>
	</div>

	<footer style="background-color: #303030; color:white; width: 100%; height: 100px; padding: 10px " >
		<h3>Navigation</h3>
		<center>
		<p>© 2020 Copyright:<a  style="text-align: center" href=""> Banco.com</a></p>
		</center>
	</footer>



</body>
</html>
