
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Banco_LasBrumas.Controller.ControllerPhone.cs" Inherits="Banco_LasBrumas.Controller.ControllerPhone" %>


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

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


    <style>
        .espacio {
            display: block;
            margin: 0% 15% 10% 15%;
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

   <script>


       function showUsers() {
           $("#boton").on("click", function () {

               dtUsers2();
           });
       }

       function dtUsers() {
           var myVar1 = document.getElementById("txtIdentificacion").value;
           if (myVar1 === "") {
               alert("Ingrese un NIS");
           } else {
               var table = $("#tablita").DataTable({
                   destroy: true,
                   responsive: true,
                   ajax: {
                       method: "POST",
                       url: "M5_Water.aspx/getUsers",
                       contentType: "application/json; charset=utf-8",
                       dataType: "json",
                       data: function (d) {
                           d.name = $("#txtIdentificacion").val();
                           return JSON.stringify(d);
                       }
                       ,
                       dataSrc: "d.data"
                   },
                   columns: [
                       { "data": "Identification" },
                       { "data": "Services" },
                       { "data": "Expiration" },
                       { "data": "Amount" },
                       { "data": "Interests" },
                       { "data": "Total" }
                   ]
               }); $('#tablita').css('width', '1000px');
           }
       }

       function dtUsers2() {
           var factu = "";
           var myVar1 = document.getElementById("txtIdentificacion").value;
           var myVar2 = document.getElementById("jeje").value;
           if (myVar1 === "") {
               alert("Ingrese un NIS");
           } else {
               var table = $("#tablita").DataTable({
                   destroy: true,
                   responsive: true,
                   ajax: {
                       method: "POST",
                       url: "M5_Phone.aspx/getUsers2",
                       contentType: "application/json; charset=utf-8",
                       dataType: "json",
                       data: function (d) {
                           d.nis = $("#txtIdentificacion").val();
                           d.provedor = $("#jeje").val();
                           return JSON.stringify(d);
                       }
                       , dataSrc: "d.data",
                       failure: function (d) {
                           alert("There are no bills to collect for this service or the number searched does not correspond to this provider");
                       },
                       error: function (d) {
                           alert("There are no bills to collect for this service or the number searched does not correspond to this provider");
                       }
                   },
                   columns: [
                       { "data": "Identification" },
                       { "data": "Services" },
                       { "data": "Expiration" },
                       { "data": "Amount" },
                       { "data": "Interests" },
                       { "data": "Total" }
                   ]
               }); $('#tablita').css('width', '1000px');



           }



       }

    </script>

	<!-- Latest jQuery minified -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!-- Latest compiled and minified JavaScript -->
   
    <script type="text/javascript" src="https://cdn.datatables.net/v/bs/dt-1.10.15/datatables.min.js"></script>
    <!-- Script Personalizado -->


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
            <div style="width: 100%;height: 100px; background-color: #232323; text-align: center; padding: 1% 5% 5% 5%;"><h1 class="titulo" style="color: white">Telephone payment</h1></div>
            <div style="  padding: 5% 15% 0% 15%;">
               
                    <div class="form-group">
                        <label for="email">Search phone number:</label>
                          <asp:TextBox ID="txtIdentificacion" runat="server"  class="form-control" placeholder="Enter the phone number" ></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="email">Telephone company:</label>
                         <asp:DropDownList ID="jeje"
								AutoPostBack="True"  class="form-control"
								runat="server">
							  <asp:ListItem Value=""> Choose your option </asp:ListItem>
							  <asp:ListItem Value="CLARO"> CLARO </asp:ListItem>
							  <asp:ListItem Value="ICE"> ICE </asp:ListItem>
							  <asp:ListItem Value="MOVISTAR"> MOVISTAR </asp:ListItem>
						</asp:DropDownList>
                    </div>
                 
					
         
						<center> <button type="button" id="boton" class="btn btn-success">
						<span class="glyphicon glyphicon-list" aria-hidden="true"></span> Search
						</button>
			</div>
			<br/>
			<br/>
			<br/>

			 <table id="tablita" class="table table-dark" style="margin-top: 2%">
					<thead>
					<tr>
					<th scope = "col"> INVOICE CODE </th>
					<th scope = "col"> IDENTIFICATION </th>
					<th scope = "col"> FULL NAME </th>
					<th scope = "col"> AMOUNT </th>
					<th scope = "col"> DATE </th>
					<th scope = "col"> STATUS </th>
					</tr>
					</thead>

			</table>


			 
                <script>
                    $(function () {
                        showUsers();
                    });
             </script>

           


            <div style="  padding: 0% 15% 40% 15%;">
                <div class="form-group">
                    <label for="email">Choose Account to pay:</label>
                    <asp:DropDownList ID="ddlLista" runat="server" CssClass="form-control" />
                </div>

                           
<div class="container">
  
           <asp:Button ID="btn_pagar"  class="btn btn-primary" runat="server" Text="Make Payment"   OnClick="btnrealizar" />
           <asp:Label ID="lb_mensaje" runat="server" Text="" Visible="false" ForeColor="black" ></asp:Label>
           <asp:Label ID="Label1" runat="server" Text="" Visible="true" ForeColor="black" ></asp:Label>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">Telephone payment</h4>
        </div>
        <div class="modal-body">
          <p>Payment done</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="location.href='M4_Services_Pay.aspx';" >Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
</div>

            </div>
        </div>
    </main>

    <footer style="background-color: #303030; color:white; width: 100%; height: 100px; padding: 10px ">

        <h3>Navigation</h3>
        <center>
            <p>© 2020 Copyright:<a style="text-align: center" href=""> Banco.com</a></p>
        </center>

    </footer>
    <!-- Footer -->
     </form>
</body>
</html>
