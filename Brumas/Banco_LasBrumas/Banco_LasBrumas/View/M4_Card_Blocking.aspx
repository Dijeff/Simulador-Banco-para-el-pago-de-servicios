﻿
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Banco_LasBrumas.Controller.ControllerCardBlocking.cs" Inherits="Banco_LasBrumas.Controller.ControllerCardBlocking" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<title>Bank Brumas</title>
        <link rel="icon" href="../Menu%20Principal/ico.ico" type="image/x-icon">
	<link rel="stylesheet" href="css/estilos.css">
	<link rel="stylesheet" href="css/font-awesome.css">

	<script src="js/jquery-3.2.1.js"></script>
	<script src="js/main.js"></script>
        
        
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

        <style>
		.espacio {
			display: block;
			margin: 0% 15% 15% 15%;
		}

		@media screen and (max-width: 900px) {
			table {
				font-size: 10px;
			}
		}

		@media screen and (max-width: 700px) {
			table {
				font-size: 7px;
				font: bold;
			}
            .espacio {
			display: block;
			margin: 0% 15% 50% 15%;
		}
		}

		@media screen and (max-width: 500px) {

			.espacio {
				margin-top: 28%;
			}

			.titulo {
				font-size: 20px;
			}

			.ma {
				margin-top: 30%;
			}

			.column {
				width: 31%;
				display: block;
				margin-bottom: 20px;
			}
		}
	</style>
</head>
<body>
      <form id="form1" runat="server">
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
    <main style="margin-top: 11.8%">
        <div class="espacio">
            <div style="width: 100%;height: 150px; background-color: #232323; text-align: center; padding: 1% 5% 13% 5%;"><h3  class="titulo" style="color: white">Block Card</h3><h1  class="titulo" style="color: white">Report for loss or theft</h1></div>
 <div style="  padding: 5% 15% 40% 15%;">
     
        
         <div class="form-group">
         <label for="email">Choose Account:</label>
         <asp:DropDownList ID="ddlLista" runat="server" CssClass="form-control" />
             </div>

         
  


     
  
         <center> <asp:Button   ID="btnConsultar" runat="server"  OnClick="btnConsultar_Click" text="Blocking Card"  OnClientClick="alert('Your card has been blocked, contact technical support if you want to reactivate it!');" class="btn btn-primary"/> </center>
  

  

     </div>
     </div>
    </main>
    
    <footer style="background-color: #303030; color:white; width: 100%; height: 100%; padding: 10px " >
   
        <h3>Navigation</h3>
      <center>
      <p>© 2020 Copyright:<a  style="text-align: center" href=""> Banco.com</a></p>
      </center>

</footer>
<!-- Footer --></form>
</body>
</html>
